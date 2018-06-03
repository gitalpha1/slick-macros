
#include "slick.sh"


#pragma option(strictsemicolons,on)
#pragma option(strict,on)
#pragma option(autodecl,off)
#pragma option(strictparens,on)


#define SAVE_VRESTORE_SLK
//#define DEBUG

static int xline, xcol;
static _str xbuf_name;
static int count_secs;
static boolean save_needed;
static int count_times;
static int xupdate_state_timer_handle;
static boolean save_now;

static void xupdate_state_timer_callback()
{
   if (!_use_timers || xupdate_state_timer_handle < 0) 
      return;

   if ( _no_child_windows() )
      return;

   if ((_mdi.p_child.p_line == xline) && (_mdi.p_child.p_buf_name == xbuf_name) && (_mdi.p_child.p_col == xcol)) 
   {
      if (save_now  ||  (++count_secs > 2) ) {
         count_secs = 0;
         if ( save_now || save_needed ) 
         {
            save_needed = false;
            save_now = false;
            // see _srg_workspace
            _workspace_save_state(!def_prompt_unnamed_save_all/*_workspace*/ && (def_restore_flags & RF_PROJECTFILES));

            #ifdef SAVE_VRESTORE_SLK
            save_window_config();
            #endif

            #ifdef DEBUG
            say("xupdate timer save");
            #endif
         }
      }
      return;
   }
   count_secs = 0;
   xline = _mdi.p_child.p_line;
   xcol = _mdi.p_child.p_col;
   xbuf_name = _mdi.p_child.p_buf_name;
   save_needed = true;
}

void _switchbuf_xupdate_state()
{
   save_now = true;
   xline = _mdi.p_child.p_line;
   xcol = _mdi.p_child.p_col;
   xbuf_name = _mdi.p_child.p_buf_name;
}


// _cbsave_xupdate_state is called automatically whenever any buffer is saved
void _cbsave_xupdate_state()
{
   _workspace_save_state(!def_prompt_unnamed_save_all/*_workspace*/ && (def_restore_flags & RF_PROJECTFILES));
   save_window_config();
   #ifdef DEBUG
   say("xupdate cbsave");
   #endif
}



void _cbquit2_xupdate_state()
{
   _cbsave_xupdate_state();
   #ifdef DEBUG
   say("xupdate cbquit2");
   #endif
}


void _buffer_add_xupdate_state()
{
   _switchbuf_xupdate_state();
}


void _on_load_module_xupdate_state(_str module_name)
{
   _str sm = strip(module_name, "B", "\'\"");
   if (strip_filename(sm, 'PD') == 'xupdate_state.e') {
      _kill_timer(xupdate_state_timer_handle);
      xupdate_state_timer_handle = -1;
   }
}


definit() {
   if (arg(1) == 'L') {
      _kill_timer(xupdate_state_timer_handle);
   }
   xupdate_state_timer_handle = _set_timer(1000, xupdate_state_timer_callback);
}

