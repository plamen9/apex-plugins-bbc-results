prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>9125937783033791
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'STRAVA'
);
end;
/
 
prompt APPLICATION 102 - plamen9-plugins
--
-- Application Export:
--   Application:     102
--   Name:            plamen9-plugins
--   Date and Time:   21:40 Tuesday October 31, 2023
--   Exported By:     DEV
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 9895242149197015
--   Manifest End
--   Version:         23.1.5
--   Instance ID:     9025458732818453
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/template_component/bbc_match_facts
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(9895242149197015)
,p_plugin_type=>'TEMPLATE COMPONENT'
,p_theme_id=>nvl(wwv_flow_application_install.get_theme_id, '')
,p_name=>'BBC_MATCH_FACTS'
,p_display_name=>'BBC Match Facts'
,p_supported_component_types=>'PARTIAL:REPORT'
,p_css_file_urls=>'#PLUGIN_FILES#css/bbc_match_facts#MIN#.css'
,p_partial_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dl class="sp-c-percentage-row">',
'   <dt class="sp-c-percentage-row-chart__heading gel-pica-bold">#FACT_NAME#</dt>',
'   <dd class="sp-c-percentage-row-chart sp-c-percentage-row-chart--left gel-pica gs-u-mb+" style="width:#HOME_TEAM_VAL_PERC#%;">',
'      <span class="gs-u-vh">Home</span>',
'      <span>#HOME_TEAM_VAL#{if IS_PERCENTAGE/}%{endif/}</span>  ',
'   </dd>',
'   <dd class="sp-c-percentage-row-chart sp-c-percentage-row-chart--right gel-pica gs-u-mb+" style="width:#AWAY_TEAM_VAL_PERC#%;">',
'      <span class="gs-u-vh">Away</span>',
'      <span>#AWAY_TEAM_VAL#{if IS_PERCENTAGE/}%{endif/}</span>',
'   </dd>',
'</dl>',
''))
,p_default_escape_mode=>'HTML'
,p_translate_this_template=>false
,p_api_version=>2
,p_report_body_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="sp-c-tabs__panel sp-c-tabs__panel--active sp-c-tabs__panel--match-stats">',
'    <h2 class="sp-c-tabs__panel-title">Match Stats</h2>',
'    <div class="sp-c-tabs__panel-content">',
'        <div class="sp-c-football-match-stats">',
'            <div class="gel-layout--center gs-u-mb+">',
'                  <div class="sp-tc-stats-header">',
'                  ',
'                     <div> <!-- <span class="gel-pica gs-u-mr+"> -->',
'                        <span class="sp-c-stats-key sp-c-stats-key--home"></span>',
'                     </div>',
'                     <div> <!-- <span class="gel-pica"> -->',
'                        <span class="sp-c-stats-key sp-c-stats-key--away"></span>',
'                     </div>  ',
'',
'                  </div> ',
'',
'                  <div>',
'                     {with/}',
'                        HOME_TEAM:=#HOME_TEAM#',
'                        HOME_TEAM_SCORE:=#HOME_TEAM_SCORE#',
'                        HOME_TEAM_SCORERS:=#HOME_TEAM_SCORERS#',
'                        AWAY_TEAM:=#AWAY_TEAM#',
'                        AWAY_TEAM_SCORE:=#AWAY_TEAM_SCORE#',
'                        AWAY_TEAM_SCORERS:=#AWAY_TEAM_SCORERS#',
'                        GAME_STATE:=#GAME_STATE#',
'                        SHOW_SCORERS:=#SHOW_SCORERS#',
'                     {apply BBC_RESULTS/}   ',
'                  </div>',
'               ',
'                  <div>#APEX$ROWS#</div>',
'            </div>',
'        </div>',
'    </div>',
'</div>'))
,p_report_row_template=>'<div #APEX$ROW_IDENTIFICATION#>#APEX$PARTIAL#</div>'
,p_report_placeholder_count=>3
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>5
);
wwv_flow_imp_shared.create_plugin_attr_group(
 p_id=>wwv_flow_imp.id(9903539325283824)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_title=>'Home Team'
,p_display_sequence=>1
);
wwv_flow_imp_shared.create_plugin_attr_group(
 p_id=>wwv_flow_imp.id(9903996965283824)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_title=>'Away Team'
,p_display_sequence=>2
);
wwv_flow_imp_shared.create_plugin_attr_group(
 p_id=>wwv_flow_imp.id(9904340617283825)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_title=>'Setting'
,p_display_sequence=>3
);
wwv_flow_imp_shared.create_plugin_attr_group(
 p_id=>wwv_flow_imp.id(9904778736283825)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_title=>'Game Statistics'
,p_display_sequence=>4
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9895521398197082)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>20
,p_static_id=>'AWAY_TEAM_VAL'
,p_prompt=>'Away Team Value'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>true
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2:NUMBER'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9904778736283825)
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9895882810197083)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>21
,p_static_id=>'AWAY_TEAM_VAL_PERC'
,p_prompt=>'Away Team Value (in percent)'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>true
,p_escape_mode=>'HTML'
,p_column_data_types=>'NUMBER'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9904778736283825)
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9896264806197083)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'FACT_NAME'
,p_prompt=>'Fact Name'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>true
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9904778736283825)
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9896660384197083)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>10
,p_static_id=>'HOME_TEAM_VAL'
,p_prompt=>'Home Team Value'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>true
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2:NUMBER'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9904778736283825)
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9897064120197083)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>11
,p_static_id=>'HOME_TEAM_VAL_PERC'
,p_prompt=>'Home Team Value (in percent)'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>true
,p_escape_mode=>'HTML'
,p_column_data_types=>'NUMBER'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9904778736283825)
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9897427606197084)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>31
,p_static_id=>'IS_PERCENTAGE'
,p_prompt=>'Is Percentage'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9904778736283825)
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9897831964197085)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_attribute_scope=>'REPORT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_static_id=>'AWAY_TEAM'
,p_prompt=>'Away Team'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9903996965283824)
,p_examples=>'Millwall'
,p_help_text=>'Name of the Away Team.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9898236192197086)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_attribute_scope=>'REPORT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_static_id=>'AWAY_TEAM_SCORE'
,p_prompt=>'Away Team Score'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'NUMBER'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9903996965283824)
,p_examples=>'2'
,p_help_text=>'The score for the Away Team. If the match has not started yet, leave it null.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9898649624197086)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_attribute_scope=>'REPORT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_static_id=>'AWAY_TEAM_SCORERS'
,p_prompt=>'Away Team Scorers'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9903996965283824)
,p_examples=>'Plamen Mushkov (51'', 88'')|Zlatan Ibrahimovic (70'')'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Provide a pipe "|" delimited string of goal scorers. You could use listagg to generate such string.',
'',
'select LISTAGG(scorer, ''| '') WITHIN GROUP (ORDER BY goal_time asc) away_team_scorers',
'from games',
'group by game_id'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9899045737197086)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_attribute_scope=>'REPORT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_static_id=>'GAME_STATE'
,p_prompt=>'Game State'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9904340617283825)
,p_examples=>'COMPLETED, LIVE'
,p_help_text=>'Game State should indicate if the game is yet to be played, is currently being played or has completed. The possible values are "COMPLETED", "LIVE" or null. Depending on the value specified, results will be coloured differently - light grey for the u'
||'pcoming fixtures, blue for the live games and yellow for the completed ones.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9899408403197086)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_attribute_scope=>'REPORT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_static_id=>'HOME_TEAM'
,p_prompt=>'Home Team'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9903539325283824)
,p_examples=>'West Ham'
,p_help_text=>'The name of the Home Team.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9899868974197086)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_attribute_scope=>'REPORT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_static_id=>'HOME_TEAM_SCORE'
,p_prompt=>'Home Team Score'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'NUMBER'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9903539325283824)
,p_examples=>'2'
,p_help_text=>'The score for the Home Team. If the match has not started yet, leave it null.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9900282845197087)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_attribute_scope=>'REPORT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_static_id=>'HOME_TEAM_SCORERS'
,p_prompt=>'Home Team Scorers'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9903539325283824)
,p_examples=>'Plamen Mushkov (51'', 88'')|Zlatan Ibrahimovic (70'')'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Provide a pipe "|" delimited string of goal scorers. You could use listagg to generate such string.',
'',
'select LISTAGG(scorer, ''| '') WITHIN GROUP (ORDER BY goal_time asc) home_team_scorers',
'from games',
'group by game_id'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9900688091197088)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_attribute_scope=>'REPORT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_static_id=>'SHOW_SCORERS'
,p_prompt=>'Show Scorers'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9904340617283825)
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'''Y''',
'''N''',
'null'))
,p_help_text=>'If enabled (and if there are any goalscorers), shows the goalscorers. Accepted values are ''Y'' to show and ''N'' or null to not show them.'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E73702D632D746162735F5F6974656D5F6E6F6A73207B0A2020646973706C61793A206E6F6E653B0A7D0A2E73702D632D74616273207B0A20206D617267696E2D626F74746F6D3A20313670783B0A2020626F726465722D746F703A2031707820736F6C';
wwv_flow_imp.g_varchar2_table(2) := '696420236462646264623B0A7D0A406D6564696120286D696E2D77696474683A2033372E35656D29207B0A20202E73702D632D74616273207B0A202020206D617267696E2D626F74746F6D3A20323470783B0A20207D0A7D0A2E73702D74632D73746174';
wwv_flow_imp.g_varchar2_table(3) := '732D686561646572207B0A2020646973706C61793A20666C65783B0A20206A7573746966792D636F6E74656E743A2063656E7465723B0A7D0A2E73702D632D746162735F5F6C697374207B0A20206D617267696E3A20303B0A202070616464696E673A20';
wwv_flow_imp.g_varchar2_table(4) := '303B0A2020646973706C61793A207461626C653B0A20207461626C652D6C61796F75743A2066697865643B0A202077696474683A20313030253B0A20206C6973742D7374796C653A206E6F6E653B0A2020746578742D616C69676E3A2063656E7465723B';
wwv_flow_imp.g_varchar2_table(5) := '0A7D0A2E73702D632D746162735F5F6974656D207B0A2020706F736974696F6E3A2072656C61746976653B0A2020646973706C61793A207461626C652D63656C6C3B0A20206865696768743A206175746F3B0A20206261636B67726F756E642D636F6C6F';
wwv_flow_imp.g_varchar2_table(6) := '723A20236666663B0A2020636F6C6F723A20233235323532353B0A2020626F726465722D6C6566743A2031707820736F6C696420236462646264623B0A2020626F726465722D626F74746F6D3A2031707820736F6C696420236462646264623B0A7D0A2E';
wwv_flow_imp.g_varchar2_table(7) := '73702D632D746162735F5F6974656D3A6C6173742D6F662D74797065207B0A2020626F726465722D72696768743A2031707820736F6C696420236462646264623B0A7D0A2E73702D632D746162735F5F6974656D3A686F766572207B0A20206261636B67';
wwv_flow_imp.g_varchar2_table(8) := '726F756E642D636F6C6F723A20236564656465643B0A2020637572736F723A20706F696E7465723B0A7D0A2E73702D632D746162735F5F6974656D2D2D64697361626C6564207B0A20206F7061636974793A20302E323B0A7D0A2E73702D632D74616273';
wwv_flow_imp.g_varchar2_table(9) := '5F5F6974656D2D2D64697361626C65643A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236666663B0A2020637572736F723A2064656661756C743B0A7D0A2E73702D632D746162735F5F6974656D2D2D64697361626C6564202E';
wwv_flow_imp.g_varchar2_table(10) := '7461622D73656C6563746F725F5F6C696E6B207B0A2020637572736F723A2064656661756C742021696D706F7274616E743B0A7D0A2E73702D632D746162735F5F6974656D2D2D73656C6563746564207B0A2020706F736974696F6E3A2072656C617469';
wwv_flow_imp.g_varchar2_table(11) := '76653B0A20206261636B67726F756E642D636F6C6F723A20233235323532353B0A7D0A2E73702D632D746162735F5F6974656D2D2D73656C65637465643A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20233132313231323B0A7D';
wwv_flow_imp.g_varchar2_table(12) := '0A2E73702D632D746162735F5F6974656D2D2D73656C65637465643A6166746572207B0A2020636F6E74656E743A202220223B0A2020706F736974696F6E3A206162736F6C7574653B0A2020746F703A20313030253B0A20206C6566743A203530253B0A';
wwv_flow_imp.g_varchar2_table(13) := '20206865696768743A20303B0A202077696474683A20303B0A2020706F696E7465722D6576656E74733A206E6F6E653B0A2020626F726465723A20736F6C6964207472616E73706172656E743B0A2020626F726465722D746F702D636F6C6F723A202332';
wwv_flow_imp.g_varchar2_table(14) := '35323532353B0A2020626F726465722D77696474683A203670783B0A20206D617267696E2D6C6566743A202D3670783B0A7D0A2E73702D632D746162735F5F6974656D2D2D73656C6563746564202E73702D632D746162735F5F6C696E6B207B0A202063';
wwv_flow_imp.g_varchar2_table(15) := '6F6C6F723A20236666663B0A2020637572736F723A2022706F696E746572223B0A7D0A2E73702D632D746162735F5F6C696E6B207B0A2020646973706C61793A20626C6F636B3B0A202070616464696E673A203870783B0A2020636F6C6F723A20233235';
wwv_flow_imp.g_varchar2_table(16) := '323532353B0A7D0A2E73702D632D746162735F5F70616E656C207B0A2020646973706C61793A206E6F6E653B0A7D0A2E73702D632D746162735F5F70616E656C2D2D616374697665207B0A2020646973706C61793A20626C6F636B3B0A7D0A2E73702D63';
wwv_flow_imp.g_varchar2_table(17) := '2D746162735F5F70616E656C2D7469746C65207B0A2020646973706C61793A206E6F6E653B0A7D0A0A2E73702D632D70657263656E746167652D726F772D63686172745F5F68656164696E67207B0A20206D617267696E2D626F74746F6D3A203470783B';
wwv_flow_imp.g_varchar2_table(18) := '0A2020746578742D616C69676E3A2063656E7465723B0A7D0A2E73702D632D70657263656E746167652D726F772D6368617274207B0A2020646973706C61793A20696E6C696E652D626C6F636B3B0A202070616464696E672D746F703A203470783B0A20';
wwv_flow_imp.g_varchar2_table(19) := '2070616464696E672D626F74746F6D3A203470783B0A2020636F6C6F723A20236666663B0A7D0A2E73702D632D70657263656E746167652D726F772D63686172742D2D6C656674207B0A202070616464696E672D6C6566743A203870783B0A2020626F72';
wwv_flow_imp.g_varchar2_table(20) := '6465722D72696768743A2032707820736F6C696420236666663B0A20206261636B67726F756E642D636F6C6F723A20233263376262343B0A2020746578742D616C69676E3A206C6566743B0A7D0A2E73702D632D70657263656E746167652D726F772D63';
wwv_flow_imp.g_varchar2_table(21) := '686172742D2D7269676874207B0A202070616464696E672D72696768743A203870783B0A2020746578742D616C69676E3A2072696768743B0A20206261636B67726F756E642D636F6C6F723A20233034336436363B0A7D0A0A2E73702D632D7374617473';
wwv_flow_imp.g_varchar2_table(22) := '2D6B6579207B0A2020646973706C61793A20696E6C696E652D626C6F636B3B0A2020706F736974696F6E3A2072656C61746976653B0A2020746F703A203270783B0A20206D696E2D77696474683A20323870783B0A20206865696768743A203570783B0A';
wwv_flow_imp.g_varchar2_table(23) := '20206D617267696E2D72696768743A203170783B0A7D0A2E73702D632D73746174732D6B65792D2D686F6D65207B0A20206261636B67726F756E642D636F6C6F723A20233263376262343B0A7D0A2E73702D632D73746174732D6B65792D2D6177617920';
wwv_flow_imp.g_varchar2_table(24) := '7B0A20206261636B67726F756E642D636F6C6F723A20233034336436363B0A7D0A0A2E67732D752D7668207B0A20202020706F736974696F6E3A206162736F6C7574653B0A2020202077696474683A203170783B0A202020206865696768743A20317078';
wwv_flow_imp.g_varchar2_table(25) := '3B0A202020206D617267696E3A202D3170783B0A2020202070616464696E673A20303B0A20202020626F726465723A20303B0A202020206F766572666C6F773A2068696464656E3B0A20202020636C69703A20726563742830203020302030293B0A7D0A';
wwv_flow_imp.g_varchar2_table(26) := '0A2E67732D752D6D625C2B207B0A202020206D617267696E2D626F74746F6D3A2038707821696D706F7274616E743B0A7D0A0A2E67656C2D6C61796F75742D2D63656E746572207B0A20202020746578742D616C69676E3A2063656E7465723B0A202020';
wwv_flow_imp.g_varchar2_table(27) := '202D7765626B69742D6A7573746966792D636F6E74656E743A2063656E7465723B0A202020202D6D732D666C65782D7061636B3A2063656E7465723B0A202020202D7765626B69742D626F782D7061636B3A2063656E7465723B0A202020206A75737469';
wwv_flow_imp.g_varchar2_table(28) := '66792D636F6E74656E743A2063656E7465723B0A7D0A0A2E67656C2D706963612D626F6C64207B0A20202020666F6E742D7765696768743A203730303B0A7D0A0A2E73702D632D70657263656E746167652D726F77206464207B0A2020666C6F61743A20';
wwv_flow_imp.g_varchar2_table(29) := '6C6566743B0A20206D617267696E2D696E6C696E652D73746172743A203070783B0A20206D617267696E2D696E6C696E652D656E643A203070783B0A7D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(9908913218425637)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_file_name=>'css/bbc_match_facts.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E73702D632D746162735F5F6974656D5F6E6F6A737B646973706C61793A6E6F6E657D2E73702D632D746162737B6D617267696E2D626F74746F6D3A313670783B626F726465722D746F703A31707820736F6C696420236462646264627D406D65646961';
wwv_flow_imp.g_varchar2_table(2) := '20286D696E2D77696474683A33372E35656D297B2E73702D632D746162737B6D617267696E2D626F74746F6D3A323470787D7D2E73702D74632D73746174732D6865616465727B646973706C61793A666C65783B6A7573746966792D636F6E74656E743A';
wwv_flow_imp.g_varchar2_table(3) := '63656E7465727D2E73702D632D746162735F5F6C6973747B6D617267696E3A303B70616464696E673A303B646973706C61793A7461626C653B7461626C652D6C61796F75743A66697865643B77696474683A313030253B6C6973742D7374796C653A6E6F';
wwv_flow_imp.g_varchar2_table(4) := '6E653B746578742D616C69676E3A63656E7465727D2E73702D632D746162735F5F6974656D7B706F736974696F6E3A72656C61746976653B646973706C61793A7461626C652D63656C6C3B6865696768743A6175746F3B6261636B67726F756E642D636F';
wwv_flow_imp.g_varchar2_table(5) := '6C6F723A236666663B636F6C6F723A233235323532353B626F726465722D6C6566743A31707820736F6C696420236462646264623B626F726465722D626F74746F6D3A31707820736F6C696420236462646264627D2E73702D632D746162735F5F697465';
wwv_flow_imp.g_varchar2_table(6) := '6D3A6C6173742D6F662D747970657B626F726465722D72696768743A31707820736F6C696420236462646264627D2E73702D632D746162735F5F6974656D3A686F7665727B6261636B67726F756E642D636F6C6F723A236564656465643B637572736F72';
wwv_flow_imp.g_varchar2_table(7) := '3A706F696E7465727D2E73702D632D746162735F5F6974656D2D2D64697361626C65647B6F7061636974793A2E327D2E73702D632D746162735F5F6974656D2D2D64697361626C65643A686F7665727B6261636B67726F756E642D636F6C6F723A236666';
wwv_flow_imp.g_varchar2_table(8) := '663B637572736F723A64656661756C747D2E73702D632D746162735F5F6974656D2D2D64697361626C6564202E7461622D73656C6563746F725F5F6C696E6B7B637572736F723A64656661756C7421696D706F7274616E747D2E73702D632D746162735F';
wwv_flow_imp.g_varchar2_table(9) := '5F6974656D2D2D73656C65637465647B706F736974696F6E3A72656C61746976653B6261636B67726F756E642D636F6C6F723A233235323532357D2E73702D632D746162735F5F6974656D2D2D73656C65637465643A686F7665727B6261636B67726F75';
wwv_flow_imp.g_varchar2_table(10) := '6E642D636F6C6F723A233132313231327D2E73702D632D746162735F5F6974656D2D2D73656C65637465643A61667465727B636F6E74656E743A2220223B706F736974696F6E3A6162736F6C7574653B746F703A313030253B6C6566743A3530253B6865';
wwv_flow_imp.g_varchar2_table(11) := '696768743A303B77696474683A303B706F696E7465722D6576656E74733A6E6F6E653B626F726465723A736F6C6964207472616E73706172656E743B626F726465722D746F702D636F6C6F723A233235323532353B626F726465722D77696474683A3670';
wwv_flow_imp.g_varchar2_table(12) := '783B6D617267696E2D6C6566743A2D3670787D2E73702D632D746162735F5F6974656D2D2D73656C6563746564202E73702D632D746162735F5F6C696E6B7B636F6C6F723A236666663B637572736F723A22706F696E746572227D2E73702D632D746162';
wwv_flow_imp.g_varchar2_table(13) := '735F5F6C696E6B7B646973706C61793A626C6F636B3B70616464696E673A3870783B636F6C6F723A233235323532357D2E73702D632D746162735F5F70616E656C7B646973706C61793A6E6F6E657D2E73702D632D746162735F5F70616E656C2D2D6163';
wwv_flow_imp.g_varchar2_table(14) := '746976657B646973706C61793A626C6F636B7D2E73702D632D746162735F5F70616E656C2D7469746C657B646973706C61793A6E6F6E657D2E73702D632D70657263656E746167652D726F772D63686172745F5F68656164696E677B6D617267696E2D62';
wwv_flow_imp.g_varchar2_table(15) := '6F74746F6D3A3470783B746578742D616C69676E3A63656E7465727D2E73702D632D70657263656E746167652D726F772D63686172747B646973706C61793A696E6C696E652D626C6F636B3B70616464696E672D746F703A3470783B70616464696E672D';
wwv_flow_imp.g_varchar2_table(16) := '626F74746F6D3A3470783B636F6C6F723A236666667D2E73702D632D70657263656E746167652D726F772D63686172742D2D6C6566747B70616464696E672D6C6566743A3870783B626F726465722D72696768743A32707820736F6C696420236666663B';
wwv_flow_imp.g_varchar2_table(17) := '6261636B67726F756E642D636F6C6F723A233263376262343B746578742D616C69676E3A6C6566747D2E73702D632D70657263656E746167652D726F772D63686172742D2D72696768747B70616464696E672D72696768743A3870783B746578742D616C';
wwv_flow_imp.g_varchar2_table(18) := '69676E3A72696768743B6261636B67726F756E642D636F6C6F723A233034336436367D2E73702D632D73746174732D6B65797B646973706C61793A696E6C696E652D626C6F636B3B706F736974696F6E3A72656C61746976653B746F703A3270783B6D69';
wwv_flow_imp.g_varchar2_table(19) := '6E2D77696474683A323870783B6865696768743A3570783B6D617267696E2D72696768743A3170787D2E73702D632D73746174732D6B65792D2D686F6D657B6261636B67726F756E642D636F6C6F723A233263376262347D2E73702D632D73746174732D';
wwv_flow_imp.g_varchar2_table(20) := '6B65792D2D617761797B6261636B67726F756E642D636F6C6F723A233034336436367D2E67732D752D76687B706F736974696F6E3A6162736F6C7574653B77696474683A3170783B6865696768743A3170783B6D617267696E3A2D3170783B7061646469';
wwv_flow_imp.g_varchar2_table(21) := '6E673A303B626F726465723A303B6F766572666C6F773A68696464656E3B636C69703A726563742830203020302030297D2E67732D752D6D625C2B7B6D617267696E2D626F74746F6D3A38707821696D706F7274616E747D2E67656C2D6C61796F75742D';
wwv_flow_imp.g_varchar2_table(22) := '2D63656E7465727B746578742D616C69676E3A63656E7465723B2D7765626B69742D6A7573746966792D636F6E74656E743A63656E7465723B2D6D732D666C65782D7061636B3A63656E7465723B2D7765626B69742D626F782D7061636B3A63656E7465';
wwv_flow_imp.g_varchar2_table(23) := '723B6A7573746966792D636F6E74656E743A63656E7465727D2E67656C2D706963612D626F6C647B666F6E742D7765696768743A3730307D2E73702D632D70657263656E746167652D726F772064647B666C6F61743A6C6566743B6D617267696E2D696E';
wwv_flow_imp.g_varchar2_table(24) := '6C696E652D73746172743A303B6D617267696E2D696E6C696E652D656E643A307D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(9910476752427026)
,p_plugin_id=>wwv_flow_imp.id(9895242149197015)
,p_file_name=>'css/bbc_match_facts.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
