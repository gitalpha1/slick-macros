
/******************************************************************************
*  $Revision: 1.1 $
******************************************************************************/


#include "slick.sh"


_form xretrace_form {
   p_backcolor=0x80000005;
   p_border_style=BDS_DIALOG_BOX;
   p_caption='Retrace Control Panel';
   p_clip_controls=false;
   p_forecolor=0x80000008;
   p_height=5295;
   p_width=9645;
   p_x=10905;
   p_y=1890;
   p_eventtab=xretrace_form;
   _frame ctlframe1 {
      p_backcolor=0x80000005;
      p_caption='';
      p_clip_controls=true;
      p_forecolor=0x80000008;
      p_height=3840;
      p_tab_index=2;
      p_visible=false;
      p_width=4125;
      p_x=240;
      p_y=180;
      _check_box show_retrace_modified_line_markers_checkbox {
         p_alignment=AL_LEFT;
         p_backcolor=0x80000005;
         p_caption='  show retrace modified line markers';
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
         p_backcolor=0x80000005;
         p_caption='  show retrace cursor line markers';
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
         p_backcolor=0x80000005;
         p_caption='  show de-modified line markers';
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
         p_backcolor=0x80000005;
         p_caption='  show retrace most recent modified line markers';
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
         p_backcolor=0x80000005;
         p_caption='  track de-modified lines with line markers';
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
         p_backcolor=0x80000005;
         p_caption='  track de-modified lines with lineflags';
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
         p_backcolor=0x80000005;
         p_caption='  retrace delayed start';
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
         p_backcolor=0x80000005;
         p_caption='  track modified lines';
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
      p_clip_controls=false;
      p_forecolor=0x000000FF;
      p_Grabbar=false;
      p_GrabbarLocation=SSTAB_GRABBARLOCATION_TOP;
      p_height=315;
      p_MultiRow=SSTAB_MULTIROW_NONE;
      p_NofTabs=2;
      p_Orientation=SSTAB_OBOTTOM;
      p_PaddingX=4;
      p_PaddingY=4;
      p_PictureOnly=false;
      p_tab_index=4;
      p_tab_stop=true;
      p_TabsPerRow=5;
      p_width=1395;
      p_x=600;
      p_y=7140;
      p_eventtab2=_ul2_sstabb;
      _sstab_container  {
         p_ActiveCaption='Select';
         p_ActiveEnabled=true;
         p_ActiveOrder=0;
         p_ActiveColor=0x00800080;
         p_ActiveToolTip='';
      }
      _sstab_container  {
         p_ActiveCaption='Value';
         p_ActiveEnabled=true;
         p_ActiveOrder=1;
         p_ActiveColor=0x00800080;
         p_ActiveToolTip='';
      }
   }
   _command_button ok_button {
      p_cancel=false;
      p_caption='Close';
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
      p_clip_controls=true;
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
         p_text='50';
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
         p_caption='retrace cursor max history length';
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
         p_text='20';
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
         p_text='250';
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
         p_text='16';
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
         p_text='16';
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
         p_text='16';
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
         p_caption='retrace modified lines max history length';
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
         p_caption='retrace timer sampling interval';
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
         p_caption='retrace cursor line distance recording granularity';
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
         p_caption='retrace cursor line distance viewing granularity';
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
         p_caption='retrace cursor min region pause time intervals';
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
         p_caption='retrace cursor min line pause time';
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
      p_cancel=false;
      p_caption='Disable xretrace';
      p_default=false;
      p_height=420;
      p_tab_index=7;
      p_tab_stop=true;
      p_width=1350;
      p_x=4125;
      p_y=4455;
   }
   _command_button dump_cursor_retrace_button {
      p_cancel=false;
      p_caption='Dump cursor retrace';
      p_default=false;
      p_height=420;
      p_tab_index=8;
      p_tab_stop=true;
      p_width=1635;
      p_x=5715;
      p_y=4455;
   }
   _command_button dump_mod_lines_button {
      p_cancel=false;
      p_caption='Dump mod lines retrace';
      p_default=false;
      p_height=420;
      p_tab_index=9;
      p_tab_stop=true;
      p_width=1830;
      p_x=7560;
      p_y=4455;
   }
   _command_button help_button {
      p_cancel=false;
      p_caption='Help';
      p_default=false;
      p_height=405;
      p_tab_index=10;
      p_tab_stop=true;
      p_width=735;
      p_x=1380;
      p_y=4440;
   }
}


