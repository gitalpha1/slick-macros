#include "slick.sh"
_command last_recorded_macro() name_info(','VSARG2_MARK|VSARG2_REQUIRES_EDITORCTL)
{
   _macro('R',1);
   if (find("/>","I>P")) stop();
   _end_select('',false,false);
   _deselect();
   split_insert_line();
}
