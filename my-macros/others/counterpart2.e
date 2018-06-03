#include "slick.sh"

/**
 * @author Ryan Anderson  2001/6/23  -  Rewritten:  2001/08/28
 * @description Jumps to the counterpart file.
 *    <p>It starts in the same directory as the current buffer,
 *    then it searches the project file list,
 *    and then the include variable
 */
_command void counterpart()  name_info(',' VSARG2_MACRO | VSARG2_REQUIRES_EDITORCTL | VSARG2_READ_ONLY)
{
   _str filename  = p_buf_name;
   _str directory = strip_filename(filename, 'NE');  // Holds the directory of the file
   _str extension = get_extension(filename);         // Holds the extension of the file
   _str name      = strip_filename(filename, 'PE');  // Holds the name of the file
   _str new_extension;
   switch (lowcase(extension)) {
   case 'e':      new_extension = 'ex';      break;
   case 'ex':     new_extension = 'e';       break;
   case 'mai':    new_extension = 'rpe';     break;
   case 'rpe':    new_extension = 'mai';     break;
   case 'wip':    new_extension = 'mai';     break;
   case 'cpp':    new_extension = 'h';       break;
   case 'c':      new_extension = 'h';       break;
   case 'h':      new_extension = 'c';       break;
   case 'cxx':    new_extension = 'hxx';     break;
   case 'hxx':    new_extension = 'cxx';     break;
   case 'java':   new_extension = 'class';   break;
   case 'class':  new_extension = 'java';    break;
   default:    {
         _message_box("This file type is not permitted to use this macro.", "counterpart Error Message");
         return;
      }
   }
   counterpart_fileopen(directory, name, new_extension);
}

static void counterpart_fileopen(_str directory, _str name, _str new_extension)
{
   while (1) {
   _str FullName = '';
   _str TempLine = '';

   // Is the file in the same directory as the current buffer?
   if (file_exists(directory name'.'new_extension)) {
      e(maybe_quote_filename(directory name'.'new_extension));
      return;
   }
   if (_project_name != '') {
      // You have a project open:
      //    1. Look through the project directories
      //    2. Look through the include directories

      // Is the file in the include directories?
      FullName = include_search(name'.'new_extension, '=');
      if (FullName != '') {
         e(maybe_quote_filename(FullName));
         return;
      }

      // If not, is the file in the project directories?
      int orig_view_id = p_view_id;
      int temp_view_id = 0;
      GetProjectFiles(_project_name, temp_view_id);
      p_view_id = temp_view_id;
      top();
      up();
      int search_status = search('^?*'_escape_re_chars(name'.'new_extension)'$', '@r'_fpos_case);
      if (!search_status) {
         get_line(TempLine);
      }
      p_view_id = orig_view_id;
      _delete_temp_view(temp_view_id);
      if (TempLine != '') {
         if (file_exists(TempLine)) {
            e(maybe_quote_filename(TempLine));
            return;
         } else {
            int status = _message_box("This file is listed in the project, but does not exist.  Do you want to create it in the project's listed location?  \n(No will continue to search the Include directories.)", "counterpart Prompt", MB_YESNO);
            if (status == IDYES) {
               e(maybe_quote_filename(TempLine));
               return;
            }
         }
      }
      }

      if (new_extension == 'c') {
         new_extension = 'cpp';
      }
      else
         break;
   }

   // The file does not exist in any of the above, would you like to create it?
   _str status = _message_box("This file does not exist.  Do you want to create it?", "counterpart Prompt", MB_YESNO);
   if (status == IDYES) {
      e(maybe_quote_filename(directory name'.'new_extension));
   }
}
