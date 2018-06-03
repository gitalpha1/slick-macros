#include "slick.sh"

/**
 * @author Ryan Anderson  2002/12/18
 * @revised 2005/02/08
 * @description Counts the number of selectable characters and lines in the selection or buffer
 * @return  Returns the number of characters in the selection or buffer
 */
_command long count_characters() name_info(',' VSARG2_MACRO | VSARG2_REQUIRES_EDITORCTL | VSARG2_MARK | VSARG2_READ_ONLY)
{
   int p;
   save_pos(p);
   int retain_selection = 1;
   message('Counting Characters...');
   if (!select_active()) {
      // This will not count the last trailing end of line characters (if they exist)
      top();
      _select_char();
      bottom();
      _select_char();
      retain_selection = 0;
   }
   _begin_select();
   long starting_line = p_line;
   long start_value   = _QROffset();
   _end_select();
   long ending_line = p_line;
   long end_value   = _QROffset();
   long number_of_characters = end_value   - start_value;
   long number_of_lines      = ending_line - starting_line + 1;
   if (!retain_selection) {
      deselect();
      // (the trailing end of line characters are not selectable.)
      message('There are "'number_of_characters'" selectable characters (bytes), and "'number_of_lines'" lines in this buffer.');
   } else {
      message('There are "'number_of_characters'" characters (bytes) and "'number_of_lines'" lines in this selection.');
   }
   restore_pos(p);
   return(number_of_characters);
}
