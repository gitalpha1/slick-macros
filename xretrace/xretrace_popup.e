
/******************************************************************************
*  $Revision: 1.1 $
******************************************************************************/



#include "slick.sh"

#pragma option(strictsemicolons,on)
#pragma option(strict,on)
#pragma option(autodecl,off)
#pragma option(strictparens,on)



_form xretrace_popup_form {
   p_backcolor=0x0035D0FF;
   p_border_style=BDS_NONE;
   p_caption='xretrace';
   p_clip_controls=false;
   p_forecolor=0x80000008;
   p_height=5520;
   p_tool_window=true;
   p_width=5910;
   p_x=8220;
   p_y=2415;
   p_eventtab=xretrace_popup_form;
   _picture_box ctlpicture1 {
      p_auto_size=true;
      p_backcolor=0x0035D000;
      p_border_style=BDS_NONE;
      p_clip_controls=false;
      p_forecolor=0x0035D000;
      p_height=1620;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=5;
      p_value=0;
      p_width=3240;
      p_x=1020;
      p_y=2280;
      p_eventtab2=_ul2_picture;
      _label TextLabel1 {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x00000000;
         p_border_style=BDS_NONE;
         p_caption='';
         p_font_bold=false;
         p_font_italic=false;
         p_font_name='MS Sans Serif';
         p_font_size=8;
         p_font_underline=false;
         p_forecolor=0x00000000;
         p_height=420;
         p_tab_index=2;
         p_width=1740;
         p_word_wrap=false;
         p_x=1020;
         p_y=780;
      }
      _label TextLabel2 {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x00000000;
         p_border_style=BDS_NONE;
         p_caption='';
         p_font_bold=false;
         p_font_italic=false;
         p_font_name='MS Sans Serif';
         p_font_size=8;
         p_font_underline=false;
         p_forecolor=0x00000000;
         p_height=420;
         p_tab_index=2;
         p_width=1740;
         p_word_wrap=false;
         p_x=1020;
         p_y=780;
      }
   }
}



defeventtab xretrace_popup_form;

_control TextLabel1;
_control TextLabel2;
_control ctlpicture1;

int popup_form_p_x = -1;
int popup_form_p_y = -1;

int pix2scale(int pix,int form_id)
{
   return _dx2lx(form_id.p_xyscale_mode,pix);
}


int scale2pix(int scale,int form_id)
{
   return _lx2dx(form_id.p_xyscale_mode,scale);
}


#define NUM_TEXT_LINES_MORE 22
#define NUM_TEXT_LINES_LESS 9
static void set_label_text(int wid, boolean same_buffer, boolean more_or_less)
{
   _str s1 = (same_buffer ? 'Toggle SAME/all buf' : 'Toggle same/ALL buf');
   _str s2 = (more_or_less ? 'More >>>' : 'Less <<<');

   wid.TextLabel1.p_caption =
      "  ESC      " :+ \r :+ \n :+
      "  ENTER/UP " :+ \r :+ \n :+
      "  LEFT     " :+ \r :+ \n :+
      "  C-LEFT   " :+ \r :+ \n :+
      "  A-LEFT   " :+ \r :+ \n :+
      "  RIGHT    " :+ \r :+ \n :+
      "  C-RIGHT  " :+ \r :+ \n :+
      "  A-RIGHT  " :+ \r :+ \n :+
      "  PAD STAR " :+ \r :+ \n :+
      "           " :+ \r :+ \n :+        
      "  R-CLICK  " :+ \r :+ \n :+
      "  INS      " :+ \r :+ \n :+
      "  F1       " :+ \r :+ \n :+
      "  F2       " :+ \r :+ \n :+ 
      "  F5       " :+ \r :+ \n :+
      "  F6       " :+ \r :+ \n :+
      "  F7       " :+ \r :+ \n :+
      "  F8       " :+ \r :+ \n :+
      "  C-F4     " :+ \r :+ \n :+
      "  A-F4     " :+ \r :+ \n :+
      "  PGDN     " :+ \r :+ \n :+
      "  C-PGDN   " :+ \r ;

      wid.TextLabel2.p_caption =
         "Quit" :+ \r  :+                    \n :+// ESC
         "Quit here" :+ \r :+                \n :+
         "Prev item" :+ \r :+                \n :+
         "Prev item, see all" :+ \r  :+      \n :+
         "Prev buffer" :+ \r  :+             \n :+
         "Next item" :+ \r  :+               \n :+
         "Next item, see all" :+ \r  :+      \n :+
         "Next buffer" :+ \r  :+             \n :+
                    s2 :+ \r  :+             \n :+
         "" :+ \r :+                         \n :+
         "Set popup position" :+ \r :+       \n :+
         "Settings" :+ \r :+                 \n :+
         "Help" :+ \r :+                     \n :+
         "Xretrace source" :+ \r :+          \n :+
         "Hide/show popup" :+ \r :+          \n :+
         "Switch lists" :+ \r :+             \n :+
         "Restore mod lineflgs" :+ \r :+     \n :+
         "" :+ s1 :+ \r :+                   \n :+
         "Reset xretrace" :+ \r :+           \n :+
         "Disable xretrace" :+ \r :+         \n :+
         "Toggle bookmark" :+ \r :+          \n :+
         "Set bookmark" :+ \r  ;
}


static void set_text_window_size(int form_id, boolean more_or_less = false)
{
   set_label_text(form_id, true, more_or_less);

   form_id.p_width = pix2scale(200,form_id);
   form_id.TextLabel1.p_width = pix2scale(70,form_id);
   form_id.TextLabel2.p_width = pix2scale(130,form_id);

   form_id.TextLabel1.p_x = 0;
   form_id.TextLabel2.p_x = pix2scale(70,form_id);
   form_id.TextLabel1.p_y = pix2scale(6,form_id);
   form_id.TextLabel2.p_y = pix2scale(6,form_id);

   int ht = form_id.TextLabel1._text_height() * 
                   (more_or_less ? NUM_TEXT_LINES_LESS : NUM_TEXT_LINES_MORE);

   if (ht > pix2scale(600,form_id))
      ht = pix2scale(600,form_id);
   form_id.p_height = (ht+pix2scale(14,form_id));

   form_id.TextLabel1.p_height = ht;
   form_id.TextLabel2.p_height = ht;
   form_id.p_x = pix2scale(popup_form_p_x, form_id);
   form_id.p_y = pix2scale(popup_form_p_y,form_id);

   form_id.ctlpicture1.p_x = pix2scale(2,form_id);
   form_id.ctlpicture1.p_y = pix2scale(2,form_id);
   form_id.ctlpicture1.p_height = form_id.p_height - pix2scale(4,form_id);
   form_id.ctlpicture1.p_width = form_id.p_width - pix2scale(4,form_id);
}

static boolean more_or_less;

void xretrace_popup_update_text(int wid, boolean same_buffer, boolean popup_show_more_or_less)
{
   if (more_or_less != popup_show_more_or_less) {
      more_or_less = popup_show_more_or_less;
      set_text_window_size(wid, popup_show_more_or_less);
   }
   set_label_text(wid, same_buffer, popup_show_more_or_less);
}


int xretrace_show_popup_window(boolean first_time = false)
{
   int orig_focus = _get_focus();
   int wid = _find_object('xretrace_popup_form');
   if (wid==0) {
      wid = show('-xy xretrace_popup_form', 'file');
   }

   wid.TextLabel1.p_font_name = "Tahoma";
   wid.TextLabel2.p_font_name = "Tahoma";
   wid.TextLabel1.p_font_size = 10;
   wid.TextLabel2.p_font_size = 10;

   wid.TextLabel1.p_backcolor = _rgb(254, 253, 192);
   wid.TextLabel2.p_backcolor = _rgb(254, 253, 192);
   wid.TextLabel1.p_forecolor = _rgb(0, 0, 0);
   wid.TextLabel2.p_forecolor = _rgb(0, 0, 0);
   wid.ctlpicture1.p_backcolor = _rgb(254, 253, 192);

   if (!first_time) {
      set_text_window_size(wid, more_or_less);
   }
   wid.p_visible = 1;
   if (orig_focus != 0)
      orig_focus._set_focus();
   return wid;
}


void xretrace_hide_popup_window()
{
   int wid = _find_object('xretrace_popup_form');
   if (wid != 0) {
      wid.p_width = 0;
      wid.p_height = 0;
      wid.p_x = 0;
      wid.p_y = 0;
   }
}


void xretrace_destroy_popup_window_if_any()
{
   int wid = _find_object('xretrace_popup_form');
   if (wid != 0) {
      wid.p_visible = 0;
      wid._delete_window();
   }
}


_command void xrpop() name_info(',')
{
   xretrace_show_popup_window();
}

_command void xrpopk() name_info(',')
{
   xretrace_destroy_popup_window_if_any();
}


set_popup_window_pos(int x, int y)
{
   popup_form_p_x = x;
   popup_form_p_y = y;
   xretrace_show_popup_window();
}

// one of these might work!
void TextLabel1.lbutton_up()
{
   xretrace_destroy_popup_window_if_any();
}

void TextLabel2.lbutton_up()
{
   xretrace_destroy_popup_window_if_any();
}

void ctlpicture1.lbutton_up()
{
   xretrace_destroy_popup_window_if_any();
}



definit()
{
   if (popup_form_p_x == -1 || popup_form_p_y == -1) {
      popup_form_p_x = 500;  // pixels
      popup_form_p_y = 500;
   }
}


