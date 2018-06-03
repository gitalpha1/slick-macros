

  // ********************  FUNCTION KEYS  ********************

  'F1'=            myhelp;
  'C-F1'=          comment;
  'A-F1'=          reflow_comment;
  'C-S-F1'=        comment_erase;

  'F2'=            my_comment_wrap_toggle;
  'S-F2'=          toggle_refs;
  'C-F2'=          toggle_defs;
  'A-F2'=          toggle_search;
  'C-S-F2'=        toggle_bookmarks;

  'F3'=            repeat_find_word_at_cursor;
  'S-F3'=          repeat_find_word_at_cursor_reverse;
  'C-F3'=          find_next_word_at_cursor;
  'A-F3'=          create_tile;
  'C-S-F3'=        find_prev_word_at_cursor;

  'F4'=            next_buffer_bookmark;
  'S-F4'=          prev_bookmark;
  'C-F4'=          quit;
  'A-F4'=          safe_exit;
  'C-S-F4'=        toggle_bookmark;

  'F5'=            my_set_bookmark;
  'S-F5'=          toggle_bookmark;
  'C-F5'=          push_bookmark;
  'A-F5'=          pop_all_bookmarks;
  'C-S-F5'=        debug_restart;
  'A-S-F5'=        pop_all_bookmarks;

  'F6'=            next_window;
  'S-F6'=          prev_window;
  'C-F6'=          xfg;
  'A-F6'=          show_selection;
  'C-S-F6'=        prev_window;

  'F7'=            gui_open;
  'S-F7'=          toggle_font;
  'C-F7'=          increase_font_size;
  'C-S-F7'=        decrease_font_size;

  'F8'=            select_code_block;
  'S-F8'=          hide_code_block;
  'C-F8'=          hide_selection;
  'A-F8'=          show_all;
  'C-S-F8'=        select_paren_block;
  'A-S-F8'=        hide_all_comments;

  'F9'=            complete_prev_no_dup;
  'S-F9'=          complete_next_no_dup;
  'C-F9'=          complete_prev;
  'A-F9'=          complete_list;
  'C-S-F9'=        complete_next;
  'A-S-F9'=        complete_more;

  'F10'=           search_workspace_cur_word_now;
  'S-F10'=         copy_selective_display;
  'C-F10'=         open_project_file;
  'A-F10'=         maximize_mdi;

  'F11'=           load_named_state;
  'S-F11'=         save_named_state;
  'C-F11'=         activate_preview;

  'F12'=           xretrace_cursor_prev_buffer;
  'S-F12'=         save;
  'C-F12'=         record_macro_end_execute;
  'A-F12'=         force_load;
  'C-S-F12'=       default_keys:C_S_F12;

  // ********************  NON ALPHA-NUMERIC KEYS  ********************

  ' '=             maybe_complete;
  'S- '=           keyin_space;
  'C- '=           search_workspace_whole_cur_word_now;
  'A- '=           func_comment;
  'C-S- '=         autocomplete;

  'BACKSPACE'=     linewrap_rubout;
  'S-BACKSPACE'=   undo_cursor;
  'C-BACKSPACE'=   delete_prev_token;
  'A-BACKSPACE'=   xundo;
  'C-A-BACKSPACE'= cut_prev_sexp;

  'UP'=            cursor_up;
  'S-UP'=          cua_select;
  'C-UP'=          prev_proc;
  'A-UP'=          scroll_up;
  'C-S-UP'=        prev_error;
  'A-S-UP'=        xretrace_modified_line_steps;
  'C-A-UP'=        xretrace_cursor_steps;
  'C-A-S-UP'=      add_multiple_cursor_up;

  'DOWN'=          cursor_down;
  'S-DOWN'=        cua_select;
  'C-DOWN'=        next_proc;
  'A-DOWN'=        scroll_down;
  'C-S-DOWN'=      next_error;
  'A-S-DOWN'=      cua_select;
  'C-A-DOWN'=      end_proc;
  'C-A-S-DOWN'=    add_multiple_cursor_down;

  'LEFT'=          cursor_left;
  'S-LEFT'=        cua_select;
  'C-LEFT'=        prev_word;
  'A-LEFT'=        cursor_to_prev_token;
  'C-S-LEFT'=      cua_select;
  'A-S-LEFT'=      xretrace_cursor_back;
  'C-A-LEFT'=      xretrace_cursor;
  'C-A-S-LEFT'=    select_prev_sexp;

  'RIGHT'=         cursor_right;
  'S-RIGHT'=       cua_select;
  'C-RIGHT'=       next_word;
  'A-RIGHT'=       cursor_to_next_token;
  'C-S-RIGHT'=     cua_select;
  'A-S-RIGHT'=     xretrace_cursor_fwd;
  'C-A-RIGHT'=     xretrace_modified_line;
  'C-A-S-RIGHT'=   select_next_sexp;

  'ENTER'=         split_insert_line;
  'S-ENTER'=       keyin_enter;
  'C-ENTER'=       my_gui_find;
  'A-ENTER'=       what_is;
  'C-S-ENTER'=     nosplit_insert_line_above;
  'A-S-ENTER'=     where_is;
  'C-A-ENTER'=     xkey_binding_trainer;
  'C-A-S-ENTER'=   xkey_bindings_show;

  'TAB'=           move_text_tab;
  'S-TAB'=         move_text_backtab;
  'C-TAB'=         next_window;
  'C-S-TAB'=       prev_window;

  'HOME'=          begin_line_text_toggle;
  'S-HOME'=        cua_select;
  'C-HOME'=        top_of_buffer;
  'C-S-HOME'=      cua_select;
  'A-S-HOME'=      cua_select;

  'END'=           end_line;
  'S-END'=         cua_select;
  'C-END'=         bottom_of_buffer;
  'C-S-END'=       cua_select;
  'A-S-END'=       cua_select;

  'PGUP'=          page_up;
  'S-PGUP'=        cua_select;
  'C-PGUP'=        top_of_window;

  'PGDN'=          page_down;
  'S-PGDN'=        cua_select;
  'C-PGDN'=        bottom_of_window;

  'DEL'=           linewrap_delete_char;
  'S-DEL'=         delete_line;
  'C-DEL'=         delete_next_token;
  'C-S-DEL'=       delete_end_line;

  'INS'=           insert_toggle;
  'S-INS'=         paste;
  'C-INS'=         copy_to_clipboard;

  'C-['=           next_hotspot;
  'C-S-['=         prev_hotspot;

  'C-]'=           find_matching_paren;

  'C-,'=           pop_bookmark;
  'A-,'=           function_argument_help;
  'C-S-,'=         complete_prev;

  'C-.'=           preview_push_tag;
  'A-.'=           list_symbols;
  'C-S-.'=         push_tag;
  'C-A-.'=         push_alttag;

  'C-/'=           push_ref;

  'C-\'=           show_my_fave_cmds3;
  'C-S-\'=         add_multiple_cursors;


  "C-'"=           execute_last_macro;
  "C-S-'"=         aaa;

  'C-='=           wfont_zoom_in;
  'A-='=           execute_selection;
  'C-S-='=         diff;

  'C--'=           wfont_zoom_out;

  'C-`'=           edit_associated_file;
  'A-`'=           edit_associated_symbol;

  'PAD-PLUS'=      xretrace_cursor;
  'C-PAD-PLUS'=    my_plusminus;
  'A-PAD-PLUS'=    xretrace_modified_line;
  'C-S-PAD-PLUS'=  plusminus;

  'PAD-MINUS'=     xretrace_cursor_back;
  'C-PAD-MINUS'=   xretrace_cursor_steps;
  'A-PAD-MINUS'=   xretrace_modified_line_steps;
  'C-S-PAD-MINUS'= show_braces;

  'A-PAD-STAR'=    debug_show_next_statement;



  // ********************  LETTERS  ********************

  'C-A'=           select_all;
  'A-A'=           show_my_fave_cmds2;
  'C-S-A'=         cap_selection;
  'C-A-A'=         activate_autos;

  'C-B'=           select_block;
  'C-S-B'=         list_buffers;
  'A-S-B'=         document_tab_list_buffers;
  'C-A-B'=         activate_breakpoints;

  'C-C'=           copy_to_clipboard;
  'C-S-C'=         append_to_clipboard;
  'C-A-C'=         activate_call_stack;

  'C-D'=           gui_cd;
  'C-S-D'=         javadoc_editor;

  'C-E'=           cut_end_line;
  'C-S-E'=         list_errors;

  'C-F'=           gui_find;
  'C-S-F'=         find_in_files;
  'A-S-F'=         find;

  'C-G'=           find_next;
  'C-S-G'=         find_prev;

  'C-H'=           edit_associated_file;
  'C-S-H'=         hex;
  'C-A-H'=         activate_threads;

  'C-I'=           i_search;
  'C-S-I'=         reverse_i_search;

  'C-J'=           gui_goto_line;
  'C-S-J'=         toggle_bookmark;

  'C-K'=           copy_word;
  'C-S-K'=         cut_word;

  'C-L'=           lowcase_selection;
  'A-L'=           lowcase_char;
  'C-S-L'=         select_line;
  'C-A-L'=         activate_locals;

  'C-M'=           show_xmenu2;
  'A-M'=           show_my_fave_cmds2;
  'C-S-M'=         show_my_fave_cmds3;
  'A-S-M'=         comment;
  'C-A-M'=         activate_members;

  'C-N'=           next_buffer;
  'C-S-N'=         activate_bookmarks;

  'C-O'=           gui_open;
  'A-O'=           gui_open;
  'C-S-O'=         expand_alias;

  'C-P'=           prev_buffer;
  'C-S-P'=         expand_extension_alias;

  'C-Q'=           quick_search;
  'A-Q'=           refactor_quick_rename;
  'C-S-Q'=         quick_reverse_search;

  'C-R'=           gui_replace;
  'C-S-R'=         replace_in_files;

  'C-S'=           save;
  'C-S-S'=         save_all;

  'C-T'=           transpose_chars;
  'A-T'=           transpose_lines;
  'C-S-T'=         transpose_words;

  'C-U'=           upcase_selection;
  'A-U'=           upcase_char;
  'C-S-U'=         deselect;

  'C-V'=           paste;
  'C-S-V'=         list_clipboards;
  'A-S-V'=         paste_replace_word;
  'C-A-V'=         activate_variables;

  'C-W'=           default_keys:C_W;
  'C-S-W'=         prev_window;
  'C-A-W'=         activate_watch;

  'C-X'=           cut;
  'C-S-X'=         append_cut;

  'C-Y'=           redo;
  'C-S-Y'=         goto_col;

  'C-Z'=           undo;
  'C-S-Z'=         zoom_window;

  // ********************  NUMBERS  ********************

  'C-0'=           alt_bookmark;
  'C-S-0'=         alt_gtbookmark;

  'C-1'=           alt_bookmark;
  'A-1'=           cursor_error;
  'C-S-1'=         alt_gtbookmark;

  'C-2'=           alt_bookmark;
  'C-S-2'=         alt_gtbookmark;

  'C-3'=           alt_bookmark;
  'A-3'=           activate_watch;
  'C-S-3'=         alt_gtbookmark;

  'C-4'=           alt_bookmark;
  'A-4'=           activate_variables;
  'C-S-4'=         alt_gtbookmark;

  'C-5'=           alt_bookmark;
  'A-5'=           activate_registers;
  'C-S-5'=         alt_gtbookmark;

  'C-6'=           alt_bookmark;
  'A-6'=           activate_memory;
  'C-S-6'=         alt_gtbookmark;

  'C-7'=           alt_bookmark;
  'A-7'=           activate_call_stack;
  'C-S-7'=         alt_gtbookmark;

  'C-8'=           alt_bookmark;
  'C-S-8'=         alt_gtbookmark;

  'C-9'=           alt_bookmark;
  'C-S-9'=         alt_gtbookmark;

