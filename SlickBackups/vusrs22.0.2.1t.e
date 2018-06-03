#include 'slick.sh'
_menu _grep_menu_default {
   "Quick Search","quick-search","","","Searches for current word or selection";
   "Filter Search Results...","filter-search-results","","","Refine search results";
   "-","","","","";
   "Open as Editor Window","grep-command-menu s","","","";
   "Go to Line","grep-command-menu g","","","";
   "Bookmark Line","grep-command-menu b","","","";
   "-","","","","";
   "Clear Window","grep-command-menu c","","","";
   "Align Columns","grep-command-menu a","","","";
   "Collapse All","grep-command-menu h","","","";
   "Expand All","grep-command-menu x","","","";
   "Show conte&xt","XSHOW_SEARCH_CONTEXT_FUNCTION","","help context menu","";
   "remove binary","try-remove-binary","","","";
   "set binary filter","set-binary-filter","","","";
}
_form _tbvc_form {
   p_backcolor=0x80000005;
   p_border_style=BDS_SIZABLE;
   p_caption="Version Control";
   p_CaptionClick=true;
   p_forecolor=0x80000008;
   p_height=900;
   p_tool_window=true;
   p_visible=false;
   p_width=2000;
   p_x=0;
   p_y=0;
   p_eventtab2=_qtoolbar_etab2;
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="svc-diff-with-tip";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Diff current file with the most recent version";
      p_Nofstates=1;
      p_picture="bbvc_diff.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=1;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=112;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="svc-diff-current-symbol_with-tip";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Diff the current symbol with the most recent version";
      p_Nofstates=1;
      p_picture="bbvc_diff_symbol.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=2;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=546;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="svc-diff-symbols-with-tip";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Diff all symbols in the current file with the most recent version";
      p_Nofstates=1;
      p_picture="bbvc_diff_tags.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=3;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=980;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="svc-history";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Show Version Control history for the current file";
      p_Nofstates=1;
      p_picture="bbvc_history.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=4;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=1414;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="space1";
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_TOOLBAR_DIVIDER_VERT;
      p_tab_index=5;
      p_tab_stop=false;
      p_value=0;
      p_width=84;
      p_x=1848;
      p_y=40;
      p_eventtab=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="svc-commit";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Checks in current file";
      p_Nofstates=1;
      p_picture="bbcheckin.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=6;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=1932;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="svc-checkout";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Checks out source code from Version Control";
      p_Nofstates=1;
      p_picture="bbcheckout.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=7;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=2366;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="vclock";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Locks the current file without checking out the file";
      p_Nofstates=1;
      p_picture="bbvc_lock.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=8;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=2800;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="vcunlock";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Unlocks the current file without checking in the file";
      p_Nofstates=1;
      p_picture="bbvc_unlock.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=9;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=3234;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="space1";
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_TOOLBAR_DIVIDER_VERT;
      p_tab_index=10;
      p_tab_stop=false;
      p_value=0;
      p_width=84;
      p_x=3668;
      p_y=40;
      p_eventtab=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="svc-update";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Get most recent version of current file from version control";
      p_Nofstates=1;
      p_picture="bbvc_update.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=11;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=3752;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="svc-gui-mfupdate";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Compare Directory with Version Control";
      p_Nofstates=1;
      p_picture="bbvc_dir_update.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=12;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=4186;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="svc-gui-mfupdate-project";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Compare current Project with Version Control";
      p_Nofstates=1;
      p_picture="bbvc_project_update.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=13;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=4620;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="svc-gui-mfupdate-project-dependencies";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Compare current Project and Dependencies with Version Control";
      p_Nofstates=1;
      p_picture="bbvc_project_dependencies.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=14;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=5054;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="svc-gui-mfupdate-workspace";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Compare Workspace with Version Control";
      p_Nofstates=1;
      p_picture="bbvc_workspace_update.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=15;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=5488;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="space1";
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_TOOLBAR_DIVIDER_VERT;
      p_tab_index=16;
      p_tab_stop=false;
      p_value=0;
      p_width=84;
      p_x=5922;
      p_y=40;
      p_eventtab=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="svc-add";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Add Current file to version control";
      p_Nofstates=1;
      p_picture="bbvc_add.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=17;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=6006;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="vcsetup";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Allows you to choose and configure a Version Control interface";
      p_Nofstates=1;
      p_picture="bbvc_setup.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=18;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=6440;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
}

defmain()
{
}
