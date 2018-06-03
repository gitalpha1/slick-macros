#include 'slick.sh'

const VI_INSERT_CURSOR='-v 750 1000 750 1000 750 1000 750 1000'
const VI_COMMAND_CURSOR='750 1000 750 1000 750 1000 750 1000'


// ONLY useful if in vi emulation!!!
// Toggles the cursor shape to an underscore-cursor if in command mode
typeless _vi_switchmode_cursor_shape()
{
   if( def_keys=='vi-keys' ) {
      mode=vi_get_vi_mode();
      if( mode=='C' ) {
         _cursor_shape(VI_COMMAND_CURSOR);
      } else {
         _cursor_shape(VI_INSERT_CURSOR);
      }
   }

   return(0);
}

// This command selects the scope at the cursor defined by {} () [] pairs
_command select_next_scope() name_info(','MARK_ARG2|READ_ONLY_ARG2)
{
   msg='No more scopes';   // Default message
   lsp='';          // Stands for last scope position
   soptions='r@';   // Search options
   status=1;
   if( select_active() ) {   // Is there a selection active
      save_pos(p);
      _begin_select();
      ch=get_text();
      q=pos(ch,'{([');
      // if on one of the chars '{', '(', or '[' AND not in a comment
      // AND not in a string
      if( q && !_in_comment() && !_in_string() ) {
         l1=p_line;
         c1=p_col;
         status=find_matching_paren();
         if( status ) {
            _deselect();
            restore_pos(p);
            _stack_clear();   // Make sure the stack buffer is cleared
         } else {
            ch=get_text();
            if( q==pos(ch,'})]') ) {
               l2=p_line;
               c2=p_col;
               lsp=l1' 'c1' 'l2' 'c2;
               status=_stack_pop(top_lsp,'1');   // '1' means pop without
                                                 // actually deleting from
                                                 // the stack

               if( top_lsp==lsp ) lsp='';   // This means that we have already
                                            // pushed this scope onto stack
               _begin_select();
               ++p_col;
               soptions=soptions:+'m';
            } else {
               _deselect();
               restore_pos(p);
               _stack_clear();   // Make sure the stack buffer is cleared
            }
         }
      } else {
         _deselect();
         restore_pos(p);
         _stack_clear();   // Make sure the stack buffer is cleared
      }
   } else {
      _stack_clear();   // Make sure the stack buffer is cleared
   }

   /* Find the paren/bracket/brace */
   for(;;) {
      status=search('\(|\[|\{',soptions);
      if ( !status ) {
         if( _in_comment() || _in_string() ) {
            ++p_col;   // Get off the comment/string
            continue;
         }
         _deselect();
         _select_char('','CI');
         if( lsp!='' ) {
            status=_stack_push(lsp);
            if( status ) {
               msg='Error pushing onto stack.  ':+get_message(status);
               break;
            }
         }
         lsp=p_line' 'p_col;
         status=find_matching_paren();
         if( status ) {
            _deselect();
            _stack_clear();
         } else {
            _select_char('','CI');
            lsp=lsp' 'p_line' 'p_col;
            _stack_push(lsp);
         }
      } else {
         if( !_stack_pop(lsp) ) {
            _end_select();
            ++p_col;
            save_pos(p);
            parse lsp with l1 c1 l2 c2

            // Select the previous scope
            _deselect();
            p_line=l1;
            p_col=c1;
            _select_char('','CI');
            p_line=l2;
            p_col=c2;
            _select_char('','CI');
            lock_selection(); clear_message();

            // Start searching from the end of the last scope
            // within the currently selected scope
            restore_pos(p);

            if( !pos('m',soptions) ) soptions=soptions:+'m';
            continue;
         } else {
            _stack_clear();
         }
      }
      break;
   }
   unlock_selection();
   if( status ) {
      vi_message(nls(msg));
   }
   return(status);
}


const STACK_BUFNAME='.stack';

// Pushes an item onto the stack
static typeless _stack_push(item)
{
   bufid=p_buf_id;
   stack_buf_already_loaded= !load_files('+q +b 'STACK_BUFNAME);
   if( !stack_buf_already_loaded ) {
      status=load_files('+t');
      if( status ) return(status);
      p_buf_name=STACK_BUFNAME;
      _delete_line();
      //p_buf_flags=p_buf_flags|HIDE_BUFFER|THROW_AWAY_CHANGES;
      p_buf_flags=p_buf_flags|THROW_AWAY_CHANGES;
   }
   stack_bufid=p_buf_id;
   bottom();
   insert_line(item);
   p_buf_id=bufid;
   return(0);
}

// Pops an item off the stack
static typeless _stack_pop(var item)
{
   item='';
   bufid=p_buf_id;
   status=load_files('+q +b 'STACK_BUFNAME);
   if( status ) return(status);
   stack_bufid=p_buf_id;
   bottom();
   if( p_line ) {
      get_line(item);
      if( arg(2)=='' ) {
         _delete_line();
      }
   } else {
      status=1;
   }
   p_buf_id=bufid
   return(status);
}


// Clears the stack buffer of all stack entries
static typeless _stack_clear()
{
   bufid=p_buf_id;
   status=load_files('+q +b 'STACK_BUFNAME);
   if( !status ) {
      mark=_alloc_selection();
      if( rc ) {
         p_buf_id=bufid;
         return(rc);
      }
      if( p_line ) {
         top();
         _select_line(mark,'C');
         bottom();
         _select_line(mark,'C');
         _delete_selection(mark);
      }
      p_buf_id=bufid;
   }
   return(0);
}


// Deletes the stack buffer
static typeless _stack_drop()
{
   bufid=p_buf_id;
   status=load_files('+q +b 'STACK_BUFNAME);
   if( !status ) {
      _delete_buffer();
      p_buf_id=bufid;
   }
   return(0);
}


/* This function is only useful if you are writing macros.  When you do
 * a _begin_select() or _end_select() the selection is locked so that moving
 * the cursor does not deselect the selection.  This gets around the problem.
 * I've only had to use this once, so you may never need it.  The cursor is
 * placed at the beginning of the selection.
 */
typeless unlock_selection()
{
   if( select_active() ) {
      _get_selinfo(firstcol,lastcol,bufid);
      if( p_buf_id==bufid ) {
         stype=_select_type();
         soptions=_select_type('','I'):+'C';
         _begin_select();
         save_pos(p);
         _end_select();
         old_mark=_duplicate_selection('');
         mark=_alloc_selection();
         _show_selection(mark);
         _free_selection(old_mark);
         select_it(stype,'',soptions);
         restore_pos(p);
      }
   }
   return(0)
}


// Returns non-zero value if cursor is inside a string
int _in_string()
{
   if (p_lexer_name=='') {
      return(0);
   }
   color=_clex_find(0,'g');
   return((int) (color==CFG_STRING));
}


typeless _width;   /* _width is a global variable which holds the width of
                    * current selection at the current line.  This variable
                    * only differs for character (stream) selection and
                    * remains the same for line and column selections.
                    */

typeless def_increment_fill_options;   /* Setting this to 'R' will right-
                                        * justify the numbers inside the
                                        * column selection
                                        */

/* Make a column selection where the first thing at the top of the selection
 * is a starting number, say i.  Run this command and it will iteratively fill in
 * each line of the column selection with the result of the expression i=i+1.
 *
 * If there is no starting number, then 1 is used.
 */
_command increment_fill() name_info(','MARK_ARG2)
{
   status=0;
   if( select_active() && upcase(_select_type())=='BLOCK' ) {
      _begin_select();   // Goto top of block selection
      filter_init();     // Initialize selection filter operation
      filter_get_string(str);   // Get the first selected portion
      i=strip(str);
      
      // If user does not specify a starting number, then use 1
      if( i=='' ) i=1;
      
      count=0;
      if( isinteger(i) ) {
         do {
            ident_width=_width-length(i);
            ident_width= (ident_width<0)?(0):(ident_width);
            //ident=indent_string(ident_width);
            ident=substr('',1,ident_width);
            if( pos('R',upcase(def_increment_fill_options)) ) {
               new_str=ident:+i;
            } else {
               new_str=i:+ident;
            }
            if( count && str!='' ) {   /* Are we off the first line AND the
                                        * selected portion of the line was
                                        * NOT empty?
                                        */
               new_str=new_str:+str;
            }
            filter_put_string(new_str);   /* Replace the current line's
                                           * selected portion with
                                           * ident:+i where ':+' is the
                                           * concatenation operator
                                           */
            ++i;
            ++count;
         } while( !filter_get_string(str) );   /* WHILE NOT failed getting
                                                * the next selected portion
                                                * of the next line?
                                                */
         filter_restore_pos();   // Take us back to starting position
      } else {
         status=1;
         filter_restore_pos();
         message('Valid starting number required')
      }
   } else {
      status=1;
      message('Block selection required');
   }
   return(status);
}

_command count_noncomment_lines() name_info(','READ_ONLY_ARG2)
{
   noflines=0;
   top();up();
   while( !down() ) {
      get_line(line);
      if( line=='' ) continue;   // Blank line
      first_non_blank();
      if( !_in_comment() ) {
         ++noflines;
         continue;
      }
      i=length(strip(line,'T'));
      p_col=text_col(line,i,'I');   // Put cursor on last actual char
      while( _in_comment() ) {
         if( !_in_comment() ) break;
         if( down() ) break;
         get_line(line);
         i=length(strip(line,'T'));
         p_col=text_col(line,i,'I');   // Put cursor on last actual char
      }
      ++noflines;   // This will count the last line of a multi-line comment
   }
   message('Number of non-comment lines is 'noflines);
}

