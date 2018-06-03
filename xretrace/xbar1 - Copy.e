#include "slick.sh"
#import "se/ui/toolwindow.sh"

#import "dlinklist.e"
#import "xretrace.e"

defeventtab xbar1;

 
struct xbar_form_data {
   int wid;
   int curr_line;
   int nof_lines;
   int buf_id;
   boolean modified;
   int edit_buf_wid;
   int num_marker_rows;
   boolean no_markup;
   boolean close_me;
   int listbox_row_bitmap_id[];
   int listbox_row_associated_line_number[];
};
 
int pic_visited_line;
int pic_changed_line;
int pic_old_changed_line;
int pic_bookmark_line;
int pic_blank_line;
int pic_scrollbar_image;
int pic_changed_and_bookmarked_line;

boolean xbar_update_needed;  // global for all xbar forms

xbar_form_data xbar_forms[];

#define GRAY 0X00A8A8A8
#define RED_MINUS1 0x000000FE

// void xbar1.rbutton_down()
// {
//    //p_active_form._delete_window();
// }


_command void xyz() name_info(',')
{
   _mdi.p_child._scroll_page('d',5);
}

static int pix2scale(int pix,int wid)
{
   return _dx2lx(wid.p_xyscale_mode, pix);
}


static int scale2pix(int scale,int wid)
{
   return _lx2dx(wid.p_xyscale_mode, scale);
}


static int right_mouse_xbar_form_id;

_command xbar1_close()
{
   xbar_forms[right_mouse_xbar_form_id].close_me = true;
   xbar_update_needed = true;
}


_command void xretrace_set_bookmark_for_buffer() name_info(',')
{
   xretrace_add_bookmark_for_buffer(_mdi.p_child.p_buf_name, _mdi.p_child, _mdi.p_child.p_line, _mdi.p_child.p_col); 
}

_command void xretrace_clear_bookmark_for_buffer() name_info(',')
{
   xretrace_remove_bookmark_for_buffer(_mdi.p_child.p_buf_name, _mdi.p_child.p_line); 
}


static void process_right_mouse_click(int wid, int edwin, int formid)
{
   int wid2 = p_window_id;

   right_mouse_xbar_form_id = formid;

   #if 1
   int index = find_index("xbar1_popup_menu",oi2type(OI_MENU));
   if (!index) {
      return;
   }
   int menu_handle=p_active_form._menu_load(index,'P');

   // build the menu

   _menu_insert(menu_handle,-1,MF_ENABLED,
                "&Close ",
                "xbar1_close","","",'');

   _menu_insert(menu_handle,-1,MF_ENABLED,
                "&Bookmark line " :+ edwin.p_line,
                "xretrace_set_bookmark_for_buffer", "", "",'');

   _menu_insert(menu_handle,-1,MF_ENABLED,
                "&Clear bookmark at line " :+ edwin.p_line,
                "xretrace_clear_bookmark_for_buffer", "", "",'');



   // Show the menu.
   int x =100;
   int y=100;
   x=mou_last_x('M')-x;y=mou_last_y('M')-y;
   _lxy2dxy(p_scale_mode,x,y);
   _map_xy(p_window_id,0,x,y,SM_PIXEL);
   int flags=VPM_LEFTALIGN|VPM_RIGHTBUTTON;
   int status=_menu_show(menu_handle,flags,x,y);
   _menu_destroy(menu_handle);

   //say("mmmm");
   // set the focus back
   // 
   //if (_mdi.p_child._no_child_windows()==0) {
   //   _mdi.p_child._set_focus();
   //}
   p_window_id = wid2;
   #endif
}


void set_scrollbar_handle_location_from_curr_line(int wid, int editor_wid)
{
   _control scrollbar_image;
   _control scrollbar_handle_image;
   _control current_line_image;

   int distance_100K = (editor_wid.p_line * 100000) / editor_wid.p_Noflines;
   wid.current_line_image.p_y = wid.scrollbar_image.p_height * distance_100K / 100000;

   int lines_per_screen = editor_wid.p_client_height / editor_wid.p_font_height;
   int ratio100k = lines_per_screen * 100000 / editor_wid.p_Noflines;
   int ht = ratio100k * wid.scrollbar_image.p_height / 100000;
   if ( ht < pix2scale(20, wid) ) {
      ht = pix2scale(20, wid);
   }
   wid.scrollbar_handle_image.p_height = ht;
   wid.scrollbar_handle_image.p_y = wid.current_line_image.p_y - (wid.scrollbar_handle_image.p_height / 2);
}


#define PIXELS_PER_LISTBOX_LINE 5

void set_control_sizes(int wid, int k)
{
   _control ctllist1;
   _control scrollbar_image;
   _control scrollbar_handle_image;
   _control current_line_image;

   wid.ctllist1.p_height = wid.p_height;
   wid.ctllist1.p_width = wid.p_width;
   wid.ctllist1.p_x = 0;

   wid.scrollbar_handle_image.p_width = pix2scale(4, wid);
   wid.scrollbar_handle_image.p_x = wid.ctllist1.p_x;

   wid.scrollbar_image.p_height = wid.p_height;
   wid.scrollbar_image.p_width = wid.p_width;
   wid.scrollbar_image.p_x = wid.ctllist1.p_x;
   wid.scrollbar_image.p_y = wid.ctllist1.p_y;

   wid.current_line_image.p_width = wid.p_width;
   wid.current_line_image.p_height = pix2scale(2,wid);
   wid.current_line_image.p_x = wid.ctllist1.p_x;

   // using text_height works only when the text height is greater than the bitmap height
   // xbar_forms[k].num_marker_rows = wid.ctllist1.p_client_height intdiv
   //                                  (_ly2dy( wid.p_xyscale_mode,wid.ctllist1._text_height()) + 2);

   // bitmap height is 2 pixels with 2 pix between bitmaps  -  2 + 2 = 4
   xbar_forms[k].num_marker_rows = wid.ctllist1.p_client_height intdiv PIXELS_PER_LISTBOX_LINE; 
}


static int GetEditorCtlWid(int wid)
{
   int editorctl_wid = wid._MDIGetActiveMDIChild();
   if ( editorctl_wid != null && _iswindow_valid(editorctl_wid) && editorctl_wid._isEditorCtl()) {
      return editorctl_wid;
   }
   if (_no_child_windows()) 
      return -1;

   return _mdi.p_child;
}


void set_edwin_current_line_from_cursor_y(int wid, int edwin)
{
   _control scrollbar_image;
   int xl = (wid.scrollbar_image.mou_last_y() * 100000 / 
               scale2pix(wid.scrollbar_image.p_height, wid)) * edwin.p_Noflines / 100000;
   if ( xl <= 0 ) {
      xl = 1;
   }
   if ( xl > edwin.p_Noflines ) {
      xl = edwin.p_Noflines;
   }
   edwin.p_line = xl;
   edwin.center_line();
}



// scrollbar_image.wheel_up()
// {
//    int edwin = GetEditorCtlWid(p_active_form);
//    edwin.up(1);
// }
// 
// scrollbar_image.wheel_down()
// {
//    int edwin = GetEditorCtlWid(p_active_form);
//    edwin.down(1);
// }

//

static void set_scrollbar_handle_colour(int colour, int edwin)
{
   _control scrollbar_handle_image;
   _control current_line_image;

   if ( colour == GRAY && edwin.p_modify ) 
      p_active_form.scrollbar_handle_image.p_backcolor = RED_MINUS1;  // red minus one
   else
      p_active_form.scrollbar_handle_image.p_backcolor = colour;

   p_active_form.current_line_image.p_backcolor = colour;
}


static int find_nearest_marker(int formid, int wid)
{
   _control scrollbar_image;

   if ( xbar_forms[formid].no_markup ) {
      //say('no markup');
      return -1;
   }
   int max_rows = xbar_forms[formid].num_marker_rows;
   if ( max_rows > xbar_forms[formid].listbox_row_associated_line_number._length() ) {
      max_rows = xbar_forms[formid].listbox_row_associated_line_number._length();
   }
   int listbox_row = wid.scrollbar_image.mou_last_y() / PIXELS_PER_LISTBOX_LINE;
   if ( listbox_row >= max_rows ) {
      listbox_row = max_rows - 1;
   }
   // find the nearest marker
   int k1 = 0, k2 = 0;
   while ( k1 < 3 && listbox_row >= k1 ) {
      if ( xbar_forms[formid].listbox_row_associated_line_number[listbox_row - k1] > 0 ) {
         break;
      }
      ++k1;
   }
   while ( (k2 < 3) && (listbox_row + k2 < max_rows) ) {
      if ( xbar_forms[formid].listbox_row_associated_line_number[listbox_row + k2] > 0 ) {
         break;
      }
      ++k2
   }
   //say( ' ' :+ max_rows :+ ' ' :+ listbox_row :+ ' ' :+ k1 :+ ' ' k2);
   if ( k1 < k2 ) {
      return listbox_row - k1;
   }
   else if (k2 < k1) {
      return listbox_row + k2;
   }
   if ( k1 < 3 ) {
      return listbox_row - k1;
   }
   //say('minus 1');
   return -1;
}

// _IsKeyDown(CTRL)

scrollbar_image.mouse_move()
{
   _control scrollbar_handle_image;
   _control current_line_image;

   //boolean first_time = true;

   //int x_on_entry = wid.mou_last_x();
   //int y_on_entry = wid.mou_last_y();

   //int y_last, y_now, num;
   //int x_last, x_now, proc_count;
   //boolean prev_y_greater_x;

   int edwin = GetEditorCtlWid(p_active_form);
   int xbar_wid = p_active_form;
   int formid = find_xbar_form_from_wid(xbar_wid);
   int listbox_row;
   int max_rows;

   int start_line  = edwin.p_line;
   int exit_line = edwin.p_line;
   int start_col = edwin.p_col;
   boolean lock_line = false;
   boolean spacebar_lock = false;
   boolean spacebar_direction = true;  // true is down

   int my1 = xbar_wid.scrollbar_image.mou_last_y();
   int mx1 = xbar_wid.scrollbar_image.mou_last_x();


   close_me = 0;
   _set_timer(3000);
   mou_mode(1);
   mou_capture();
   boolean exit_event_loop = false;

   while (!exit_event_loop) {
      _str event = get_event();
      //say(event2name(event));
      int mxnow = xbar_wid.scrollbar_image.mou_last_x();
      int mynow = xbar_wid.scrollbar_image.mou_last_y();

      switch (event) {

      case ON_TIMER :
         exit_event_loop = true;
         edwin._set_focus();
         break;
      case MOUSE_MOVE:
         if ( (mxnow > (scale2pix(xbar_wid.scrollbar_image.p_width, xbar_wid))) || (mxnow < 0) )  {
            _kill_timer();
            mou_mode(0);
            mou_release();
            set_scrollbar_handle_colour(GRAY, edwin);  // gray
            return 0;
         }
         int xd = abs(mxnow - mx1);
         int yd = abs(mynow - my1);
         if ( xd > 10 || yd > 10 ) {
            if ( (yd > xd) && (mxnow > 15) ) {
               exit_event_loop = true;
               edwin._set_focus();
               break;
            }
            mx1 = mxnow;
            my1 = mynow;
         }
         break;
      case LBUTTON_DOWN:
         int lr = find_nearest_marker(formid, xbar_wid);
         if ( (lr > 0) && (xbar_forms[formid].listbox_row_associated_line_number[lr] > 0) ) {
            edwin.p_line = xbar_forms[formid].listbox_row_associated_line_number[lr];
            edwin.center_line();
            lock_line = true;
            exit_line = edwin.p_line;
            set_scrollbar_handle_colour(0x00277FFF, edwin);   // orange
            set_scrollbar_handle_location_from_curr_line(xbar_wid, edwin);
            edwin._set_focus();
            exit_event_loop = true;
            //message('click');
            break;
         }

         set_edwin_current_line_from_cursor_y(xbar_wid, edwin); 
         if ( lock_line ) {
            lock_line = false;
            exit_line = start_line;
            set_scrollbar_handle_colour(0X000dd252, edwin);
         }
         else
         {
            lock_line = true;
            exit_line = edwin.p_line;
            set_scrollbar_handle_colour(0x000000C0, edwin);
         }
         set_scrollbar_handle_location_from_curr_line(xbar_wid, edwin);
         break;

      case RBUTTON_DOWN:
      case RBUTTON_UP:
         mou_mode(0);
         mou_release();
         set_scrollbar_handle_colour(GRAY, edwin);  // gray
         edwin.p_line = exit_line;
         edwin.center_line();
         edwin._set_focus();  // so that _mdi.p_child is correct
         process_right_mouse_click(xbar_wid, edwin, formid);
         return 0;
      }
   }

   _kill_timer();
   if ( !lock_line ) {
      set_scrollbar_handle_colour(0X000dd252, edwin);
      set_edwin_current_line_from_cursor_y(xbar_wid, edwin); 
   }

   exit_event_loop = false;
   update_xbar_forms(true);

   while (!exit_event_loop) {
      _str event = get_event();
      //say(event2name(event));

      if ( xbar_forms[formid].close_me ) {
         mou_mode(0);
         mou_release();
         set_scrollbar_handle_colour(GRAY, edwin);  // gray
         edwin.p_line = exit_line;
         edwin.center_line();
         return 0;
      }
      int mx = xbar_wid.scrollbar_image.mou_last_x();
      int mynow = xbar_wid.scrollbar_image.mou_last_y();
      update_xbar_forms(true);
      switch (event) {
      default:
         mou_mode(0);
         mou_release();
         set_scrollbar_handle_colour(GRAY, edwin);  // gray
         edwin.p_line = exit_line;
         edwin.center_line();
         return 0;

      // these don't work
      //case WHEEL_UP:
      //   say('uppp');
      //   edwin.up(4);
      //   break;
      //  
      //case WHEEL_DOWN:
      //   say('down');
      //   edwin.down(4);
      //   break;

      case 'ESC' :
         set_scrollbar_handle_colour(GRAY, edwin);  // gray
         edwin.p_line = start_line;
         edwin.center_line();
         mou_mode(0);
         mou_release();
         return 0;   

      case 'c':  // the keys just above the spacebar
      case 'C':
      case 'v':
      case 'V':
      case 'b':
      case 'B':
      case 'n':
      case 'N':
      case 'm':
      case 'M':
         if ( !spacebar_lock ) 
            break;
         spacebar_direction = !spacebar_direction;
         // fall through
      case ' ':
         if ( xbar_forms[formid].no_markup ) break;
         int max_rows = xbar_forms[formid].num_marker_rows;
         if ( max_rows > xbar_forms[formid].listbox_row_associated_line_number._length() ) {
            max_rows = xbar_forms[formid].listbox_row_associated_line_number._length();
         }

         if ( !spacebar_lock ) {
            listbox_row = xbar_wid.scrollbar_image.mou_last_y() / PIXELS_PER_LISTBOX_LINE;
            if ( listbox_row >= max_rows ) {
               listbox_row = max_rows - 1;
            }
         }
         else  {
            if ( spacebar_direction ) {
               if ( ++listbox_row >= max_rows ) {
                  listbox_row = 0;
               }
            } 
            else if ( --listbox_row < 0 ) {
               listbox_row = max_rows - 1;
            }
         }

         while ( 1 ) {
            if ( xbar_forms[formid].listbox_row_associated_line_number[listbox_row] > 0 ) {
               edwin.p_line = xbar_forms[formid].listbox_row_associated_line_number[listbox_row];
               edwin.center_line();
               exit_line = edwin.p_line;
               lock_line = true;
               spacebar_lock = true;
               set_scrollbar_handle_colour(0x000000C0, edwin);
               set_scrollbar_handle_location_from_curr_line(xbar_wid, edwin);
               break;
            }
            if ( spacebar_direction ) {
               if ( ++listbox_row >= max_rows ) {
                   listbox_row = 0;
               }
            } 
            else if ( --listbox_row < 0 ) {
               listbox_row = max_rows - 1;
            }
         }
         break;

      case MOUSE_MOVE:
         if ( !spacebar_lock ) {
            spacebar_direction = xbar_wid.scrollbar_image.mou_last_y() > my1;
            my1 = xbar_wid.scrollbar_image.mou_last_y();

            // don't exit if locked with spacebar
            if ( (mx > (scale2pix(xbar_wid.scrollbar_image.p_width, xbar_wid) + 15)) 
                 || (mx < -15) || (xbar_wid.scrollbar_image.mou_last_y() <= 0)
                 || (xbar_wid.scrollbar_image.mou_last_y('M') >= xbar_wid.scrollbar_image.p_height )  )  
            {
               mou_mode(0);
               mou_release();
               set_scrollbar_handle_colour(GRAY, edwin);   // gray
               edwin.p_line = exit_line;
               edwin.center_line();
               return 0;
            }
         }
         if ( !lock_line ) {
            set_edwin_current_line_from_cursor_y(xbar_wid, edwin); 
         }
         break;

      case LBUTTON_UP:
         break;

      case LBUTTON_DOWN:
         if ( mx < 16 ) {
            int lr = find_nearest_marker(formid, xbar_wid);
            if ( (lr > 0) && (xbar_forms[formid].listbox_row_associated_line_number[lr] > 0) ) {
               edwin.p_line = xbar_forms[formid].listbox_row_associated_line_number[lr];
               edwin.center_line();
               lock_line = true;
               exit_line = edwin.p_line;
               set_scrollbar_handle_colour(0x00277FFF, edwin);   // orange
               set_scrollbar_handle_location_from_curr_line(xbar_wid, edwin);
               edwin._set_focus();
               break;
            }
         }
         set_edwin_current_line_from_cursor_y(xbar_wid, edwin); 
         spacebar_lock = false;
         if ( lock_line ) {
            lock_line = false;
            exit_line = start_line;
            set_scrollbar_handle_colour(0X000dd252, edwin);
         }
         else
         {
            lock_line = true;
            exit_line = edwin.p_line;
            set_scrollbar_handle_colour(0x000000C0, edwin);
         }
         break;

      case RBUTTON_DOWN:
      case RBUTTON_UP:
         mou_mode(0);
         mou_release();
         set_scrollbar_handle_colour(GRAY, edwin);  // gray
         edwin.p_line = exit_line;
         edwin.center_line();
         edwin._set_focus();  // so that _mdi.p_child is correct
         process_right_mouse_click(xbar_wid, edwin, formid);
         return 0;
      }
   }
}


int find_xbar_form_from_wid(int wid)
{
   int k;
   for ( k = 0; k < xbar_forms._length(); ++k  ) {
      if ( xbar_forms[k].wid == wid ) {
         return k;
      }
   }
   return -1;
}

// 

int register_xbar_form(int wid)
{
   int k = find_xbar_form_from_wid(wid);
   if ( k < 0 ) {
      for ( k = 0; k < xbar_forms._length(); ++k ) {
         if ( xbar_forms[k].wid == -1 ) {
            // found a free one
            break;
         }
      }
      xbar_forms[k].wid = wid;
   }
   return k;
}



void xbar1.on_create()
{
   scrollbar_image.p_picture = pic_scrollbar_image;
   int k = register_xbar_form(p_window_id);
   set_control_sizes(p_window_id, k); 

   if ( k >= 0 ) {
      if ( ! _no_child_windows() ) {
         int edwin = GetEditorCtlWid(p_window_id);
         xbar_forms[k].curr_line = edwin.p_line;
         xbar_forms[k].nof_lines = edwin.p_Noflines;
         xbar_forms[k].buf_id = edwin.p_buf_id;
         xbar_forms[k].modified = edwin.p_modify;
         xbar_forms[k].edit_buf_wid = edwin;
         set_scrollbar_handle_location_from_curr_line(p_window_id, edwin);
         xbar_forms[k].no_markup = true;
         xbar_forms[k].close_me = false;
         xbar_update_needed = true;
      }
      else
      {
         xbar_forms[k].edit_buf_wid = -1;
      }
   }
}


void xbar1.on_destroy()
{
   int k = find_xbar_form_from_wid(p_window_id);
   if ( k >= 0 ) {
      xbar_forms[k].wid = -1;
   }
}


void xbar1.on_resize()
{
   int k = find_xbar_form_from_wid(p_window_id);
   set_control_sizes(p_window_id, k);
   if ( _no_child_windows() || k < 0 ) {
      return;
   }
   int edit_wid = GetEditorCtlWid(p_window_id);
   xbar_forms[k].curr_line = edit_wid.p_line;
   xbar_forms[k].nof_lines = edit_wid.p_Noflines;
   xbar_forms[k].buf_id = edit_wid.p_buf_id;
   xbar_forms[k].modified = edit_wid.p_modify;
   xbar_forms[k].edit_buf_wid = edit_wid;
   xbar_forms[k].no_markup = true;  // regenerate
   set_scrollbar_handle_location_from_curr_line(p_window_id, edit_wid);
   xbar_update_needed = true;
}

// 

static void add_markup_from_list(dlist & alist, int bitmap, int edwin, int formid, int bitmap2 = 0)
{
   xretrace_item * ip;
   VSLINEMARKERINFO info1;

   dlist_iterator iter = dlist_begin(alist);
   for( ; dlist_iter_valid(iter); dlist_next(iter)) {
      ip = dlist_getp(iter);
      if (ip->marker_id_valid && (_LineMarkerGet(ip->line_marker_id, info1) == 0)) {
         ip->last_line = info1.LineNum;
      }
      if ( ip->last_line > 0 ) {
         int index = (int)((double)(xbar_forms[formid].num_marker_rows * ip->last_line) / edwin.p_Noflines + 0.5) + 1;
         if ( index >= xbar_forms[formid].num_marker_rows ) {
            index = xbar_forms[formid].num_marker_rows - 1;
         }
         if ( (bitmap2 > 0) && (ip->flags & MARKER_WAS_ALREADY_HERE_ON_OPENING) ) 
         {
            xbar_forms[formid].listbox_row_bitmap_id[index] = bitmap2;
         }
         else
         {
            if ( xbar_forms[formid].listbox_row_bitmap_id[index] == pic_changed_line && bitmap == pic_bookmark_line ) {
               xbar_forms[formid].listbox_row_bitmap_id[index] = pic_changed_and_bookmarked_line;
            }
            else
               xbar_forms[formid].listbox_row_bitmap_id[index] = bitmap;
         }

         xbar_forms[formid].listbox_row_associated_line_number[index] = ip->last_line;
         //("aa2 " :+ index :+ " " :+ ip->last_line);
      }
   }
}


// add_markup_to_xbar_for_edwin is called from xretrace timer callback when an xretrace 
// list changes and at startup.  It re-generates the markup for the specified edit window.
void add_markup_to_xbar_for_edwin(int edwin, dlist & visited_list, dlist & changed_list, dlist & bookmark_list)
{
   _control ctllist1;

   if ( _no_child_windows() ) {
      return;
   }

   // dlist_iterator iter = dlist_begin(visited_list);
   // if ( !dlist_iter_valid(iter) ) {
   //    return;
   // }
   // iter = dlist_begin(changed_list);
   // if ( !dlist_iter_valid(iter) ) {
   //    return;
   // }
   
   int wid = p_window_id;
   int formid;
   for ( formid = 0; formid < xbar_forms._length(); ++formid ) {
      if ( xbar_forms[formid].wid > 0 ) {
         int edit_wid = GetEditorCtlWid(xbar_forms[formid].wid);
         if ( edit_wid == edwin ) {
            int h;
            xbar_forms[formid].listbox_row_bitmap_id._makeempty();
            for ( h = 0; h < xbar_forms[formid].num_marker_rows; ++h ) {
               xbar_forms[formid].listbox_row_bitmap_id[h] = pic_blank_line;
               xbar_forms[formid].listbox_row_associated_line_number[h] = -1;
            }
            add_markup_from_list(visited_list, pic_visited_line, edwin, formid);
            add_markup_from_list(changed_list, pic_changed_line, edwin, formid, pic_old_changed_line);
            add_markup_from_list(bookmark_list, pic_bookmark_line, edwin, formid);

            xbar_forms[formid].wid.ctllist1._lbclear();

            for ( h = 0; h < xbar_forms[formid].listbox_row_bitmap_id._length(); ++h ) {
               xbar_forms[formid].wid.ctllist1._lbadd_item("", 0, xbar_forms[formid].listbox_row_bitmap_id[h]);
            }
            // xretrace will keep trying to add markup until no_markup goes false
            xbar_forms[formid].no_markup = false;
         }
      }
   }
   p_window_id = wid;
}


// update_xbar_forms is called from xretrace timer callback - maintain_cursor_retrace_history - on 
// every callback - default rate is every 250 ms.
// it deletes an xbar form when needed and updates the position of the scrollbar handle
// return value is positive window ID if an xbar form needs markup added
int update_xbar_forms(boolean event_loop = false)
{
   _control scrollbar_handle_image;
   int no_markup_wid = -1;
   if ( _no_child_windows() ) {
      return -1;
   }
   //if ( !xbar_update_needed ) {
   //   return -1;
   //}

   int wid = p_window_id;
   int k;
   for ( k = 0; k < xbar_forms._length(); ++k ) {
      if ( xbar_forms[k].wid > 0 ) {
         if ( !event_loop && xbar_forms[k].close_me ) {
            xbar_forms[k].wid._delete_window();
            continue;
         }

         int edit_wid = GetEditorCtlWid(xbar_forms[k].wid);

         if ( xbar_forms[k].edit_buf_wid == edit_wid ) {
            if ( xbar_forms[k].curr_line == edit_wid.p_line  &&
                 xbar_forms[k].nof_lines == edit_wid.p_Noflines  &&
                 xbar_forms[k].buf_id == edit_wid.p_buf_id  &&
                 xbar_forms[k].modified == edit_wid.p_modify   )   {
               continue;
            }
         }
         xbar_forms[k].curr_line = edit_wid.p_line;
         xbar_forms[k].nof_lines = edit_wid.p_Noflines;
         xbar_forms[k].buf_id = edit_wid.p_buf_id;
         xbar_forms[k].edit_buf_wid = edit_wid;
         xbar_forms[k].modified = edit_wid.p_modify;
         if ( (xbar_forms[k].wid.scrollbar_handle_image.p_backcolor == GRAY) && edit_wid.p_modify ) {
            xbar_forms[k].wid.scrollbar_handle_image.p_backcolor = RED_MINUS1;
         }
         else if ( (xbar_forms[k].wid.scrollbar_handle_image.p_backcolor == RED_MINUS1) && !edit_wid.p_modify) {
                 xbar_forms[k].wid.scrollbar_handle_image.p_backcolor = GRAY;
         }
         set_scrollbar_handle_location_from_curr_line(xbar_forms[k].wid, edit_wid);
         if ( xbar_forms[k].no_markup ) {
            no_markup_wid = edit_wid;
         }
      }
   }
   xbar_update_needed = false;
   p_window_id = wid;
   return no_markup_wid;
}


void _on_load_module_xbar1(_str module_name)
{
   _str sm = strip(module_name, "B", "\'\"");
   if (strip_filename(sm, 'PD') == 'xbar1.e') {
      //xretrace_kill_timer();
   }
}


_command void delete_xbar_windows() name_info(',')
{
   for ( k = 0; k < xbar_forms._length(); ++k ) {
      if ( xbar_forms[k].wid > 0 ) {
            xbar_forms[k].wid._delete_window();
      }
   }
}


definit()   
{
   tw_register_form('xbar1', TWF_SUPPORTS_MULTIPLE, DOCKAREAPOS_NONE);  
   //if (arg(1) != "L") {
      // not a load command
   xbar_forms._makeempty();
   //}

   pic_scrollbar_image = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-image1.png");

   // pic_bookmark_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-bookmark1.bmp");
   // pic_changed_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-changed-line1.bmp");
   // pic_changed_and_bookmarked_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-changed-bookmark1.bmp");
   // pic_old_changed_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-old-changed-line1.bmp");
   // pic_visited_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-visited-line1.bmp");
   // pic_blank_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-white1.bmp");

   // pic_bookmark_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-bookmark.bmp");
   // pic_changed_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-changed-line.bmp");
   // pic_changed_and_bookmarked_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-changed-bookmark.bmp");
   // pic_old_changed_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-old-changed-line.bmp");
   // pic_visited_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-visited-line.bmp");
   // pic_blank_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-white.bmp");


   // pic_bookmark_line = _update_picture(-1, _config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-bookmark.bmp");
   // pic_changed_line = _update_picture(-1, _config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-changed-line.bmp");
   // pic_changed_and_bookmarked_line = _update_picture(-1, _config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-changed-bookmark.bmp");
   // pic_old_changed_line = _update_picture(-1, _config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-old-changed-line.bmp");
   // pic_visited_line = _update_picture(-1, _config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-visited-line.bmp");
   // pic_blank_line = _update_picture(-1, _config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-white.bmp");

   //pic_bookmark_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-bookmark.png");
   //pic_changed_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-changed-line.png");
   //pic_changed_and_bookmarked_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-changed-bookmark.png");
   //pic_old_changed_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-old-changed-line.png");
   //pic_visited_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-visited-line.png");
   //pic_blank_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-white.png");

   pic_bookmark_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-bookmark.bmp");
   pic_changed_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-changed-line.bmp");
   pic_changed_and_bookmarked_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-changed-bookmark.bmp");
   pic_old_changed_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-old-changed-line.bmp");
   pic_visited_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-visited-line.bmp");
   pic_blank_line = _find_or_add_picture(_config_path() :+ "xretrace/bitmaps/_xretrace-scrollbar-markup-white.bmp");



}




_form xbar1 {
   p_backcolor=0x80000005;
   p_border_style=BDS_NONE;
   p_caption="xs";
   p_forecolor=0x80000008;
   p_height=6000;
   p_tool_window=true;
   p_width=3825;
   p_x=14925;
   p_y=1890;
   p_eventtab=xbar1;
   _list_box ctllist1 {
      p_border_style=BDS_FIXED_SINGLE;
      p_font_size=1;
      p_height=5460;
      p_multi_select=MS_NONE;
      p_scroll_bars=SB_NONE;
      p_tab_index=1;
      p_tab_stop=true;
      p_width=900;
      p_x=0;
      p_y=0;
      p_eventtab2=_ul2_listbox;
   }
   _image scrollbar_image {
      p_auto_size=false;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=5040;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=2;
      p_tab_stop=false;
      p_value=0;
      p_width=780;
      p_x=600;
      p_y=360;
      p_eventtab2=_ul2_imageb;
   }

   _image current_line_image {
      p_auto_size=false;
      p_backcolor=0x00A8A8A8;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=120;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=4;
      p_tab_stop=false;
      p_value=0;
      p_width=780;
      p_x=300;
      p_y=5100;
      p_eventtab2=_ul2_imageb;
   }

   _image scrollbar_handle_image {
      p_auto_size=false;
      p_backcolor=0x00A8A8A8;
      p_border_style=BDS_NONE;
      p_forecolor=0x00D70625;
      p_height=960;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=3;
      p_tab_stop=false;
      p_value=0;
      p_width=840;
      p_x=180;
      p_y=4080;
      p_eventtab2=_ul2_imageb;
   }
}


_menu xbar1_popup_menu {
}
//
//


