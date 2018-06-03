#include "slick.sh"
#include "tagsdb.sh"

#pragma option(strictsemicolons,on)
//#pragma option(strict,on)
//#pragma option(autodecl,off)
#pragma option(strictparens,on)



static int diff_region1_start_line;
static int diff_region1_end_line;
static boolean diff_region1_set;
static _str diff_region1_filename;
static boolean diff_region1_auto_length;
   
_command void xset_diff_region() name_info(','VSARG2_READ_ONLY|VSARG2_REQUIRES_EDITORCTL|VSARG2_MARK)
{
   if (_isno_name(p_DocumentName) || p_buf_name == '') {
      _message_box("Save the file before using this command");
      diff_region1_set = false;
      return;
   }

   if (select_active2()) {
      typeless p1;
      save_pos(p1);
      _begin_select();
      diff_region1_start_line = p_line;
      _end_select();
      diff_region1_end_line = p_line;
      restore_pos(p1);
      diff_region1_auto_length = false;
   }
   else
   {
      diff_region1_start_line = p_line;
      diff_region1_end_line = p_line + 50;
      diff_region1_auto_length = true;
   }
   diff_region1_filename = p_buf_name;
   diff_region1_set = true;
}
   
   
_command void xcompare_diff_region() name_info(','VSARG2_READ_ONLY|VSARG2_REQUIRES_EDITORCTL|VSARG2_MARK)
{
   if (_isno_name(p_DocumentName) || p_buf_name == '') {
      _message_box("Save the file before using this command");
      return;
   }

   if (diff_region1_set) {
      int diff_region2_start_line;
      int diff_region2_end_line;
      if (select_active2()) {
         typeless p1;
         save_pos(p1);
         _begin_select();
         diff_region2_start_line = p_line;
         if (diff_region1_auto_length && (diff_region1_filename == p_buf_name) 
                                                  && (diff_region1_start_line < p_line)) {
            if (diff_region1_end_line >= p_line) {
               diff_region1_end_line = p_line - 1;
            }
         }
         _end_select();
         diff_region2_end_line = p_line;
         restore_pos(p1);
      }
      else
      {
         diff_region2_start_line = p_line;
         if (diff_region1_auto_length && (diff_region1_filename == p_buf_name)
                                                  && (diff_region1_start_line < p_line)) {
            if (diff_region1_end_line >= p_line) {
               diff_region1_end_line = p_line - 1;
            }
         }
         diff_region2_end_line = p_line + (diff_region1_end_line - diff_region1_start_line) + 20;
      }

      _DiffModal('-range1:' :+ diff_region1_start_line ',' :+ diff_region1_end_line :+ 
                 ' -range2:' :+ diff_region2_start_line ',' :+ diff_region2_end_line :+ ' ' :+ 
                 maybe_quote_filename(diff_region1_filename) ' '  maybe_quote_filename(p_buf_name));
   }
}
   

_command void xbeautify_project(boolean ask = true, boolean no_preview = false, boolean autosave = true) name_info(',')
{
   _str files_to_beautify [];

   //_GetWorkspaceFiles(_workspace_filename, files_to_beautify);
   _getProjectFiles( _workspace_filename, _project_get_filename(), files_to_beautify, 1);

   if (ask && !no_preview) {
      activate_preview();
   }

   int k;
   for (k = 0; k < files_to_beautify._length(); ++k) {
      if (ask) {

         if (!no_preview) {
            struct VS_TAG_BROWSE_INFO cm;
            tag_browse_info_init(cm);
            cm.member_name = files_to_beautify[k];
            cm.file_name = files_to_beautify[k];
            cm.line_no = 1;
            cb_refresh_output_tab(cm, true, false, false);
            _UpdateTagWindowDelayed(cm, 0);
         }

         _str res = _message_box("Beautify " :+ files_to_beautify[k], "Beautify project", MB_YESNOCANCEL|IDYESTOALL);
         if (res == IDCANCEL) return;
         if (res == IDNO) continue;
         if (res == IDYESTOALL) ask = false;
      }

      if (edit("+B " :+ files_to_beautify[k]) == 0) {
         beautify();
         if (autosave) save();
      }
      else
      {
         edit(files_to_beautify[k]);
         beautify();
         if (autosave) save();
         quit();
      }
   }
}


static _str get_search_cur_word()
{
   int start_col = 0;
   word := "";
   if (select_active2()) {
      if (!_begin_select_compare()&&!_end_select_compare()) {
         /* get text out of selection */
         last_col := 0;
         buf_id   := 0;
         _get_selinfo(start_col,last_col,buf_id);
         if (_select_type('','I')) ++last_col;
         if (_select_type()=='LINE') {
            get_line(auto line);
            word=line;
            start_col=0;
         } else {
            word=_expand_tabsc(start_col,last_col-start_col);
         }
         _deselect();
      }else{
         deselect();
         word=cur_word(start_col,'',1);
      }
   }else{
      word=cur_word(start_col,'',1);
   }
   return word;
}




_command int xsearch_workspace_cur_word_now() name_info(','VSARG2_READ_ONLY|VSARG2_REQUIRES_EDITORCTL|VSARG2_MARK)
{
   _str sw = get_search_cur_word();
   if (sw != '') {
      _str ss = _get_active_grep_view();
      _str grep_id = '0';
      if (ss != '') {
         parse ss with "_search" grep_id; 
      }
      return _mffind2(sw,'I','<Workspace>','*.*','','32',grep_id);
      //return _mffind2(sw,'I','<Workspace>','*.*','','32',auto_increment_grep_buffer());
   }
   return 0;
}


_command int xsearch_cur_word() name_info(','VSARG2_READ_ONLY|VSARG2_REQUIRES_EDITORCTL|VSARG2_MARK)
{
   _str sw = get_search_cur_word();
   if (sw == '') 
      return 0;

   int formid;
   if (isEclipsePlugin()) {
      show('-xy _tbfind_form');
      formid = _find_object('_tbfind_form._findstring');
      if (formid) {
         formid._set_focus();
      }
   } else {
      tool_gui_find();
      formid = activate_tool_window('_tbfind_form', true, '_findstring');
   }

   if (!formid) {
      return 0;
   }
   _control _findstring;
   formid._findstring.p_text = sw;
   formid._findstring._set_sel(1,length(sw)+1);
   return 1;
}


_command void xupcase_char()name_info(',' VSARG2_REQUIRES_EDITORCTL)
{
   _select_char();
   cursor_right();
   _select_char();
   upcase_selection();
}


_command void xlowcase_char()name_info(',' VSARG2_REQUIRES_EDITORCTL)
{
   _select_char();
   cursor_right();
   _select_char();
   lowcase_selection();
}


// copy path plus filename of the current buffer to the clipboard
_command xcurbuf_path_to_clip() name_info(','VSARG2_MACRO|VSARG2_READ_ONLY)
{
   _str str;
   if (_no_child_windows()) {
      return 0;
   }
   else { 
      str = _mdi.p_child.p_buf_name;
   }
   push_clipboard_itype('CHAR','',1,true);
   append_clipboard_text(str);
}

// copy name (excluding path) of the current buffer to the clipboard
_command xcurbuf_name_to_clip() name_info(','VSARG2_MACRO|VSARG2_READ_ONLY)
{
   if (_no_child_windows()) {
      return 0;
   }
   push_clipboard_itype('CHAR','',1,true);
   append_clipboard_text(strip_filename(_mdi.p_child.p_buf_name,'P'));
}

_command void xproject_name_to_clip() name_info(',')
{
   push_clipboard_itype('CHAR','',1,true);
   append_clipboard_text(_project_name);
}


// explore configuration folder
_command void explore_config() name_info(',')
{
   explore(_config_path());
}


static _str get_vsroot_dir()
{
   _str root_dir = get_env('VSROOT');
   _maybe_append_filesep(root_dir);
   return root_dir;
}

// explore slickedit installation folder
_command void explore_vslick() name_info(',')
{
   explore(get_vsroot_dir());
}


// explore slickedit installation docs folder
_command void explore_docs() name_info(',')
{
   explore(get_vsroot_dir() :+ 'docs');
}

// explore active project vpj folder
_command void explore_vpj() name_info(',')
{
   explore(_project_name);
}


// explore current buffer or pathname (if supplied as first parameter)
_command void explore_cur_buffer() name_info(',')
{
   if (arg()) {
      if (file_exists(arg(1))) {
         explore(arg(1));
         return;
      } 
   }
   if (_no_child_windows()) {
      return;
   }

   if (file_exists(_mdi.p_child.p_buf_name)) {
      explore( _mdi.p_child.p_buf_name );
   }
}


static _str get_open_path(...)
{
   if (arg()) {
      if (file_exists(arg(1))) {
         return arg(1);
      } 
   }
   if (_no_child_windows()) {
      return strip_filename(_project_get_filename(),'N');
   }
   else if (file_exists(_mdi.p_child.p_buf_name)) {
      return strip_filename(_mdi.p_child.p_buf_name,'N');
   } else {
      return strip_filename(_project_get_filename(),'N');
   }
}

// open from path of current buffer or from specified path (if supplied as
// the first parameter
_command void xopen_from_here() name_info(',')
{
   chdir(get_open_path(arg(1)),1);
   gui_open();
}

// open from configuration folder
_command void xopen_from_config() name_info(',')
{
   chdir(_config_path(),1);
   gui_open();
}


// open vsstack error file
_command void xopvss() name_info(',')
{
   edit(strip_filename(GetErrorFilename(),'N') :+ 'vsstack');
}


_menu xmenu1 {
   "Set diff region", "xset_diff_region", "","","";
   "Compare diff region", "xcompare_diff_region", "","","";
   "Beautify project", "xbeautify_project", "","","";
   "--","","","","";
   "Transpose chars","transpose-chars","","","";
   "Transpose words","transpose-words","","","";
   "Transpose lines","transpose-lines","","","";
   "Copy cur buffer name to clipboard","xcurbuf-name-to-clip","","",""; 
   "Copy cur buffer path to clipboard","xcurbuf-path-to-clip","","",""; 
   "Copy active project name to clipboard","xproject_name_to_clip","","",""; 
   "--","","","","";
   "Float &1","xfloat1","","",""; 
   "Float &2","xfloat2","","",""; 
   "Float &3","xfloat3","","",""; 
   submenu "Set float","","","" {
      "Float &1","xset_float1","","",""; 
      "Float &2","xset_float2","","",""; 
      "Float &3","xset_float3","","",""; 
   }
   "Save app layout","xsave_named_toolwindow_layout","","",""; 
   "Restore app layout","xload_named_toolwindow_layout","","",""; 
   "Save session","save_named_state","","",""; 
   "Restore session","load_named_state","","",""; 
   "--","","","","";

   submenu "&Bookmarks","","","" {
      "&Save bookmarks","xsave_bookmarks","","",""; 
      "&Restore bookmarks","xrestore_bookmarks","","",""; 
      "Save bookmarks and clear","xsave_and_clear_bookmarks","","",""; 
      "Clear and restore bookmarks","xclear_and_restore_bookmarks","","",""; 
   }

   submenu "Com&plete","","","" {
      "complete-prev-no-dup","complete_prev_no_dup","","","";
      "complete-next-no-dup","complete_next_no_dup","","","";
      "complete-prev","complete_prev","","","";
      "complete-next","complete_next","","","";
      "complete-list","complete_list","","","";
      "complete-more","complete_more","","","";
   }

   submenu "&Select / Hide","","","" {
      "select code block","select_code_block","","","";
      "select paren","select_paren_block","","","";
      "select procedure", "select_proc", "","","";
      "hide code block","hide_code_block","","","";
      "hide selection","hide_selection","","","";
      "hide comments","hide_all_comments","","","";
      "show all","show-all","","","";
   }

   submenu "&Open / E&xplore","","open-file or explore folder","" {
      "Open from here","xopen_from_here","","","open from current buffer path";
      "Open from config","xopen_from_config","","","open file from configuration folder";
      "Open vsstack error file","xopvss","","","Open Slick C error file";
      "-","","","","";
      "Explore current buffer","explore_cur_buffer","","","explore folder of current buffer";
      "Explore config folder","explore_config","","",""; 
      "Explore installation folder", "explore_vslick","","",""; 
      "Explore docs","explore_docs","","",""; 
      "Explore project","explore_vpj","","","";
   }

   submenu "&Case conversion","","","" {
      "&Lowcase selection","lowcase-selection","","","";
      "&Upcase selection","upcase-selection","","","";
      "Lowcase word","lowcase-word","","","";
      "Upcase word","upcase-word","","","";
      "Upcase &char","xupcase-char","","","";
      "Lowcase &char","xlowcase-char","","","";
      "Cap &selection","cap-selection", "","","";
   }

}

  
static int restore_bookmarks_from_file(_str filename)
{
   int new_wid, orig_wid;
   _str line;
   _str rest;

   orig_wid = p_window_id;
   int status = _open_temp_view(filename, new_wid, orig_wid);
   if (status) {
      _message_box('Unable to open bookmark file: ' :+ filename);
      p_window_id = orig_wid;
      return 1;
   }
   top();
   get_line(line);
   if (pos('BOOKMARK', line) != 0) {
      parse line with . ': ' rest;
      _sr_bookmark2('R', rest);
   }
   else {
      status = 1;
   }
   _delete_temp_view(new_wid);
   p_window_id = orig_wid;
   return status;
}
  
  
static int save_all_bookmarks_to_file(_str &filename)
{
   boolean b2;
   int new_wid, orig_wid;
   _str line;
   int rest;

   orig_wid = p_window_id;
   int status = _open_temp_view(filename, new_wid, orig_wid,'', b2, false, false, 0, true);
   if (status) {
      _message_box('Unable to open file: ' :+ filename);
      p_window_id = orig_wid;
      return 1;
   }
   //say(p_buf_name);
   delete_all();
   _sr_bookmark2('S');
   save();
   _delete_temp_view(new_wid);
   p_window_id = orig_wid;
   return 0;
}
  
  
_command void xsave_and_clear_bookmarks(_str filename = null) name_info(',')
{
   if (filename != '') {
      if (!path_exists(strip_filename(filename,'N'))) {
         make_path(strip_filename(filename,'N'));
      }
   }
   _str fn = _OpenDialog('', 'Save bookmarks to :','','', OFN_SAVEAS,'', strip_filename(filename,'P'), 
                               strip_filename(filename,'N'), 'RetrieveSaveBookmarks');
   if (fn == '') 
      return;
   if (save_all_bookmarks_to_file(fn))
      return;
   int result =_message_box("Bookmarks have been saved to:\n" :+ fn :+ "  \n\nDelete all bookmarks?",
                              '', MB_YESNO|MB_ICONQUESTION);
   if (result == IDYES) {
      clear_bookmarks('quiet');
   } 
}
  

_command void xclear_and_restore_bookmarks(_str filename = null) name_info(',')
{
   _str fn = _OpenDialog('', 'Load bookmarks from :','','','','', strip_filename(filename,'P'), 
                               strip_filename(filename,'N'), 'RetrieveSaveBookmarks');
   if (fn == '') 
      return;
   if (restore_bookmarks_from_file(fn) == 0)
      _message_box("Bookmarks have been restored from :\n" :+ fn :+ '   ');
}
  
  
_command void xsave_bookmarks() name_info(',')
{
   xsave_and_clear_bookmarks(_config_path() :+ 'Bookmarks' :+ FILESEP :+ 'bookmarks-file1.bmk');
}


_command void xrestore_bookmarks() name_info(',')
{
   xclear_and_restore_bookmarks(_config_path() :+ 'Bookmarks' :+ FILESEP :+ 'bookmarks-file1.bmk');
}




_str my_current_layout_import_settings_part1(int view_id)
{
   error := '';
   typeless count = 0;
   typeless line = "";
   _str type = "";
   top();
   for (;;) {
      // get the line - it will tell us what this section is for
      get_line(line);
      parse line with type line;

      name := '_sr_' :+ strip(lowcase(type), '', ':');
      index := find_index(name, PROC_TYPE);
      if (index_callable(index)) {
         status := call_index('R', line, index);
         if (status) {
            error = 'Error applying layout type 'type'.  Error code = 'status'.';
            break;
         }
      } else {
         error = 'No callback to apply layout type 'type'.' :+ OPTIONS_ERROR_DELIMITER;
         // we can't process these lines, so skip them
         parse line with count .;
         if (isnumber(count) && count > 1) {
            down(count-1);
         }
      }
      activate_window(view_id);
      if ( down()) {
         break;
      }
   }

   /********************************************************************************* 
    
   The following is done by the call to the real _current_layout_import_settings 
    
   if ( _tbFullScreenQMode() ) {
      if ( _tbDebugQMode() ) {
         if ( _tbDebugQSlickCMode() ) {
            _autorestore_from_view(_fullscreen_slickc_debug_layout_view_id, true);
         } else {
            _autorestore_from_view(_fullscreen_debug_layout_view_id, true);
         }
      } else {
         _autorestore_from_view(_fullscreen_layout_view_id, true);
      }
   } else {
      if ( _tbDebugQMode() ) {
         if ( _tbDebugQSlickCMode() ) {
            _autorestore_from_view(_slickc_debug_layout_view_id, true);
         } else {
            _autorestore_from_view(_debug_layout_view_id, true);
         }
      } else {
         _autorestore_from_view(_standard_layout_view_id, true);
      }
   } 
   p_window_id = view_id;
   ***********************************************************************************/

   return error;
}


int _sr_nothing()
{
   return 0;
}



// handle deletion of a layout from either the save or load dialog
static _str _load_named_twlayout_callback(int reason, var result, _str key)
{
   _nocheck _control _sellist;
   _nocheck _control _sellistok;
   if (key == 4) {
      item := _sellist._lbget_text();
      filename := _ConfigPath():+'xtoolwindow-layouts.ini';
      status := _ini_delete_section(filename,item);
      if ( !status ) {
         _sellist._lbdelete_item();
      }
   }
   return "";
}


// make sure the file xtoolwindow-layouts.ini is NOT open in the editor
// when this command is used
_command void xload_named_toolwindow_layout(_str sectionName="") name_info(',')
{
   filename := _ConfigPath():+'xtoolwindow-layouts.ini';
   if ( sectionName=="" ) {
      _ini_get_sections_list(filename,auto sectionList);
      result := show('-modal _sellist_form',
                     "Load Named Layout",
                     SL_SELECTCLINE,
                     sectionList,
                     "Load,&Delete",     // Buttons
                     "Load Named Layout", // Help Item
                     "",                 // Font
                     _load_named_twlayout_callback
                     );
      if ( result=="" ) {
         return;
      }
      sectionName = result;
   }
   status := _ini_get_section(filename, sectionName, auto tempWID);
   if (status)
   {
      _message_box('Error reading file : ' :+ filename);
      return;
   }

   origWID := p_window_id;
   p_window_id = tempWID;

   _str err = my_current_layout_import_settings_part1(tempWID);
   if ( err != '' ) {
      _message_box(err);
   }

   filename = _ConfigPath() :+ 'xtemp' :+ FILESEP :+ 'nothing.slk';

   // pass a dummy file containing one line only so that the calls to _autorestore_from_view get done
   _current_layout_import_settings(filename);

   if ( _iswindow_valid(tempWID) ) {
      _delete_temp_view(tempWID);
   }

   if ( _iswindow_valid(origWID) ) {
      p_window_id = origWID;
   }
}

// make sure the file xtoolwindow-layouts.ini is NOT open in the editor
// when this command is used
_command void xsave_named_toolwindow_layout(_str sectionName="") name_info(',')
{
   filename := _ConfigPath():+'xtoolwindow-layouts.ini';
   if ( sectionName=="" ) {
      _ini_get_sections_list(filename,auto sectionList);
      result := "";
      if ( sectionList==null ) {
         // if there are no section names stored already, prompt for a name.
         result = textBoxDialog("Save Named Layout",
                                0,
                                0,
                                "Save Named Layout",
                                "",
                                "",
                                "Save Named Layout");
         if ( result==COMMAND_CANCELLED_RC ) {
            return;
         }
         result = _param1;
      } else {
         // if there are names, show the list with a combobox so they can pick or type a new name.
         result = show('-modal _sellist_form',
                       "Save Named Layout",
                       SL_SELECTCLINE|SL_COMBO,
                       sectionList,
                       "Save,&Delete",     // Buttons
                       "Save Named Layout", // Help Item
                       "",                 // Font
                       _load_named_twlayout_callback
                       );
      }
      if ( result=="" ) return;
      sectionName = result;
   }
   int orig_view_id = _create_temp_view(auto temp_view_id);
   _sr_app_layout();
   _sr_standard_layout();
   _sr_fullscreen_layout();
   _sr_debug_layout();
   _sr_fullscreen_debug_layout();
   _sr_slickc_debug_layout();
   _sr_fullscreen_slickc_debug_layout();

   p_window_id = orig_view_id;
   int status = _ini_put_section(filename, sectionName, temp_view_id);
   if (status) {
      _message_box('Error writing file : ' :+ filename);
   }
}



struct xwin_data {
   int px;
   int py;
   int pw;
   int ph;
   _str layout_name;
};

xwin_data xfloat_data[];


static void save_xuser_data()
{
   _str filename = _ConfigPath():+'xuser-data.ini';

   if ( xfloat_data._length() == 0 ) {
      xfloat_data[0].px = 200;
      xfloat_data[0].py = 200;
      xfloat_data[0].pw = 500;
      xfloat_data[0].ph = 500;
      xfloat_data[0].layout_name = 'Standard';
      xfloat_data[1] = xfloat_data[0];
      xfloat_data[2] = xfloat_data[0];
   }
   else if ( xfloat_data._length() == 1 ) {
      xfloat_data[1] = xfloat_data[0];
      xfloat_data[2] = xfloat_data[0];
   }
   else if ( xfloat_data._length() == 2 ) {
      xfloat_data[2] = xfloat_data[0];
   }

   int orig_view_id = _create_temp_view(auto temp_view_id);
   int k;
   for ( k = 0; k < xfloat_data._length(); ++k ) {
            insert_line('float' :+ k+1 :+ ' ' 
                                  :+ xfloat_data[k].px :+ ' '
                                  :+ xfloat_data[k].py :+ ' '  
                                  :+ xfloat_data[k].pw :+ ' '  
                                  :+ xfloat_data[k].ph :+ ' '  
                                  :+ xfloat_data[k].layout_name );
   }
   p_window_id = orig_view_id;
   int status = _ini_put_section(filename, 'Floating-edit-window-pos', temp_view_id);
   if (status) {
      _message_box('Error writing file : ' :+ filename);
   }
}


static void load_xuser_data()
{
   _str filename = _ConfigPath():+'xuser-data.ini';
   status := _ini_get_section(filename, 'Floating-edit-window-pos', auto tempWID);
   if (status)
   {
      //_message_box('Error reading file : ' :+ filename);
      return;
   }

   origWID := p_window_id;
   p_window_id = tempWID;
   xfloat_data._makeempty();
   top();
   _str line = '';
   int k = 0;
   for ( ; k < 3; ++k ) {
      get_line(line);
      _str s0, s1, s2, s3, s4, s5;
      parse line with s0 s1 s2 s3 s4 s5 .;
      xfloat_data[k].px = (int)s1;  
      xfloat_data[k].py = (int)s2; 
      xfloat_data[k].pw = (int)s3; 
      xfloat_data[k].ph = (int)s4;
      xfloat_data[k].layout_name = s5;
      if (down())
         break;
   }
   p_window_id = origWID;
}



// _MDICurrent
// _MDIFromChild
// _MDICurrentFloating

#ifndef CURRENT_LAYOUT_PROPERTY
#define CURRENT_LAYOUT_PROPERTY  'CurrentLayout'
#endif

_command void xset_float1() name_info(',')
{
   wid := _MDICurrentFloating();
   if ( wid ) {
      xfloat_data[0].px = wid.p_x;
      xfloat_data[0].py = wid.p_y;
      xfloat_data[0].pw = wid.p_width;
      xfloat_data[0].ph = wid.p_height;
      _str layout;
      _MDIGetUserProperty(wid, CURRENT_LAYOUT_PROPERTY, layout);
      xfloat_data[0].layout_name = layout;
      save_xuser_data();
   }
}


_command void xset_float2() name_info(',')
{
   wid := _MDICurrentFloating();
   if ( wid ) {
      xfloat_data[1].px = wid.p_x;
      xfloat_data[1].py = wid.p_y;
      xfloat_data[1].pw = wid.p_width;
      xfloat_data[1].ph = wid.p_height;
      _str layout;
      _MDIGetUserProperty(wid, CURRENT_LAYOUT_PROPERTY, layout);
      xfloat_data[1].layout_name = layout;
      save_xuser_data();
   }
}


_command void xset_float3() name_info(',')
{
   wid := _MDICurrentFloating();
   if ( wid ) {
      xfloat_data[2].px = wid.p_x;
      xfloat_data[2].py = wid.p_y;
      xfloat_data[2].pw = wid.p_width;
      xfloat_data[2].ph = wid.p_height;
      _str layout;
      _MDIGetUserProperty(wid, CURRENT_LAYOUT_PROPERTY, layout);
      xfloat_data[2].layout_name = layout;
      save_xuser_data();
   }
}


_command void xfloat1() name_info(',')
{
   float_window();
   if ( xfloat_data._length() < 1 ) {
      _message_box('Call xset_float1 to set window pos and layout.');
      return;
   }
   wid := _MDICurrentFloating();
   if ( wid ) {
      wid.p_x =           xfloat_data[0].px;
      wid.p_y =           xfloat_data[0].py;
      wid.p_width =       xfloat_data[0].pw;
      wid.p_height =      xfloat_data[0].ph;
      applyLayout(xfloat_data[0].layout_name);
   }
}


_command void xfloat2() name_info(',')
{
   float_window();
   if ( xfloat_data._length() < 2 ) {
      _message_box('Call xset_float2 to set window pos and layout.');
      return;
   }
   wid := _MDICurrentFloating();
   if ( wid ) {
      wid.p_x =           xfloat_data[1].px;
      wid.p_y =           xfloat_data[1].py;
      wid.p_width =       xfloat_data[1].pw;
      wid.p_height =      xfloat_data[1].ph;
      applyLayout(xfloat_data[1].layout_name);
   }
}


_command void xfloat3() name_info(',')
{
   float_window();
   if ( xfloat_data._length() < 3 ) {
      _message_box('Call xset_float3 to set window pos and layout.');
      return;
   }
   wid := _MDICurrentFloating();
   if ( wid ) {
      wid.p_x =           xfloat_data[2].px;
      wid.p_y =           xfloat_data[2].py;
      wid.p_width =       xfloat_data[2].pw;
      wid.p_height =      xfloat_data[2].ph;
      applyLayout(xfloat_data[2].layout_name);
   }
}


_command show_xmenu1() name_info(',')
{
   mou_show_menu('xmenu1');
}


definit()
{
   load_xuser_data();
}

