#include 'slick.sh'
_form _tbstandard_form {
   p_backcolor=0x80000005;
   p_border_style=BDS_SIZABLE;
   p_caption="Standard";
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
      p_command="new";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Create an Empty File to Edit";
      p_Nofstates=1;
      p_picture="bbnew.svg";
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
      p_command="gui-open";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Open a File for Editing";
      p_Nofstates=1;
      p_picture="bbopen.svg";
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
      p_command="save";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Save Current File";
      p_Nofstates=1;
      p_picture="bbsave.svg";
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
      p_command="history-diff-machine-file";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="List Backup History for Current File";
      p_Nofstates=1;
      p_picture="bbsave_history.svg";
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
      p_command="history-diff-machine-file";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="List Backup History for Current File";
      p_Nofstates=1;
      p_picture="bbsave_history.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=5;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=1848;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="gui-print";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Print Current File";
      p_Nofstates=1;
      p_picture="bbprint.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=6;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=2282;
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
      p_tab_index=7;
      p_tab_stop=false;
      p_value=0;
      p_width=84;
      p_x=2716;
      p_y=40;
      p_eventtab=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="cut";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Delete Selected Text and Copy to the Clipboard";
      p_Nofstates=1;
      p_picture="bbcut.svg";
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
      p_command="copy-to-clipboard";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Copy Selected Text to the Clipboard";
      p_Nofstates=1;
      p_picture="bbcopy.svg";
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
      p_command="paste";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Paste Clipboard into Current File";
      p_Nofstates=1;
      p_picture="bbpaste.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=10;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=3668;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="select-code-block";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Select Lines in the Current Code Block";
      p_Nofstates=1;
      p_picture="bbselect_code_block.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=11;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=4102;
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
      p_tab_index=12;
      p_tab_stop=false;
      p_value=0;
      p_width=84;
      p_x=4536;
      p_y=40;
      p_eventtab=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="undo";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Undo the Last Edit Operation";
      p_Nofstates=1;
      p_picture="bbundo.svg";
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
      p_command="redo";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Undo the Last Undo Operation";
      p_Nofstates=1;
      p_picture="bbredo.svg";
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
      p_command="back";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Navigate Backward";
      p_Nofstates=1;
      p_picture="bbback.svg";
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
      p_command="forward";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Navigate Forward";
      p_Nofstates=1;
      p_picture="bbforward.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=16;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=5922;
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
      p_tab_index=17;
      p_tab_stop=false;
      p_value=0;
      p_width=84;
      p_x=6356;
      p_y=40;
      p_eventtab=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="gui-find";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Search for a String You Specify";
      p_Nofstates=1;
      p_picture="bbfind.svg";
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
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="find-next";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Search for the Next Occurrence of the String You Last Searched";
      p_Nofstates=1;
      p_picture="bbfind_next.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=19;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=6874;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="gui-replace";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Search for a String and Replace it with Another String";
      p_Nofstates=1;
      p_picture="bbreplace.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=20;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=7308;
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
      p_tab_index=21;
      p_tab_stop=false;
      p_value=0;
      p_width=84;
      p_x=7742;
      p_y=40;
      p_eventtab=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="fullscreen";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Toggle Full Screen Editing Mode";
      p_Nofstates=1;
      p_picture="bbfullscreen.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=22;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=7826;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="config";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Displays the configuration options dialog";
      p_Nofstates=1;
      p_picture="bbconfig.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=23;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=8260;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="help -contents";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="SlickEdit Help";
      p_Nofstates=1;
      p_picture="bbvsehelp.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=24;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=8694;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
}
_form _tbtagging_form {
   p_backcolor=0x80000005;
   p_border_style=BDS_SIZABLE;
   p_caption="Context Tagging"VSREGISTEREDTM_TITLEBAR;
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
      p_command="gui-make-tags";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Build Tag Files for Use by the Symbol Browser and Other Context Tagging"VSREGISTEREDTM" Features";
      p_Nofstates=1;
      p_picture="bbmake_tags.svg";
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
      p_command="gui-push-tag";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Activate the Find Symbol Tool Window to Locate Tags";
      p_Nofstates=1;
      p_picture="bbfind_symbol.svg";
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
      p_command="cb-find";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Find the Symbol under the Cursor and Display in Symbol Browser";
      p_Nofstates=1;
      p_picture="bbclass_browser_find.svg";
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
      p_command="push-ref";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Go to Reference";
      p_Nofstates=1;
      p_picture="bbfind_refs.svg";
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
      p_command="push-tag";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Go to Definition";
      p_Nofstates=1;
      p_picture="bbpush_tag.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=5;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=1848;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="push-alttag";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Go to Declaration";
      p_Nofstates=1;
      p_picture="bbpush_decl.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=6;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=2282;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="push-alttag";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Go to Declaration";
      p_Nofstates=1;
      p_picture="bbpush_decl.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=7;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=2716;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="pop-bookmark";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Pop the Last Bookmark";
      p_Nofstates=1;
      p_picture="bbpop_tag.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=8;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=3150;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="next-tag";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Place Cursor on Next Symbol Definition";
      p_Nofstates=1;
      p_picture="bbnext_tag.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=9;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=3584;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="prev-tag";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Place Cursor on Previous Symbol Definition";
      p_Nofstates=1;
      p_picture="bbprev_tag.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=10;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=4018;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="end-tag";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Place Cursor at the End of the Current Symbol Definition";
      p_Nofstates=1;
      p_picture="bbend_tag.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=11;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=4452;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="function-argument-help";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Display Prototype(s) and Highlight Current Argument";
      p_Nofstates=1;
      p_picture="bbfunction_help.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=12;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=4886;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="list-symbols";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="List Valid Symbols for Current Context";
      p_Nofstates=1;
      p_picture="bblist_symbols.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=13;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=5320;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="refactor_quick_rename precise";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Rename Symbol under Cursor";
      p_Nofstates=1;
      p_picture="bbrefactor_rename.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=14;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=5754;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
}
_form _tbandroid_form {
   p_backcolor=0x80000005;
   p_border_style=BDS_SIZABLE;
   p_caption="Android";
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
      p_command="android_avd_manager";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Launch Android Virtual Device Manager";
      p_Nofstates=1;
      p_picture="bbandroid_avd.svg";
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
      p_command="android_sdk_manager";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Launch Android SDK Manager";
      p_Nofstates=1;
      p_picture="bbandroid_sdk.svg";
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
      p_command="android-avd-manager";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Launch Android Virtual Device Manager";
      p_Nofstates=1;
      p_picture="bbandroid_avd.svg";
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
      p_command="android-sdk-manager";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Launch Android SDK Manager";
      p_Nofstates=1;
      p_picture="bbandroid_sdk.svg";
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
      p_command="android-ddms";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Launch DDMS (Dalvik Debug Monitor)";
      p_Nofstates=1;
      p_picture="bbandroid_ddms.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=5;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=1848;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="android_ddms";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Launch DDMS (Dalvik Debug Monitor)";
      p_Nofstates=1;
      p_picture="bbandroid_ddms.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=6;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=2282;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
}
_menu fave_cmds3 {
   "&bookmarks toggle","toggle_bookmarks","","","";
   " &context","toggle_context","","","";
   " &defs","toggle_defs","","","";
   " &find_symbol","toggle_find_symbol","","","";
   " &h deltasave","toggle_deltasave","","","";
   " &projects","toggle_projects","","","";
   " &references","toggle_refs","","","";
   " &search","toggle_search","","","";
   " &v preview","toggle_preview","","","";
   " &y symbol","toggle_symbol","","","";
}
_form old_tbstandard_form {
   p_backcolor=0x80000005;
   p_border_style=BDS_SIZABLE;
   p_caption="Standard";
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
      p_command="new";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Create an Empty File to Edit";
      p_Nofstates=1;
      p_picture="bbnew.svg";
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
      p_command="gui-open";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Open a File for Editing";
      p_Nofstates=1;
      p_picture="bbopen.svg";
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
      p_command="save";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Save Current File";
      p_Nofstates=1;
      p_picture="bbsave.svg";
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
      p_command="history-diff-machine-file";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="List Backup History for Current File";
      p_Nofstates=1;
      p_picture="bbsave_history.svg";
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
      p_command="history-diff-machine-file";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="List Backup History for Current File";
      p_Nofstates=1;
      p_picture="bbsave_history.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=5;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=1848;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="gui-print";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Print Current File";
      p_Nofstates=1;
      p_picture="bbprint.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=6;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=2282;
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
      p_tab_index=7;
      p_tab_stop=false;
      p_value=0;
      p_width=84;
      p_x=2716;
      p_y=40;
      p_eventtab=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="cut";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Delete Selected Text and Copy to the Clipboard";
      p_Nofstates=1;
      p_picture="bbcut.svg";
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
      p_command="copy-to-clipboard";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Copy Selected Text to the Clipboard";
      p_Nofstates=1;
      p_picture="bbcopy.svg";
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
      p_command="paste";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Paste Clipboard into Current File";
      p_Nofstates=1;
      p_picture="bbpaste.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=10;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=3668;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="select-code-block";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Select Lines in the Current Code Block";
      p_Nofstates=1;
      p_picture="bbselect_code_block.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=11;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=4102;
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
      p_tab_index=12;
      p_tab_stop=false;
      p_value=0;
      p_width=84;
      p_x=4536;
      p_y=40;
      p_eventtab=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="undo";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Undo the Last Edit Operation";
      p_Nofstates=1;
      p_picture="bbundo.svg";
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
      p_command="redo";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Undo the Last Undo Operation";
      p_Nofstates=1;
      p_picture="bbredo.svg";
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
      p_command="back";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Navigate Backward";
      p_Nofstates=1;
      p_picture="bbback.svg";
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
      p_command="forward";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Navigate Forward";
      p_Nofstates=1;
      p_picture="bbforward.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=16;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=5922;
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
      p_tab_index=17;
      p_tab_stop=false;
      p_value=0;
      p_width=84;
      p_x=6356;
      p_y=40;
      p_eventtab=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="gui-find";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Search for a String You Specify";
      p_Nofstates=1;
      p_picture="bbfind.svg";
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
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="find-next";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Search for the Next Occurrence of the String You Last Searched";
      p_Nofstates=1;
      p_picture="bbfind_next.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=19;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=6874;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="gui-replace";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Search for a String and Replace it with Another String";
      p_Nofstates=1;
      p_picture="bbreplace.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=20;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=7308;
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
      p_tab_index=21;
      p_tab_stop=false;
      p_value=0;
      p_width=84;
      p_x=7742;
      p_y=40;
      p_eventtab=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="fullscreen";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Toggle Full Screen Editing Mode";
      p_Nofstates=1;
      p_picture="bbfullscreen.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=22;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=7826;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="config";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Displays the configuration options dialog";
      p_Nofstates=1;
      p_picture="bbconfig.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=23;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=8260;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="help -contents";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="SlickEdit Help";
      p_Nofstates=1;
      p_picture="bbvsehelp.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=24;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=8694;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
}
_form old_tbtagging_form {
   p_backcolor=0x80000005;
   p_border_style=BDS_SIZABLE;
   p_caption="Context Tagging"VSREGISTEREDTM_TITLEBAR;
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
      p_command="gui-make-tags";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Build Tag Files for Use by the Symbol Browser and Other Context Tagging"VSREGISTEREDTM" Features";
      p_Nofstates=1;
      p_picture="bbmake_tags.svg";
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
      p_command="gui-push-tag";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Activate the Find Symbol Tool Window to Locate Tags";
      p_Nofstates=1;
      p_picture="bbfind_symbol.svg";
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
      p_command="cb-find";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Find the Symbol under the Cursor and Display in Symbol Browser";
      p_Nofstates=1;
      p_picture="bbclass_browser_find.svg";
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
      p_command="push-ref";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Go to Reference";
      p_Nofstates=1;
      p_picture="bbfind_refs.svg";
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
      p_command="push-tag";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Go to Definition";
      p_Nofstates=1;
      p_picture="bbpush_tag.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=5;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=1848;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="push-alttag";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Go to Declaration";
      p_Nofstates=1;
      p_picture="bbpush_decl.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=6;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=2282;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="push-alttag";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Go to Declaration";
      p_Nofstates=1;
      p_picture="bbpush_decl.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=7;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=2716;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="pop-bookmark";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Pop the Last Bookmark";
      p_Nofstates=1;
      p_picture="bbpop_tag.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=8;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=3150;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="next-tag";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Place Cursor on Next Symbol Definition";
      p_Nofstates=1;
      p_picture="bbnext_tag.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=9;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=3584;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="prev-tag";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Place Cursor on Previous Symbol Definition";
      p_Nofstates=1;
      p_picture="bbprev_tag.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=10;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=4018;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="end-tag";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Place Cursor at the End of the Current Symbol Definition";
      p_Nofstates=1;
      p_picture="bbend_tag.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=11;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=4452;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="function-argument-help";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Display Prototype(s) and Highlight Current Argument";
      p_Nofstates=1;
      p_picture="bbfunction_help.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=12;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=4886;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="list-symbols";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="List Valid Symbols for Current Context";
      p_Nofstates=1;
      p_picture="bblist_symbols.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=13;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=5320;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
   _image  {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_command="refactor_quick_rename precise";
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_message="Rename Symbol under Cursor";
      p_Nofstates=1;
      p_picture="bbrefactor_rename.svg";
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=14;
      p_tab_stop=false;
      p_value=0;
      p_width=434;
      p_x=5754;
      p_y=40;
      p_eventtab2=_ul2_picture;
   }
}
_menu ToDoMenu {
   "Goto TODO","ToDo_ViewSource","","","";
   "Generate TODO List","ToDo_GenerateList","","","";
   "Expand all","ToDo_expand_all","","","";
   "Collapse all","ToDo_collapse_all","","","";
   "-","","","","";
   submenu "TDML","","","" {
      "Use TDML","ToDo_ToggleTDML","","","";
      "Use Alternate TDML","ToDo_ToggleAltTDML","","","";
   }
   "Populate Message List","ToDo_ToggleMessageList","","","";
   "-","","","","";
   submenu "Sort By","","","" {
      "File","ToDo_SortByFile","","","";
      "Project","ToDo_SortByProject","","","";
   }
}
_menu xbar1_popup_menu {
}
_form form1 {
   p_backcolor=0x80000005;
   p_border_style=BDS_NONE;
   p_caption="form1";
   p_forecolor=0x80000008;
   p_height=6000;
   p_width=6000;
   p_x=16140;
   p_y=5085;
}
_form xretrace_form {
   p_backcolor=0x80000005;
   p_border_style=BDS_DIALOG_BOX;
   p_caption="Retrace Control Panel";
   p_forecolor=0x80000008;
   p_height=5295;
   p_width=9645;
   p_x=10905;
   p_y=1890;
   p_eventtab=xretrace_form;
   _frame ctlframe1 {
      p_backcolor=0x80000005;
      p_caption='';
      p_forecolor=0x80000008;
      p_height=3840;
      p_tab_index=2;
      p_visible=false;
      p_width=4125;
      p_x=240;
      p_y=180;
      _check_box show_retrace_modified_line_markers_checkbox {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_caption="  show retrace modified line markers";
         p_forecolor=0x80000008;
         p_height=300;
         p_style=PSCH_AUTO2STATE;
         p_tab_index=1;
         p_tab_stop=true;
         p_value=0;
         p_width=2940;
         p_x=255;
         p_y=240;
      }
      _check_box show_retrace_cursor_line_markers_checkbox {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_caption="  show retrace cursor line markers";
         p_forecolor=0x80000008;
         p_height=300;
         p_style=PSCH_AUTO2STATE;
         p_tab_index=2;
         p_tab_stop=true;
         p_value=0;
         p_width=2940;
         p_x=255;
         p_y=1120;
      }
      _check_box show_demodified_line_markers_checkbox {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_caption="  show de-modified line markers";
         p_forecolor=0x80000008;
         p_height=300;
         p_style=PSCH_AUTO2STATE;
         p_tab_index=4;
         p_tab_stop=true;
         p_value=0;
         p_width=2700;
         p_x=255;
         p_y=2000;
      }
      _check_box show_most_recent_modified_line_markers_checkbox {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_caption="  show retrace most recent modified line markers";
         p_forecolor=0x80000008;
         p_height=240;
         p_style=PSCH_AUTO2STATE;
         p_tab_index=5;
         p_tab_stop=true;
         p_value=0;
         p_width=3765;
         p_x=255;
         p_y=680;
      }
      _check_box track_demodified_lines_with_line_markers_checkbox {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_caption="  track de-modified lines with line markers";
         p_forecolor=0x80000008;
         p_height=300;
         p_style=PSCH_AUTO2STATE;
         p_tab_index=6;
         p_tab_stop=true;
         p_value=0;
         p_width=3420;
         p_x=255;
         p_y=1560;
      }
      _check_box track_demodified_lines_with_lineflags_checkbox {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_caption="  track de-modified lines with lineflags";
         p_forecolor=0x80000008;
         p_height=300;
         p_style=PSCH_AUTO2STATE;
         p_tab_index=7;
         p_tab_stop=true;
         p_value=0;
         p_width=3120;
         p_x=255;
         p_y=2440;
      }
      _check_box retrace_delayed_start_checkbox {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_caption="  retrace delayed start";
         p_forecolor=0x80000008;
         p_height=300;
         p_style=PSCH_AUTO2STATE;
         p_tab_index=8;
         p_tab_stop=true;
         p_value=0;
         p_width=2220;
         p_x=255;
         p_y=2880;
      }
      _check_box track_modified_lines_checkbox {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_caption="  track modified lines";
         p_forecolor=0x80000008;
         p_height=240;
         p_style=PSCH_AUTO2STATE;
         p_tab_index=9;
         p_tab_stop=true;
         p_value=0;
         p_width=1830;
         p_x=255;
         p_y=3315;
      }
   }
   _sstab ctlsstab1 {
      p_FirstActiveTab=0;
      p_backcolor=0x80000005;
      p_DropDownList=false;
      p_forecolor=0x000000FF;
      p_height=315;
      p_NofTabs=2;
      p_Orientation=SSTAB_OBOTTOM;
      p_PictureOnly=false;
      p_tab_index=4;
      p_tab_stop=true;
      p_width=1395;
      p_x=600;
      p_y=7140;
      p_eventtab2=_ul2_sstabb;
      _sstab_container  {
         p_ActiveCaption="Select";
         p_ActiveEnabled=true;
         p_ActiveOrder=0;
         p_ActiveColor=0x00800080;
         p_ActiveToolTip='';
      }
      _sstab_container  {
         p_ActiveCaption="Value";
         p_ActiveEnabled=true;
         p_ActiveOrder=1;
         p_ActiveColor=0x00800080;
         p_ActiveToolTip='';
      }
   }
   _command_button ok_button {
      p_auto_size=false;
      p_cancel=false;
      p_caption="Close";
      p_default=false;
      p_height=405;
      p_tab_index=5;
      p_tab_stop=true;
      p_width=810;
      p_x=240;
      p_y=4440;
   }
   _frame ctlframe2 {
      p_backcolor=0x80000005;
      p_caption='';
      p_forecolor=0x80000008;
      p_height=3840;
      p_tab_index=6;
      p_width=4740;
      p_x=4620;
      p_y=180;
      _text_box retrace_cursor_max_history_length_textbox {
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_border_style=BDS_FIXED_SINGLE;
         p_completion=NONE_ARG;
         p_forecolor=0x80000008;
         p_height=255;
         p_tab_index=1;
         p_tab_stop=true;
         p_text="50";
         p_width=570;
         p_x=240;
         p_y=270;
         p_eventtab2=_ul2_textbox;
      }
      _label ctllabel1 {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_border_style=BDS_NONE;
         p_caption="retrace cursor max history length";
         p_forecolor=0x80000008;
         p_height=300;
         p_tab_index=2;
         p_width=2460;
         p_word_wrap=false;
         p_x=945;
         p_y=285;
      }
      _text_box retrace_modified_lines_max_history_length_textbox {
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_border_style=BDS_FIXED_SINGLE;
         p_completion=NONE_ARG;
         p_forecolor=0x80000008;
         p_height=255;
         p_tab_index=3;
         p_tab_stop=true;
         p_text="20";
         p_width=600;
         p_x=240;
         p_y=705;
         p_eventtab2=_ul2_textbox;
      }
      _text_box retrace_timer_interrupt_sampling_interval_textbox {
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_border_style=BDS_FIXED_SINGLE;
         p_completion=NONE_ARG;
         p_forecolor=0x80000008;
         p_height=255;
         p_tab_index=4;
         p_tab_stop=true;
         p_text="250";
         p_width=600;
         p_x=240;
         p_y=1140;
         p_eventtab2=_ul2_textbox;
      }
      _text_box retrace_cursor_line_distance_recording_granularity_textbox {
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_border_style=BDS_FIXED_SINGLE;
         p_completion=NONE_ARG;
         p_forecolor=0x80000008;
         p_height=255;
         p_tab_index=5;
         p_tab_stop=true;
         p_text="16";
         p_width=600;
         p_x=240;
         p_y=1575;
         p_eventtab2=_ul2_textbox;
      }
      _text_box retrace_cursor_line_distance_viewing_granularity_textbox {
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_border_style=BDS_FIXED_SINGLE;
         p_completion=NONE_ARG;
         p_forecolor=0x80000008;
         p_height=255;
         p_tab_index=6;
         p_tab_stop=true;
         p_text="16";
         p_width=600;
         p_x=240;
         p_y=2010;
         p_eventtab2=_ul2_textbox;
      }
      _text_box retrace_cursor_min_region_pause_time_textbox {
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_border_style=BDS_FIXED_SINGLE;
         p_completion=NONE_ARG;
         p_forecolor=0x80000008;
         p_height=255;
         p_tab_index=7;
         p_tab_stop=true;
         p_text="16";
         p_width=600;
         p_x=240;
         p_y=2445;
         p_eventtab2=_ul2_textbox;
      }
      _text_box retrace_cursor_min_line_pause_time_textbox {
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_border_style=BDS_FIXED_SINGLE;
         p_completion=NONE_ARG;
         p_forecolor=0x80000008;
         p_height=255;
         p_tab_index=8;
         p_tab_stop=true;
         p_text='4';
         p_width=600;
         p_x=240;
         p_y=2880;
         p_eventtab2=_ul2_textbox;
      }
      _label ctllabel2 {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_border_style=BDS_NONE;
         p_caption="retrace modified lines max history length";
         p_forecolor=0x80000008;
         p_height=240;
         p_tab_index=9;
         p_width=2970;
         p_word_wrap=false;
         p_x=945;
         p_y=720;
      }
      _label ctllabel3 {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_border_style=BDS_NONE;
         p_caption="retrace timer sampling interval";
         p_forecolor=0x80000008;
         p_height=300;
         p_tab_index=10;
         p_width=2970;
         p_word_wrap=false;
         p_x=960;
         p_y=1140;
      }
      _label ctllabel4 {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_border_style=BDS_NONE;
         p_caption="retrace cursor line distance recording granularity";
         p_forecolor=0x80000008;
         p_height=240;
         p_tab_index=11;
         p_width=3540;
         p_word_wrap=false;
         p_x=975;
         p_y=1575;
      }
      _label ctllabel5 {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_border_style=BDS_NONE;
         p_caption="retrace cursor line distance viewing granularity";
         p_forecolor=0x80000008;
         p_height=240;
         p_tab_index=12;
         p_width=3465;
         p_word_wrap=false;
         p_x=975;
         p_y=2010;
      }
      _label ctllabel6 {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_border_style=BDS_NONE;
         p_caption="retrace cursor min region pause time intervals";
         p_forecolor=0x80000008;
         p_height=300;
         p_tab_index=13;
         p_width=3360;
         p_word_wrap=false;
         p_x=975;
         p_y=2460;
      }
      _label ctllabel7 {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x80000005;
         p_border_style=BDS_NONE;
         p_caption="retrace cursor min line pause time";
         p_forecolor=0x80000008;
         p_height=300;
         p_tab_index=14;
         p_width=2490;
         p_word_wrap=false;
         p_x=975;
         p_y=2895;
      }
   }
   _command_button disable_button {
      p_auto_size=false;
      p_cancel=false;
      p_caption="Disable xretrace";
      p_default=false;
      p_height=420;
      p_tab_index=7;
      p_tab_stop=true;
      p_width=1350;
      p_x=4125;
      p_y=4455;
   }
   _command_button dump_cursor_retrace_button {
      p_auto_size=false;
      p_cancel=false;
      p_caption="Dump cursor retrace";
      p_default=false;
      p_height=420;
      p_tab_index=8;
      p_tab_stop=true;
      p_width=1635;
      p_x=5715;
      p_y=4455;
   }
   _command_button dump_mod_lines_button {
      p_auto_size=false;
      p_cancel=false;
      p_caption="Dump mod lines retrace";
      p_default=false;
      p_height=420;
      p_tab_index=9;
      p_tab_stop=true;
      p_width=1830;
      p_x=7560;
      p_y=4455;
   }
   _command_button help_button {
      p_auto_size=false;
      p_cancel=false;
      p_caption="Help";
      p_default=false;
      p_height=405;
      p_tab_index=10;
      p_tab_stop=true;
      p_width=735;
      p_x=1380;
      p_y=4440;
   }
}
_form GFilemanBorderForm {
   p_backcolor=0x00000000;
   p_border_style=BDS_NONE;
   p_caption="GFilemanBorderForm";
   p_forecolor=0x80000008;
   p_height=5520;
   p_width=5910;
   p_x=7215;
   p_y=2520;
}
_form GFilemanSetupForm {
   p_backcolor=0x80000005;
   p_border_style=BDS_DIALOG_BOX;
   p_caption="GFileman Options";
   p_forecolor=0x80000008;
   p_height=6870;
   p_width=6975;
   p_x=8955;
   p_y=2160;
   p_eventtab=GFilemanSetupForm;
   _command_button ok_button {
      p_auto_size=false;
      p_cancel=false;
      p_caption="OK";
      p_default=false;
      p_font_name="MS Sans Serif";
      p_height=330;
      p_tab_index=1;
      p_tab_stop=true;
      p_width=930;
      p_x=60;
      p_y=6270;
   }
   _command_button cancel_button {
      p_auto_size=false;
      p_cancel=false;
      p_caption="Cancel";
      p_default=false;
      p_font_name="MS Sans Serif";
      p_height=315;
      p_tab_index=2;
      p_tab_stop=true;
      p_width=825;
      p_x=4920;
      p_y=6270;
   }
   _command_button help_button {
      p_auto_size=false;
      p_cancel=false;
      p_caption="Help";
      p_default=false;
      p_font_name="MS Sans Serif";
      p_height=315;
      p_tab_index=3;
      p_tab_stop=true;
      p_width=825;
      p_x=2880;
      p_y=6270;
   }
   _sstab ctlsstab1 {
      p_FirstActiveTab=0;
      p_backcolor=0x80000005;
      p_DropDownList=false;
      p_font_name="MS Sans Serif";
      p_forecolor=0x80000008;
      p_height=4920;
      p_NofTabs=2;
      p_Orientation=SSTAB_OTOP;
      p_PictureOnly=false;
      p_tab_index=4;
      p_tab_stop=true;
      p_width=6990;
      p_x=0;
      p_y=780;
      p_eventtab2=_ul2_sstabb;
      _sstab_container  {
         p_ActiveCaption="General";
         p_ActiveEnabled=true;
         p_ActiveOrder=0;
         p_ActiveColor=0x80000008;
         p_ActiveToolTip='';
         _frame font_frame {
            p_backcolor=0x80000005;
            p_caption="File list";
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=1080;
            p_tab_index=1;
            p_width=2940;
            p_x=240;
            p_y=240;
            _text_box fileview_font_editbox {
               p_auto_size=true;
               p_backcolor=0x80000005;
               p_border_style=BDS_FIXED_SINGLE;
               p_completion=NONE_ARG;
               p_font_name="MS Sans Serif";
               p_forecolor=0x80000008;
               p_height=255;
               p_tab_index=1;
               p_tab_stop=true;
               p_width=2205;
               p_x=600;
               p_y=255;
               p_eventtab2=_ul2_textbox;
            }
            _text_box fileview_fontsize_editbox {
               p_auto_size=true;
               p_backcolor=0x80000005;
               p_border_style=BDS_FIXED_SINGLE;
               p_completion=NONE_ARG;
               p_font_name="MS Sans Serif";
               p_forecolor=0x80000008;
               p_height=255;
               p_tab_index=2;
               p_tab_stop=true;
               p_width=630;
               p_x=945;
               p_y=660;
               p_eventtab2=_ul2_textbox;
            }
            _label ctllabel3 {
               p_alignment=AL_LEFT;
               p_auto_size=false;
               p_backcolor=0x80000005;
               p_border_style=BDS_NONE;
               p_caption="Font :";
               p_font_name="MS Sans Serif";
               p_forecolor=0x80000008;
               p_height=240;
               p_tab_index=3;
               p_width=450;
               p_word_wrap=false;
               p_x=135;
               p_y=285;
            }
            _label ctllabel4 {
               p_alignment=AL_LEFT;
               p_auto_size=false;
               p_backcolor=0x80000005;
               p_border_style=BDS_NONE;
               p_caption="Font size :";
               p_font_name="MS Sans Serif";
               p_forecolor=0x80000008;
               p_height=240;
               p_tab_index=4;
               p_width=765;
               p_word_wrap=false;
               p_x=135;
               p_y=675;
            }
            _command_button Fileview_font_change_button {
               p_auto_size=false;
               p_cancel=false;
               p_caption="Change";
               p_default=false;
               p_font_name="MS Sans Serif";
               p_height=285;
               p_tab_index=5;
               p_tab_stop=true;
               p_width=765;
               p_x=2055;
               p_y=645;
            }
         }
         _frame ctlframe1 {
            p_backcolor=0x80000005;
            p_caption="Active file edit box";
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=1080;
            p_tab_index=5;
            p_width=2940;
            p_x=240;
            p_y=1530;
            _text_box active_file_font_name_editbox {
               p_auto_size=true;
               p_backcolor=0x80000005;
               p_border_style=BDS_FIXED_SINGLE;
               p_completion=NONE_ARG;
               p_font_name="MS Sans Serif";
               p_forecolor=0x80000008;
               p_height=255;
               p_tab_index=1;
               p_tab_stop=true;
               p_width=2205;
               p_x=600;
               p_y=255;
               p_eventtab2=_ul2_textbox;
            }
            _text_box active_file_font_size_editbox {
               p_auto_size=true;
               p_backcolor=0x80000005;
               p_border_style=BDS_FIXED_SINGLE;
               p_completion=NONE_ARG;
               p_font_name="MS Sans Serif";
               p_forecolor=0x80000008;
               p_height=255;
               p_tab_index=2;
               p_tab_stop=true;
               p_width=720;
               p_x=600;
               p_y=675;
               p_eventtab2=_ul2_textbox;
            }
            _label ctllabel14 {
               p_alignment=AL_LEFT;
               p_auto_size=false;
               p_backcolor=0x80000005;
               p_border_style=BDS_NONE;
               p_caption="Font :";
               p_font_name="MS Sans Serif";
               p_forecolor=0x80000008;
               p_height=240;
               p_tab_index=3;
               p_width=450;
               p_word_wrap=false;
               p_x=135;
               p_y=285;
            }
            _label ctllabel15 {
               p_alignment=AL_LEFT;
               p_auto_size=false;
               p_backcolor=0x80000005;
               p_border_style=BDS_NONE;
               p_caption="Size :";
               p_font_name="MS Sans Serif";
               p_forecolor=0x80000008;
               p_height=240;
               p_tab_index=4;
               p_width=420;
               p_word_wrap=false;
               p_x=135;
               p_y=675;
            }
            _command_button active_file_editbox_font_change_button {
               p_auto_size=false;
               p_cancel=false;
               p_caption="Change";
               p_default=false;
               p_font_name="MS Sans Serif";
               p_height=285;
               p_tab_index=5;
               p_tab_stop=true;
               p_width=765;
               p_x=2055;
               p_y=675;
            }
         }
         _combo_box ctlcombo_filename_display_order {
            p_auto_size=true;
            p_backcolor=0x80000005;
            p_case_sensitive=false;
            p_completion=NONE_ARG;
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=285;
            p_style=PSCBO_EDIT;
            p_tab_index=6;
            p_tab_stop=true;
            p_width=2775;
            p_x=240;
            p_y=3630;
            p_eventtab2=_ul2_combobx;
         }
         _label ctllabel17 {
            p_alignment=AL_LEFT;
            p_auto_size=false;
            p_backcolor=0x80000005;
            p_border_style=BDS_NONE;
            p_caption="Filename display order";
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=240;
            p_tab_index=7;
            p_width=1590;
            p_word_wrap=false;
            p_x=255;
            p_y=3375;
         }
         _check_box ctlcheck_show_shortcuts_in_col1 {
            p_alignment=AL_LEFT;
            p_auto_size=false;
            p_backcolor=0x80000005;
            p_caption="Show shortcut keys";
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=240;
            p_style=PSCH_AUTO2STATE;
            p_tab_index=8;
            p_tab_stop=true;
            p_value=0;
            p_width=2310;
            p_x=4095;
            p_y=315;
         }
         _text_box shortcut_key_col1_width_editbox {
            p_auto_size=true;
            p_backcolor=0x80000005;
            p_border_style=BDS_FIXED_SINGLE;
            p_completion=NONE_ARG;
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=255;
            p_tab_index=16;
            p_tab_stop=true;
            p_width=480;
            p_x=4095;
            p_y=1020;
            p_eventtab2=_ul2_textbox;
         }
         _label ctllabel18 {
            p_alignment=AL_LEFT;
            p_auto_size=false;
            p_backcolor=0x80000005;
            p_border_style=BDS_NONE;
            p_caption="Shortcut key column width";
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=255;
            p_tab_index=17;
            p_width=2025;
            p_word_wrap=false;
            p_x=4695;
            p_y=1050;
         }
         _check_box selection_indicator_checkbox {
            p_alignment=AL_LEFT;
            p_auto_size=false;
            p_backcolor=0x80000005;
            p_caption="Highlight with block";
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=300;
            p_style=PSCH_AUTO2STATE;
            p_tab_index=18;
            p_tab_stop=true;
            p_value=0;
            p_width=1710;
            p_x=240;
            p_y=2880;
         }
         _check_box ctlcheck_show_shortcuts_on_demand {
            p_alignment=AL_LEFT;
            p_auto_size=false;
            p_backcolor=0x80000005;
            p_caption="Show shortcuts on demand";
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=240;
            p_style=PSCH_AUTO2STATE;
            p_tab_index=19;
            p_tab_stop=true;
            p_value=0;
            p_width=2220;
            p_x=4095;
            p_y=660;
         }
      }
      _sstab_container  {
         p_ActiveCaption="Layout";
         p_ActiveEnabled=true;
         p_ActiveOrder=1;
         p_ActiveColor=0x80000008;
         p_ActiveToolTip='';
         _text_box TooltipPercentEditbox {
            p_auto_size=true;
            p_backcolor=0x80000005;
            p_border_style=BDS_FIXED_SINGLE;
            p_completion=NONE_ARG;
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=255;
            p_tab_index=1;
            p_tab_stop=true;
            p_text="50";
            p_width=495;
            p_x=225;
            p_y=585;
            p_eventtab2=_ul2_textbox;
         }
         _label ctllabel5 {
            p_alignment=AL_LEFT;
            p_auto_size=false;
            p_backcolor=0x80000005;
            p_border_style=BDS_NONE;
            p_caption="Info Tooltip Activation Point";
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=300;
            p_tab_index=2;
            p_width=2040;
            p_word_wrap=false;
            p_x=225;
            p_y=315;
         }
         _label ctllabel6 {
            p_alignment=AL_LEFT;
            p_auto_size=false;
            p_backcolor=0x80000005;
            p_border_style=BDS_NONE;
            p_caption="Percent";
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=240;
            p_tab_index=3;
            p_width=780;
            p_word_wrap=false;
            p_x=795;
            p_y=615;
         }
         _text_box left_col_width_ctltext {
            p_auto_size=true;
            p_backcolor=0x80000005;
            p_border_style=BDS_FIXED_SINGLE;
            p_completion=NONE_ARG;
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=255;
            p_tab_index=4;
            p_tab_stop=true;
            p_width=480;
            p_x=225;
            p_y=1110;
            p_eventtab2=_ul2_textbox;
         }
         _label ctllabel10 {
            p_alignment=AL_LEFT;
            p_auto_size=false;
            p_backcolor=0x80000005;
            p_border_style=BDS_NONE;
            p_caption="Goback line# col width : ";
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=300;
            p_tab_index=5;
            p_width=1740;
            p_word_wrap=false;
            p_x=825;
            p_y=1110;
         }
         _text_box min_col_width_ctltext {
            p_auto_size=true;
            p_backcolor=0x80000005;
            p_border_style=BDS_FIXED_SINGLE;
            p_completion=NONE_ARG;
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=255;
            p_tab_index=6;
            p_tab_stop=true;
            p_width=480;
            p_x=225;
            p_y=1470;
            p_eventtab2=_ul2_textbox;
         }
         _label ctllabel11 {
            p_alignment=AL_LEFT;
            p_auto_size=false;
            p_backcolor=0x80000005;
            p_border_style=BDS_NONE;
            p_caption="Filename col min width : ";
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=315;
            p_tab_index=7;
            p_width=1740;
            p_word_wrap=false;
            p_x=825;
            p_y=1470;
         }
         _text_box button_row1_y_offset_ctltext {
            p_auto_size=true;
            p_backcolor=0x80000005;
            p_border_style=BDS_FIXED_SINGLE;
            p_completion=NONE_ARG;
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=255;
            p_tab_index=8;
            p_tab_stop=true;
            p_width=480;
            p_x=225;
            p_y=2445;
            p_eventtab2=_ul2_textbox;
         }
         _label ctllabel12 {
            p_alignment=AL_LEFT;
            p_auto_size=false;
            p_backcolor=0x80000005;
            p_border_style=BDS_NONE;
            p_caption="Button row1 y offset :";
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=300;
            p_tab_index=9;
            p_width=1740;
            p_word_wrap=false;
            p_x=825;
            p_y=2445;
         }
         _text_box filename_editbox_y_offset_ctltext {
            p_auto_size=true;
            p_backcolor=0x80000005;
            p_border_style=BDS_FIXED_SINGLE;
            p_completion=NONE_ARG;
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=255;
            p_tab_index=10;
            p_tab_stop=true;
            p_width=480;
            p_x=225;
            p_y=3615;
            p_eventtab2=_ul2_textbox;
         }
         _label ctllabel13 {
            p_alignment=AL_LEFT;
            p_auto_size=false;
            p_backcolor=0x80000005;
            p_border_style=BDS_NONE;
            p_caption="Filename edit box y offset :";
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=300;
            p_tab_index=11;
            p_width=1980;
            p_word_wrap=false;
            p_x=825;
            p_y=3630;
         }
         _check_box button_row1_visible_ctlcheck {
            p_alignment=AL_LEFT;
            p_auto_size=false;
            p_backcolor=0x80000005;
            p_caption="Button row1 visible";
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=240;
            p_style=PSCH_AUTO2STATE;
            p_tab_index=12;
            p_tab_stop=true;
            p_value=0;
            p_width=1800;
            p_x=225;
            p_y=2145;
         }
         _check_box filename_editbox_visible_ctlcheck {
            p_alignment=AL_LEFT;
            p_auto_size=false;
            p_backcolor=0x80000005;
            p_caption="Filename editbox visible";
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=225;
            p_style=PSCH_AUTO2STATE;
            p_tab_index=13;
            p_tab_stop=true;
            p_value=0;
            p_width=2160;
            p_x=225;
            p_y=3270;
         }
         _check_box ctlcheck_filename_editbox_is_target {
            p_alignment=AL_LEFT;
            p_auto_size=false;
            p_backcolor=0x80000005;
            p_caption="Filename editbox is target";
            p_font_name="MS Sans Serif";
            p_forecolor=0x80000008;
            p_height=360;
            p_style=PSCH_AUTO2STATE;
            p_tab_index=14;
            p_tab_stop=true;
            p_value=0;
            p_width=2220;
            p_x=225;
            p_y=2880;
         }
      }
   }
   _combo_box ctlcombo_select_dialog {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_case_sensitive=false;
      p_completion=NONE_ARG;
      p_font_name="MS Sans Serif";
      p_forecolor=0x80000008;
      p_height=285;
      p_style=PSCBO_NOEDIT;
      p_tab_index=5;
      p_tab_stop=true;
      p_width=2100;
      p_x=1260;
      p_y=180;
      p_eventtab2=_ul2_combobx;
   }
   _label DialogSelectorLabel {
      p_alignment=AL_RIGHT;
      p_auto_size=false;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_caption="Form name :";
      p_font_name="MS Sans Serif";
      p_forecolor=0x80000008;
      p_height=240;
      p_tab_index=6;
      p_width=1140;
      p_word_wrap=false;
      p_x=60;
      p_y=240;
   }
   _command_button ShowFormButton {
      p_auto_size=false;
      p_cancel=false;
      p_caption="Show form";
      p_default=false;
      p_font_name="MS Sans Serif";
      p_height=360;
      p_tab_index=7;
      p_tab_stop=true;
      p_width=915;
      p_x=3720;
      p_y=180;
   }
   _image top_separator_image {
      p_auto_size=false;
      p_backcolor=0x000000FF;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=120;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=8;
      p_tab_stop=false;
      p_value=0;
      p_width=495;
      p_x=180;
      p_y=5970;
      p_eventtab2=_ul2_imageb;
   }
   _command_button save_button {
      p_auto_size=false;
      p_cancel=false;
      p_caption="Save";
      p_default=false;
      p_font_name="MS Sans Serif";
      p_height=330;
      p_tab_index=9;
      p_tab_stop=true;
      p_width=885;
      p_x=1200;
      p_y=6270;
   }
   _command_button exit_button {
      p_auto_size=false;
      p_cancel=false;
      p_caption="Close";
      p_default=false;
      p_font_name="MS Sans Serif";
      p_height=315;
      p_tab_index=10;
      p_tab_stop=true;
      p_width=825;
      p_x=3930;
      p_y=6270;
   }
   _command_button UpdateFormsButton {
      p_auto_size=false;
      p_cancel=false;
      p_caption="Update all forms";
      p_default=false;
      p_font_name="MS Sans Serif";
      p_height=360;
      p_tab_index=11;
      p_tab_stop=true;
      p_width=1305;
      p_x=4830;
      p_y=180;
   }
}
_form form2 {
   p_backcolor=0x80000005;
   p_border_style=BDS_DIALOG_BOX;
   p_caption="form2";
   p_forecolor=0x80000008;
   p_height=6000;
   p_width=6000;
   p_x=16050;
   p_y=5040;
   _text_box ctltext1 {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_FIXED_SINGLE;
      p_completion=NONE_ARG;
      p_forecolor=0x80000008;
      p_height=300;
      p_tab_index=1;
      p_tab_stop=true;
      p_text="ctltext1";
      p_width=2460;
      p_x=660;
      p_y=720;
      p_eventtab2=_ul2_textbox;
   }
}
_menu fave_cmds2 {
   " &open","activate_open","","","";
   " doc-buffers","document_tab_list_buffers","","","";
   " &h deltasave","activate_deltasave","","","";
   " &bookmarks activate","activate_bookmarks","","","";
   " &find_symbol","activate_find_symbol","","","";
   " &context","activate_context","","","";
   " &defs","activate_defs","","","";
   " &projects","activate_projects","","","";
   " &references","activate_references","","","";
   " &search","activate_search","","","";
   " &v preview","activate_preview","","","";
   " &y symbol","activate_symbol","","","";
   " files","activate_files","","","";
   " todo","activate_todo","","","";
   " build","activate_build","","","";
}
_menu fave_cmds1 {
   submenu "More","","","" {
      "F9 complete-prev-no-dup","complete_prev_no_dup","","","";
      "S-F9  complete-next-no-dup","complete_next_no_dup","","","";
      "C-F9  complete-prev","complete_prev","","","";
      "C-S-F9  complete-next","complete_next","","","";
      "A-F9  complete-list","complete_list","","","";
      "A-S-F9  complete-more","complete_more","","","";
      "--","","","","";
      "F8  select-code-block","select_code_block","","","";
      "S-F8  hide-code-block","hide_code_block","","","";
      "C-F8  hide-selection","hide_selection","","","";
      "S-A-F8  hide-comments","hide_all_comments","","","";
      "C-S-F8  select-paren","select_paren_block","","","";
      "show-all","show-all","","","";
   }
   submenu "Open / Explore / Copy / Diff","","open-file or explore folder","" {
      "Open from here (op)","open-from","","","open from current buffer path";
      "Open from config (opc)","opc","","","open file from configuration folder";
      "Open from project root (opp)","opp","","","";
      "Open vsstack error file (opvss)","opvss","","","Open Slick C error file";
      "-","","","","";
      "Explore current buffer (xp)","xp","","","explore from folder of current buffer";
      "Explore config folder (xpc)","xpc","","","";
      "Explore installation folder (xps)","xps","","","";
      "Explore docs (xpdocs)","xpdocs","","","";
      "Explore project root (xpp)","xpp","","","";
      "-","","","","";
      "Copy cur buffer name to clipboard","curbuf-name-to-clip","","","";
      "Copy cur buffer path to clipboard","curbuf-path-to-clip","","","";
      "-","","","","";
      "Diff last two buffers (diff2)","diff2","","","";
   }
   submenu "&Case conversion","","","" {
      "lowcase selection","lowcase-selection","","","";
      "upcase selection","upcase-selection","","","";
      "&Lowcase word","lowcase-word","","","";
      "&Upcase word","upcase-word","","","";
      "Upcase &char","upcase-char","","","";
      "Cap &selection","cap-selection","","","";
   }
   "&Goback","GFH-step-thru-goback-history","","","";
   "&Kill my timer","kill-gfileman-timer","","","";
   "&Transpose chars (ctrl T)","transpose-chars","","","";
   "transpose words (C S T)","transpose-words","","","";
   "transpose lines  (alt T)","transpose-lines","","","";
   "-","","","","";
   "&Decrease font size C-S-F7","decrease-font-size","","","";
   "&Increase font size S-F7","increase-font-size","","","";
   "toggle font","toggle-font C-F7","","","";
   "&Highlight word","hlWord","","","";
   "&save all","save-all-inhibit-buf-history","","","";
   "-","","","","";
   "&1 Function comment","func-comment","","","";
   "&2 Save bookmarks","xsave_bookmarks","","","";
   "&3 Restore bookmarks","xrestore_bookmarks","","","";
}
_menu GFilemanViewXMid1RightClickMenu {
}
_menu GFilemanButtonMenu {
}
_menu xmenu2 {
   "Set diff region","xset_diff_region","","","";
   "Compare diff region","xcompare_diff_region","","","";
   "Beautify project","xbeautify_project","","","";
   "--","","","","";
   "&New temporary file","xtemp_new_temporary_file","","","";
   "New temporary file no keep","xtemp_new_temporary_file_no_keep","","","";
   "--","","","","";
   "Transpose chars (ctrl T)","transpose-chars","","","";
   "Transpose words (C S T)","transpose-words","","","";
   "Transpose lines  (alt T)","transpose-lines","","","";
   "--","","","","";
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
   submenu "Complete","","","" {
      "complete-prev-no-dup","complete_prev_no_dup","","","";
      "complete-next-no-dup","complete_next_no_dup","","","";
      "complete-prev","complete_prev","","","";
      "complete-next","complete_next","","","";
      "complete-list","complete_list","","","";
      "complete-more","complete_more","","","";
   }
   submenu "Select / Hide","","","" {
      "select code block","select_code_block","","","";
      "select paren","select_paren_block","","","";
      "select procedure","select_proc","","","";
      "hide code block","hide_code_block","","","";
      "hide selection","hide_selection","","","";
      "hide comments","hide_all_comments","","","";
      "show all","show-all","","","";
   }
   submenu "Open / E&xplore","","open-file or explore folder","" {
      "Open from here","xopen_from_here","","","open from current buffer path";
      "Open from config","xopen_from_config","","","open file from configuration folder";
      "Open vsstack error file","xopvss","","","Open Slick C error file";
      "-","","","","";
      "Explore current buffer","explore_cur_buffer","","","explore folder of current buffer";
      "Explore config folder","explore_config","","","";
      "Explore installation folder","explore_vslick","","","";
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
      "Cap &selection","cap-selection","","","";
   }
   submenu "Extra","","","" {
      "Float window","my_float_window","","","";
      "Decrease font size","decrease-font-size","","","";
      "Increase font size","increase-font-size","","","";
      "Toggle font","toggle-font","","","";
      "Save all","save-all-inhibit-buf-history","","","";
      "-","","","","";
      "&1 Function comment","func-comment","","","";
      "&2 Save bookmarks","xsave_bookmarks","","","";
      "&3 Restore bookmarks","xrestore_bookmarks","","","";
   }
}
_menu key_binding_trainer_menu {
}
_menu xmenu1 {
   "Set diff region","xset_diff_region","","","";
   "Compare diff region","xcompare_diff_region","","","";
   "Beautify project","xbeautify_project","","","";
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
      "select procedure","select_proc","","","";
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
      "Explore installation folder","explore_vslick","","","";
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
      "Cap &selection","cap-selection","","","";
   }
}
_form GFilemanInfoForm2 {
   p_backcolor=0x00FF00FF;
   p_border_style=BDS_NONE;
   p_caption="File Infomation";
   p_forecolor=0x80000008;
   p_height=5520;
   p_tool_window=true;
   p_width=5910;
   p_x=8220;
   p_y=2415;
   p_eventtab=GFilemanInfoForm2;
   _picture_box ctlpicture1 {
      p_auto_size=true;
      p_backcolor=0x000000FF;
      p_border_style=BDS_NONE;
      p_forecolor=0x000000FF;
      p_height=1620;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=5;
      p_tab_stop=false;
      p_value=0;
      p_width=3240;
      p_x=1020;
      p_y=2280;
      p_eventtab2=_ul2_picture;
      _label TitleLabel {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x0000FF00;
         p_border_style=BDS_NONE;
         p_caption="  File :";
         p_font_name="MS Sans Serif";
         p_forecolor=0x00800080;
         p_height=360;
         p_tab_index=1;
         p_width=555;
         p_word_wrap=false;
         p_x=180;
         p_y=720;
      }
      _label FilenameLabel {
         p_alignment=AL_LEFT;
         p_auto_size=false;
         p_backcolor=0x0000FFFF;
         p_border_style=BDS_NONE;
         p_caption="ctllabel1";
         p_font_name="MS Sans Serif";
         p_forecolor=0x00800080;
         p_height=420;
         p_tab_index=2;
         p_width=1740;
         p_word_wrap=false;
         p_x=1020;
         p_y=780;
      }
   }
}
_form GFilemanForm1 {
   p_backcolor=0x80000005;
   p_border_style=BDS_SIZABLE;
   p_caption="GFileman1";
   p_CaptionClick=true;
   p_forecolor=0x80000008;
   p_height=5460;
   p_tool_window=true;
   p_visible=false;
   p_width=5910;
   p_x=15390;
   p_y=4800;
   p_eventtab=GFilemanForm1;
   p_eventtab2=_toolwindow_etab2;
   _list_box ctllist_view1_col1 {
      p_border_style=BDS_NONE;
      p_font_name="Tahoma";
      p_font_size=10;
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_width=240;
      p_x=540;
      p_y=1335;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view1_col2 {
      p_border_style=BDS_NONE;
      p_font_name="Tahoma";
      p_font_size=10;
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_width=330;
      p_x=900;
      p_y=1335;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view1_col3 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_width=255;
      p_x=1335;
      p_y=1335;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view2_col1 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=240;
      p_x=540;
      p_y=1335;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view2_col2 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=330;
      p_x=900;
      p_y=1335;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view2_col3 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=255;
      p_x=1335;
      p_y=1335;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view3_col1 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=240;
      p_x=540;
      p_y=1335;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view3_col2 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=330;
      p_x=900;
      p_y=1335;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view3_col3 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=255;
      p_x=1335;
      p_y=1335;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view4_col1 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=240;
      p_x=540;
      p_y=1335;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view4_col2 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=330;
      p_x=900;
      p_y=1335;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view4_col3 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=255;
      p_x=1335;
      p_y=1335;
      p_eventtab2=_ul2_listbox;
   }
   _image ctlimage_listview_left_vert_bar1 {
      p_auto_size=false;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=300;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=2;
      p_tab_stop=false;
      p_value=0;
      p_width=120;
      p_x=585;
      p_y=2370;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_listview_right_vert_bar1 {
      p_auto_size=false;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=285;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=4;
      p_tab_stop=false;
      p_value=0;
      p_width=105;
      p_x=840;
      p_y=2385;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_listview_bottom_horiz_bar1 {
      p_auto_size=false;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=135;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=5;
      p_tab_stop=false;
      p_value=0;
      p_width=270;
      p_x=615;
      p_y=2685;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_listview_top_horiz_bar1 {
      p_auto_size=false;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=150;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=6;
      p_tab_stop=false;
      p_value=0;
      p_width=315;
      p_x=600;
      p_y=2220;
      p_eventtab2=_ul2_imageb;
   }
   _text_box ctltext1 {
      p_auto_size=false;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_completion=NONE_ARG;
      p_font_name="MS Sans Serif";
      p_forecolor=0x80000008;
      p_height=225;
      p_tab_index=8;
      p_tab_stop=false;
      p_text="ctltext1";
      p_width=2220;
      p_x=0;
      p_y=300;
      p_eventtab2=_ul2_textbox;
   }
   _image ctlimage_listview_vert_sep_bar1 {
      p_auto_size=true;
      p_backcolor=0x000000FF;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=540;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=14;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=120;
      p_x=1260;
      p_y=2250;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_listview_vert_sep_bar2 {
      p_auto_size=true;
      p_backcolor=0x000000FF;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=540;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=14;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=120;
      p_x=1260;
      p_y=2250;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_listview_vert_sep_bar3 {
      p_auto_size=true;
      p_backcolor=0x000000FF;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=540;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=14;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=120;
      p_x=1260;
      p_y=2250;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_editbox1_left_vert_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=300;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=15;
      p_tab_stop=false;
      p_value=0;
      p_width=120;
      p_x=645;
      p_y=3135;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_editbox1_right_vert_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=285;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=16;
      p_tab_stop=false;
      p_value=0;
      p_width=105;
      p_x=900;
      p_y=3180;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_editbox1_bottom_horiz_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=135;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=17;
      p_tab_stop=false;
      p_value=0;
      p_width=270;
      p_x=675;
      p_y=3450;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_editbox1_top_horiz_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=150;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=18;
      p_tab_stop=false;
      p_value=0;
      p_width=315;
      p_x=660;
      p_y=2985;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_blackbox1_left_vert_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=300;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=20;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=120;
      p_x=1200;
      p_y=3165;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_blackbox1_right_vert_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=285;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=21;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=105;
      p_x=1455;
      p_y=3210;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_blackbox1_bottom_horiz_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=135;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=22;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=270;
      p_x=1230;
      p_y=3480;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_blackbox1_top_horiz_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=150;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=23;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=315;
      p_x=1215;
      p_y=3015;
      p_eventtab2=_ul2_imageb;
   }
   _label blackbox1_title_label {
      p_alignment=AL_LEFT;
      p_auto_size=false;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_caption='';
      p_font_name="MS Sans Serif";
      p_forecolor=0x80000008;
      p_height=195;
      p_tab_index=24;
      p_visible=false;
      p_width=1455;
      p_word_wrap=false;
      p_x=540;
      p_y=0;
   }
   _image scrollbar_slider_image {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=300;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=27;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=180;
      p_x=2460;
      p_y=660;
      p_eventtab2=_ul2_imageb;
   }
   _image scrollbar_horizontal_indicator_image {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=60;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=27;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=500;
      p_x=2460;
      p_y=660;
      p_eventtab2=_ul2_imageb;
   }
   _image scrollbar_button {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=360;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=30;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=420;
      p_x=120;
      p_y=600;
      p_eventtab2=_ul2_imageb;
   }
   _image options1_button {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=31;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=900;
      p_y=600;
      p_eventtab2=_ul2_imageb;
   }
   _image goback_button {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=34;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=1620;
      p_y=660;
      p_eventtab2=_ul2_imageb;
   }
   _image view1_ctlimage1 {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=840;
      p_max_click=MC_DOUBLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=33;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=2700;
      p_y=1740;
      p_eventtab2=_ul2_imageb;
   }
   _image view2_ctlimage1 {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=840;
      p_max_click=MC_DOUBLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=33;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=2700;
      p_y=1740;
      p_eventtab=GFilemanForm1.view1_ctlimage1;
      p_eventtab2=_ul2_imageb;
   }
   _image view3_ctlimage1 {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=840;
      p_max_click=MC_DOUBLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=33;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=2700;
      p_y=1740;
      p_eventtab=GFilemanForm1.view1_ctlimage1;
      p_eventtab2=_ul2_imageb;
   }
   _image view4_ctlimage1 {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=840;
      p_max_click=MC_DOUBLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=33;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=2700;
      p_y=1740;
      p_eventtab=GFilemanForm1.view1_ctlimage1;
      p_eventtab2=_ul2_imageb;
   }
}
_form GFilemanForm2 {
   p_backcolor=0x80000005;
   p_border_style=BDS_SIZABLE;
   p_caption="GFileman2";
   p_CaptionClick=true;
   p_forecolor=0x80000008;
   p_height=5460;
   p_tool_window=true;
   p_visible=false;
   p_width=5910;
   p_x=15390;
   p_y=4800;
   p_eventtab=GFilemanForm1;
   p_eventtab2=_toolwindow_etab2;
   _list_box ctllist_view1_col1 {
      p_border_style=BDS_NONE;
      p_font_name="Tahoma";
      p_font_size=10;
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_width=240;
      p_x=540;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col1;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view1_col2 {
      p_border_style=BDS_NONE;
      p_font_name="Tahoma";
      p_font_size=10;
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_width=330;
      p_x=900;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col2;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view1_col3 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_width=255;
      p_x=1335;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col3;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view2_col1 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=240;
      p_x=540;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col1;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view2_col2 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=330;
      p_x=900;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col2;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view2_col3 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=255;
      p_x=1335;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col3;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view3_col1 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=240;
      p_x=540;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col1;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view3_col2 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=330;
      p_x=900;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col2;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view3_col3 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=255;
      p_x=1335;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col3;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view4_col1 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=240;
      p_x=540;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col1;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view4_col2 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=330;
      p_x=900;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col2;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view4_col3 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=255;
      p_x=1335;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col3;
      p_eventtab2=_ul2_listbox;
   }
   _image ctlimage_listview_left_vert_bar1 {
      p_auto_size=false;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=300;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=2;
      p_tab_stop=false;
      p_value=0;
      p_width=120;
      p_x=585;
      p_y=2370;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_listview_right_vert_bar1 {
      p_auto_size=false;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=285;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=4;
      p_tab_stop=false;
      p_value=0;
      p_width=105;
      p_x=840;
      p_y=2385;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_listview_bottom_horiz_bar1 {
      p_auto_size=false;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=135;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=5;
      p_tab_stop=false;
      p_value=0;
      p_width=270;
      p_x=615;
      p_y=2685;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_listview_top_horiz_bar1 {
      p_auto_size=false;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=150;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=6;
      p_tab_stop=false;
      p_value=0;
      p_width=315;
      p_x=600;
      p_y=2220;
      p_eventtab2=_ul2_imageb;
   }
   _text_box ctltext1 {
      p_auto_size=false;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_completion=NONE_ARG;
      p_font_name="MS Sans Serif";
      p_forecolor=0x80000008;
      p_height=225;
      p_tab_index=8;
      p_tab_stop=false;
      p_text="ctltext1";
      p_width=2220;
      p_x=0;
      p_y=300;
      p_eventtab=GFilemanForm1.ctltext1;
      p_eventtab2=_ul2_textbox;
   }
   _image ctlimage_listview_vert_sep_bar1 {
      p_auto_size=true;
      p_backcolor=0x000000FF;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=540;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=14;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=120;
      p_x=1260;
      p_y=2250;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_listview_vert_sep_bar2 {
      p_auto_size=true;
      p_backcolor=0x000000FF;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=540;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=14;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=120;
      p_x=1260;
      p_y=2250;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_listview_vert_sep_bar3 {
      p_auto_size=true;
      p_backcolor=0x000000FF;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=540;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=14;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=120;
      p_x=1260;
      p_y=2250;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_editbox1_left_vert_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=300;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=15;
      p_tab_stop=false;
      p_value=0;
      p_width=120;
      p_x=645;
      p_y=3135;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_editbox1_right_vert_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=285;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=16;
      p_tab_stop=false;
      p_value=0;
      p_width=105;
      p_x=900;
      p_y=3180;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_editbox1_bottom_horiz_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=135;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=17;
      p_tab_stop=false;
      p_value=0;
      p_width=270;
      p_x=675;
      p_y=3450;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_editbox1_top_horiz_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=150;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=18;
      p_tab_stop=false;
      p_value=0;
      p_width=315;
      p_x=660;
      p_y=2985;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_blackbox1_left_vert_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=300;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=20;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=120;
      p_x=1200;
      p_y=3165;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_blackbox1_right_vert_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=285;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=21;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=105;
      p_x=1455;
      p_y=3210;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_blackbox1_bottom_horiz_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=135;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=22;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=270;
      p_x=1230;
      p_y=3480;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_blackbox1_top_horiz_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=150;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=23;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=315;
      p_x=1215;
      p_y=3015;
      p_eventtab2=_ul2_imageb;
   }
   _label blackbox1_title_label {
      p_alignment=AL_LEFT;
      p_auto_size=false;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_caption='';
      p_font_name="MS Sans Serif";
      p_forecolor=0x80000008;
      p_height=195;
      p_tab_index=24;
      p_visible=false;
      p_width=1455;
      p_word_wrap=false;
      p_x=540;
      p_y=0;
   }
   _image scrollbar_slider_image {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=300;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=27;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=180;
      p_x=2460;
      p_y=660;
      p_eventtab2=_ul2_imageb;
   }
   _image scrollbar_horizontal_indicator_image {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=60;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=27;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=500;
      p_x=2460;
      p_y=660;
      p_eventtab2=_ul2_imageb;
   }
   _image scrollbar_button {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=360;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=30;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=420;
      p_x=120;
      p_y=600;
      p_eventtab=GFilemanForm1.scrollbar_button;
      p_eventtab2=_ul2_imageb;
   }
   _image options1_button {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=31;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=900;
      p_y=600;
      p_eventtab=GFilemanForm1.options1_button;
      p_eventtab2=_ul2_imageb;
   }
   _image goback_button {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=34;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=1620;
      p_y=660;
      p_eventtab=GFilemanForm1.goback_button;
      p_eventtab2=_ul2_imageb;
   }
   _image view1_ctlimage1 {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=840;
      p_max_click=MC_DOUBLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=33;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=2700;
      p_y=1740;
      p_eventtab=GFilemanForm1.view1_ctlimage1;
      p_eventtab2=_ul2_imageb;
   }
   _image view2_ctlimage1 {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=840;
      p_max_click=MC_DOUBLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=33;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=2700;
      p_y=1740;
      p_eventtab=GFilemanForm1.view1_ctlimage1;
      p_eventtab2=_ul2_imageb;
   }
   _image view3_ctlimage1 {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=840;
      p_max_click=MC_DOUBLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=33;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=2700;
      p_y=1740;
      p_eventtab=GFilemanForm1.view1_ctlimage1;
      p_eventtab2=_ul2_imageb;
   }
   _image view4_ctlimage1 {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=840;
      p_max_click=MC_DOUBLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=33;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=2700;
      p_y=1740;
      p_eventtab=GFilemanForm1.view1_ctlimage1;
      p_eventtab2=_ul2_imageb;
   }
}
_form GFilemanForm3 {
   p_backcolor=0x80000005;
   p_border_style=BDS_SIZABLE;
   p_caption="GFileman3";
   p_CaptionClick=true;
   p_forecolor=0x80000008;
   p_height=5460;
   p_tool_window=true;
   p_visible=false;
   p_width=5910;
   p_x=15390;
   p_y=4800;
   p_eventtab=GFilemanForm1;
   p_eventtab2=_toolwindow_etab2;
   _list_box ctllist_view1_col1 {
      p_border_style=BDS_NONE;
      p_font_name="Tahoma";
      p_font_size=10;
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_width=240;
      p_x=540;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col1;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view1_col2 {
      p_border_style=BDS_NONE;
      p_font_name="Tahoma";
      p_font_size=10;
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_width=330;
      p_x=900;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col2;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view1_col3 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_width=255;
      p_x=1335;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col3;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view2_col1 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=240;
      p_x=540;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col1;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view2_col2 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=330;
      p_x=900;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col2;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view2_col3 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=255;
      p_x=1335;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col3;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view3_col1 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=240;
      p_x=540;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col1;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view3_col2 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=330;
      p_x=900;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col2;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view3_col3 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=255;
      p_x=1335;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col3;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view4_col1 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=240;
      p_x=540;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col1;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view4_col2 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=330;
      p_x=900;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col2;
      p_eventtab2=_ul2_listbox;
   }
   _list_box ctllist_view4_col3 {
      p_border_style=BDS_NONE;
      p_font_name="MS Sans Serif";
      p_height=705;
      p_multi_select=MS_EXTENDED;
      p_scroll_bars=SB_NONE;
      p_tab_index=0;
      p_tab_stop=false;
      p_visible=false;
      p_width=255;
      p_x=1335;
      p_y=1335;
      p_eventtab=GFilemanForm1.ctllist_view1_col3;
      p_eventtab2=_ul2_listbox;
   }
   _image ctlimage_listview_left_vert_bar1 {
      p_auto_size=false;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=300;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=2;
      p_tab_stop=false;
      p_value=0;
      p_width=120;
      p_x=585;
      p_y=2370;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_listview_right_vert_bar1 {
      p_auto_size=false;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=285;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=4;
      p_tab_stop=false;
      p_value=0;
      p_width=105;
      p_x=840;
      p_y=2385;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_listview_bottom_horiz_bar1 {
      p_auto_size=false;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=135;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=5;
      p_tab_stop=false;
      p_value=0;
      p_width=270;
      p_x=615;
      p_y=2685;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_listview_top_horiz_bar1 {
      p_auto_size=false;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=150;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=6;
      p_tab_stop=false;
      p_value=0;
      p_width=315;
      p_x=600;
      p_y=2220;
      p_eventtab2=_ul2_imageb;
   }
   _text_box ctltext1 {
      p_auto_size=false;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_completion=NONE_ARG;
      p_font_name="MS Sans Serif";
      p_forecolor=0x80000008;
      p_height=225;
      p_tab_index=8;
      p_tab_stop=false;
      p_text="ctltext1";
      p_width=2220;
      p_x=0;
      p_y=300;
      p_eventtab=GFilemanForm1.ctltext1;
      p_eventtab2=_ul2_textbox;
   }
   _image ctlimage_listview_vert_sep_bar1 {
      p_auto_size=true;
      p_backcolor=0x000000FF;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=540;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=14;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=120;
      p_x=1260;
      p_y=2250;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_listview_vert_sep_bar2 {
      p_auto_size=true;
      p_backcolor=0x000000FF;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=540;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=14;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=120;
      p_x=1260;
      p_y=2250;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_listview_vert_sep_bar3 {
      p_auto_size=true;
      p_backcolor=0x000000FF;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=540;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=14;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=120;
      p_x=1260;
      p_y=2250;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_editbox1_left_vert_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=300;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=15;
      p_tab_stop=false;
      p_value=0;
      p_width=120;
      p_x=645;
      p_y=3135;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_editbox1_right_vert_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=285;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=16;
      p_tab_stop=false;
      p_value=0;
      p_width=105;
      p_x=900;
      p_y=3180;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_editbox1_bottom_horiz_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=135;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=17;
      p_tab_stop=false;
      p_value=0;
      p_width=270;
      p_x=675;
      p_y=3450;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_editbox1_top_horiz_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=150;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=18;
      p_tab_stop=false;
      p_value=0;
      p_width=315;
      p_x=660;
      p_y=2985;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_blackbox1_left_vert_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=300;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=20;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=120;
      p_x=1200;
      p_y=3165;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_blackbox1_right_vert_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=285;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=21;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=105;
      p_x=1455;
      p_y=3210;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_blackbox1_bottom_horiz_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=135;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=22;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=270;
      p_x=1230;
      p_y=3480;
      p_eventtab2=_ul2_imageb;
   }
   _image ctlimage_blackbox1_top_horiz_bar {
      p_auto_size=true;
      p_backcolor=0x00FF0000;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=150;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=23;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=315;
      p_x=1215;
      p_y=3015;
      p_eventtab2=_ul2_imageb;
   }
   _label blackbox1_title_label {
      p_alignment=AL_LEFT;
      p_auto_size=false;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_caption='';
      p_font_name="MS Sans Serif";
      p_forecolor=0x80000008;
      p_height=195;
      p_tab_index=24;
      p_visible=false;
      p_width=1455;
      p_word_wrap=false;
      p_x=540;
      p_y=0;
   }
   _image scrollbar_slider_image {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=300;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=27;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=180;
      p_x=2460;
      p_y=660;
      p_eventtab2=_ul2_imageb;
   }
   _image scrollbar_horizontal_indicator_image {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=60;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=27;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=500;
      p_x=2460;
      p_y=660;
      p_eventtab2=_ul2_imageb;
   }
   _image scrollbar_button {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=360;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=30;
      p_tab_stop=false;
      p_value=0;
      p_visible=false;
      p_width=420;
      p_x=120;
      p_y=600;
      p_eventtab=GFilemanForm1.scrollbar_button;
      p_eventtab2=_ul2_imageb;
   }
   _image options1_button {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=31;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=900;
      p_y=600;
      p_eventtab=GFilemanForm1.options1_button;
      p_eventtab2=_ul2_imageb;
   }
   _image goback_button {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=420;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_HIGHLIGHTED_BUTTON;
      p_tab_index=34;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=1620;
      p_y=660;
      p_eventtab=GFilemanForm1.goback_button;
      p_eventtab2=_ul2_imageb;
   }
   _image view1_ctlimage1 {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=840;
      p_max_click=MC_DOUBLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=33;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=2700;
      p_y=1740;
      p_eventtab=GFilemanForm1.view1_ctlimage1;
      p_eventtab2=_ul2_imageb;
   }
   _image view2_ctlimage1 {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=840;
      p_max_click=MC_DOUBLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=33;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=2700;
      p_y=1740;
      p_eventtab=GFilemanForm1.view1_ctlimage1;
      p_eventtab2=_ul2_imageb;
   }
   _image view3_ctlimage1 {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=840;
      p_max_click=MC_DOUBLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=33;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=2700;
      p_y=1740;
      p_eventtab=GFilemanForm1.view1_ctlimage1;
      p_eventtab2=_ul2_imageb;
   }
   _image view4_ctlimage1 {
      p_auto_size=true;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=840;
      p_max_click=MC_DOUBLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=33;
      p_tab_stop=false;
      p_value=0;
      p_width=420;
      p_x=2700;
      p_y=1740;
      p_eventtab=GFilemanForm1.view1_ctlimage1;
      p_eventtab2=_ul2_imageb;
   }
}
_form xbar1 {
   p_backcolor=0x80000005;
   p_border_style=BDS_NONE;
   p_caption="xs";
   p_forecolor=0x80000008;
   p_height=6000;
   p_tool_window=true;
   p_width=3825;
   p_x=14925;
   p_y=1890;
   p_eventtab=xbar1;
   _list_box ctllist1 {
      p_border_style=BDS_FIXED_SINGLE;
      p_font_size=1;
      p_height=5460;
      p_multi_select=MS_NONE;
      p_scroll_bars=SB_NONE;
      p_tab_index=1;
      p_tab_stop=true;
      p_width=900;
      p_x=0;
      p_y=0;
      p_eventtab2=_ul2_listbox;
   }
   _image scrollbar_image {
      p_auto_size=false;
      p_backcolor=0x80000005;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=5040;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=true;
      p_style=PSPIC_DEFAULT;
      p_tab_index=2;
      p_tab_stop=false;
      p_value=0;
      p_width=780;
      p_x=600;
      p_y=360;
      p_eventtab2=_ul2_imageb;
   }
   _image current_line_image {
      p_auto_size=false;
      p_backcolor=0x00A8A8A8;
      p_border_style=BDS_NONE;
      p_forecolor=0x80000008;
      p_height=120;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=4;
      p_tab_stop=false;
      p_value=0;
      p_width=780;
      p_x=300;
      p_y=5100;
      p_eventtab2=_ul2_imageb;
   }
   _image scrollbar_handle_image {
      p_auto_size=false;
      p_backcolor=0x00A8A8A8;
      p_border_style=BDS_NONE;
      p_forecolor=0x00D70625;
      p_height=960;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=3;
      p_tab_stop=false;
      p_value=0;
      p_width=840;
      p_x=180;
      p_y=4080;
      p_eventtab2=_ul2_imageb;
   }
}
_form xretrace_popup_form {
   p_backcolor=0x0035D0FF;
   p_border_style=BDS_NONE;
   p_caption="xretrace";
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
      p_forecolor=0x0035D000;
      p_height=1620;
      p_max_click=MC_SINGLE;
      p_Nofstates=1;
      p_picture='';
      p_stretch=false;
      p_style=PSPIC_DEFAULT;
      p_tab_index=5;
      p_tab_stop=false;
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
         p_font_name="MS Sans Serif";
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
         p_font_name="MS Sans Serif";
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

defmain()
{
   _config_modify_flags(CFGMODIFY_RESOURCE);
}
