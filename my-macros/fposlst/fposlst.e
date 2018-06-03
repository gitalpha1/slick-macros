/******************************************************************************
*  FPOSLST.E * Created: 10/16/1996
*
*  written by: kanumi
*
*  -> Show all filenames from "filespos.slk" in a selection list
*
******************************************************************************/

#include 'slick.sh'

_control _sellist

static _str _filepos_slk_list_callback(reason,var result,key)
{
   if (reason==SL_ONDEFAULT) {   // Enter key
      result=_sellist._lbmulti_select_result(1)
             if ( substr(result,1,1)=='@' ) {   /* List of files? *///ch1
                status = _open_temp_view(maybe_quote_filename(substr(result,2)),temp_view_id,orig_view_id);
                top;up()
                for (;;) {
                   down();
                   if (rc) break;
                   get_line line
                   replace_line ' 'maybe_quote_filename(strip(line))
                }
                p_buf_flags=p_buf_flags|THROW_AWAY_CHANGES
                            p_window_id=orig_view_id;
             }
             return(1);
   }
   user_button=reason==SL_ONUSERBUTTON;
   if (reason!=SL_ONLISTKEY && !user_button) {
      return('');
   }
   orig_wid=p_window_id;
   p_window_id=_sellist;
   if ( key==3) {                // Toggle order
      _sellist.get_line sel_line
      sel_line = substr(sel_line,2);
      _lbclear();
      title = p_active_form.p_caption;
      lpos=lastpos('(sorted)', title);
      if (lpos) {
         p_active_form.p_caption = substr(title, 1, lpos-2);
      } else {
         p_active_form.p_caption = title ' (sorted)';
      }
      build_filepos_slk_list(width,p_buf_id, lpos==0);
      top;
      p_modify=0;
      if (sel_line!='') {
         _lbsearch(sel_line,'E');
         // This call centers the line in the list box.
         set_scroll_pos(p_left_edge,p_client_height intdiv 2);
      }
      _lbselect_line();
      p_window_id=orig_wid;
      _sellist._set_focus();
      return('');
   }
   return('');
}


/* from files.e */
static int _activate_filepos_slk(var orig_view_id)
{
   get_view_id orig_view_id;
   activate_view HIDDEN_VIEW_ID
   filepos_file=_config_path():+'filepos.slk';
   status=find_view(filepos_file);
   if ( status ) {
      _create_config_path();
      /* Create buffer in hidden window group */
      status=load_files('+l +q +c 'maybe_quote_filename(filepos_file));
      if ( status ) {
         if (status==NEW_FILE_RC) {
            _delete_line();
         } else {
            activate_view(orig_view_id);
            return(1);
         }
      }
      p_buf_flags= THROW_AWAY_CHANGES|HIDE_BUFFER|KEEP_ON_QUIT;
   }
   return(0);
}

_command list_filepos_slk() name_info(','MARK_ARG2|CMDLINE_ARG2|NCW_ARG2|READ_ONLY_ARG2)
{
   title=nls('Select a File listed in filepos.slk');
   p_window_id=_mdi.p_child;
   _macro_delete_line();
   orig_view_id=_create_temp_view(temp_view_id);
   if (orig_view_id=='') return(1);
   buttons=nls('&Edit,&Order');
   //       help_item='Select a Buffer dialog box'
   build_filepos_slk_list(width,p_buf_id,0);
   if ( p_Noflines==0 ) {
      _delete_temp_view(temp_view_id);
      activate_view orig_view_id;
      _set_focus();_message_box(nls('Filepos list empty'));
      return(1)
   }
   result=show('_sellist_form -mdi -modal -reinit',
               title,
               SL_VIEWID|SL_SELECTCLINE|SL_ALLOWMULTISELECT|SL_DEFAULTCALLBACK,
               temp_view_id,
               buttons,
               '',         // help item name
               '',         // font
               _filepos_slk_list_callback    // Call back function
              );
   if (result=='') {
      return(COMMAND_CANCELLED_RC);
   }
   if (result==_chr(0)) {
      /* Start Process or Open File button pressed.  Work done.*/
      return(0);
   }
   edit(maybe_quote_filename(result));
   if ( substr(result,1,1)=='@' ) {   /* List of files? *///ch1
      status = _open_temp_view(substr(result,2),temp_view_id,orig_view_id);
      _delete_buffer();
   }
   p_window_id=_mdi.p_child;
   _restore_filepos(p_buf_name);
   /* to have restorepos aktivated, line 51 in files.e (the last else case) should look like this: restorepos_flag=EDIT_RESTOREPOS; */
   return(0);
}

static void build_filepos_slk_list(var width,temp_buf_id, sorted...)
{
   _safe_hidden_window();
   width=0;
   status=_activate_filepos_slk(orig_view_id);
   if (status) {
      return;
   }
   top();
   for (lines = 0; lines < 500; ++lines) {
      get_line(filename);
      if (substr(filename,2,1)==':') {
         buf_id=p_buf_id;
         p_buf_id=temp_buf_id;
         insert_line ' 'strip(filename)
         up();
         p_buf_id=buf_id;
         if ( length(filename)>width )
            width=length(filename);
      }
      down();
      if (down())
         break;
   }
   p_view_id=orig_view_id;
   p_buf_id=temp_buf_id;
   if (sorted) {
      _lbsort('ai -f');
      top();
      get_line(line);
      if (line=='') {
         delete_line();
      }
   }
}
