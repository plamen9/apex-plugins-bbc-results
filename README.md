# BBC Sports Result Template Component for APEX
[![APEX Community](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/78c5adbe/badges/apex-community-badge.svg)](https://apex.oracle.com/pls/apex/r/gamma_dev/demo/) [![APEX Plugin](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/b7e95341/badges/apex-plugin-badge.svg)](https://apex.oracle.com/pls/apex/r/gamma_dev/demo/)
[![APEX Built with Love](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/7919f913/badges/apex-love-badge.svg)](https://apex.oracle.com/pls/apex/r/gamma_dev/demo/)

## Preview
[![BBC Sports Result Template Component for APEX](https://raw.githubusercontent.com/plamen9/apex-plugins-bbc-results/main/demo_1.png)](https://raw.githubusercontent.com/plamen9/apex-plugins-bbc-results/main/demo_1.png)
[![BBC Sports Result Template Component for APEX](https://raw.githubusercontent.com/plamen9/apex-plugins-bbc-results/main/demo_2.png)](https://raw.githubusercontent.com/plamen9/apex-plugins-bbc-results/main/demo_2.png)

## Description
A Template Component for Oracle APEX (23.1 and above). 
`BBC Results` plugin allows you to display a single game result or a list of results.
`BBC Match Facts` plugin allows you to visualize match facts, such as shots on target, possession, fouls, cards, etc.

## Notes
- `BBC Match Facts` plugin uses the `BBC Results` plugin to display the game teams and result, so make sure to install that one first.
- Games with a `GAME_STATE` value **COMPLETED** will be displayed in **yellow**. **LIVE** ones will be in **blue** and the upcoming fixteres (where `GAME_STATE` is **null**) will be in gray.
- `SHOW_SCORERS` is responsible for displaying or not the goalscorers. 'Y' or 'Yes' will display them, while 'N', 'No' or null values will hide them. You can control it using a hardcoded value, a database column value, `Swtich` item, `Checkbox`, `Dropdown` item, etc.

## Demo Application
[https://apex.oracle.com/pls/apex/r/gamma_dev/demo/bbc-results](https://apex.oracle.com/pls/apex/r/gamma_dev/demo/bbc-results)

## Installation
> *Note: While importing the plugins, select the `-No Theme-` option for `Install Into Theme` question. If you select `42. Universal Theme`, the plugin will be installed into **Shared Components** \ **Templates**, instead of **Plugins** and its' identifier will be changed from `BBC_RESULTS` to `THEME$BBC_RESULTS`. If you still want to use this option, make sure to change the reference to the `BBC_RESULTS` in `BBC_MATCH_FACTS`. This is on line 28 in the `Report Body` section. This should be changed from `{apply BBC_RESULTS/}` to `{apply THEME$BBC_RESULTS/}`. The other option is to rename `THEME$BBC_RESULTS` to `BBC_RESULTS` before you start using it in your app.
 
1. Import plugin file `apex-plugins-bbc-results.sql` into your application. 
2. Import plugin file `apex-plugins-bbc-match-facts.sql` into your application.
3. (Optional) Deploy the CSS/JS files from `server` directory on your webserver and change the "File Prefix" to web servers folder (Inside the Plugin Settings).

# `BBC Results` Template Component

## Usage
🔸 As a `Partial (Single)`
- Create a new Region of type `BBC Results`. You can use any type of source for the data. Here is an example of a `SQL Query`:
```sql
select 'CSKA Sofia' home_team,
       3 home_team_score,
       'Plamen Mushkov (15'')|Plamen Mushkov (62'')|Plamen Mushkov (70'')' home_team_scorers,
       'Levski Sofia' away_team,
       0 away_team_score, 
       null away_team_scorers,
       'COMPLETED' game_state,
       'FT' status_label,
       null game_url, 
       :P2_SHOW_SCORERS show_scorers -- 'Y' or 'N'
from dual;
```
- Go to the Region `Attributes` section. From `Appearance` \ `Diisplay` select `Partial (Single)`.
- Map the query columns to the relevant attributes from the list (full list of options and their description - below).

🔸 As a `Multiple (Report)`
- Create a new Region of type `BBC Results`. You can use any type of source for the data. Here is an example of a `SQL Query`:
```sql
select home_team, home_team_score, home_team_scorers,
       away_team, away_team_score, away_team_scorers,
       game_state, status_label, game_url, show_scorers 
from games
where league = 'Premier League'
  and matchday = 10;
```
> **Sample text for the each column can be found in the previous example.*
- Go to the Region `Attributes` section. From `Appearance` \ `Diisplay` select `Multiple (Report)`.
- Map the query columns to the relevant attributes from the list (full list of options and their description - below).

🔸 As a column in a `Classic Report`, `Interactive Report` or `Interactive Grid`
- Create a new Region of type `Classic Report`, `Interactive Report` or `Interactive Grid`.  You can use any type of source for the data. Here is an example of a `SQL Query`:
```sql
select home_team, home_team_score, home_team_scorers,
       away_team, away_team_score, away_team_scorers,
       game_state, status_label, game_url, show_scorers,
       null result
from games
where league = 'Premier League'
  and matchday = 10;
```
- The column, named `result` (or any other name that you choose to use) should be of type `BBC Results`.
- After changing the type to `BBC Results`, all of the Attributes for the Tempalte Component will be available below.
- Map the query columns to the relevant attributes from the list, similar to the previous two scenarios (full list of options and their description - below).

# `BBC Match Facts` Template Component

## Usage
🔸 As a `Multiple (Report)`
- Create a new Region of type `BBC Match Facts`. You can use any type of source for the data. Here is an example of a `SQL Query`:
```sql
with match_score as (
   select 1 game_id,
         'CSKA Sofia' home_team, 3 home_team_score,
         'Plamen Mushkov (15'')|Plamen Mushkov (62'')|Plamen Mushkov (70'')' home_team_scorers,
         'Levski Sofia' away_team, 0 away_team_score, 
         null away_team_scorers,
         'COMPLETED' game_state, 'FT' STATUS_LABEL, null game_url, /*:P2_SHOW_SCORERS*/ 'Y' show_scorers
   from dual ),

match_facts as (
   select 1 game_id, 'Possession'      fact_name, 38 home_team_val, 62 away_team_val, 'Y' is_percentage from dual union all
   select 1 game_id, 'Shots'           fact_name, 19 home_team_val, 11 away_team_val, 'N' is_percentage from dual union all
   select 1 game_id, 'Shots on Target' fact_name,  9 home_team_val,  3 away_team_val, 'N' is_percentage from dual union all
   select 1 game_id, 'Corners'         fact_name,  1 home_team_val,  3 away_team_val, 'N' is_percentage from dual union all
   select 1 game_id, 'Fouls'           fact_name, 19 home_team_val, 21 away_team_val, 'N' is_percentage from dual
)

select f.game_id, f.fact_name, f.is_percentage,
       f.home_team_val, round(f.home_team_val/(f.home_team_val+f.away_team_val)*100,2) home_team_val_perc,
       f.away_team_val, round(f.away_team_val/(f.home_team_val+f.away_team_val)*100,2) away_team_val_perc,
       s.home_team, s.home_team_score, s.home_team_scorers, 
       s.away_team, s.away_team_score, s.away_team_scorers,
       s.game_state, s.status_label, s.game_url, s.show_scorers
from match_facts f
join match_score s
   on f.game_id = s.game_id
```
- Go to the Region `Attributes` section. From `Appearance` \ `Diisplay` select `Multiple (Report)`.
- Map the query columns to the relevant attributes from the list (full list of options and their description - below).

🔸 As a column in a `Classic Report`, `Interactive Report` or `Interactive Grid`
- Create a new Region of type `Classic Report`, `Interactive Report` or `Interactive Grid`.  You can use any type of source for the data. Here is an example of a `SQL Query`:
```sql
with match_score as (
   select game_id, home_team, home_team_score, home_team_scorers,
          away_team, away_team_score, away_team_scorers,
          game_state, status_label, game_url, show_scorers
   from dual ),

match_facts as (
   select 1 game_id, 'Possession'      fact_name, 38 home_team_val, 62 away_team_val, 'Y' is_percentage from dual union all
   select 1 game_id, 'Shots'           fact_name, 19 home_team_val, 11 away_team_val, 'N' is_percentage from dual union all
   select 1 game_id, 'Shots on Target' fact_name,  9 home_team_val,  3 away_team_val, 'N' is_percentage from dual union all
   select 1 game_id, 'Corners'         fact_name,  1 home_team_val,  3 away_team_val, 'N' is_percentage from dual union all
   select 1 game_id, 'Fouls'           fact_name, 19 home_team_val, 21 away_team_val, 'N' is_percentage from dual
)

select f.game_id, f.fact_name, f.is_percentage,
       f.home_team_val, round(f.home_team_val/(f.home_team_val+f.away_team_val)*100,2) home_team_val_perc,
       f.away_team_val, round(f.away_team_val/(f.home_team_val+f.away_team_val)*100,2) away_team_val_perc,
       s.home_team, s.home_team_score, s.home_team_scorers, 
       s.away_team, s.away_team_score, s.away_team_scorers,
       s.game_state, s.status_label, s.game_url, s.show_scorers,
       s.home_team||' '||s.home_team_score||':'||s.away_team_score||' '||s.away_team game_score,
       null game_stats
from match_facts f
join match_score s
   on f.game_id = s.game_id;
```
- The column, named `game_stats` (or any other name that you choose to use) should be of type `BBC Match Facts`.
- After changing the type to `BBC Match Facts`, all of the Attributes for the Tempalte Component will be available below.
- Map the query columns to the relevant attributes from the list, similar to the previous two scenarios (full list of options and their description - below).
> Tip: You can make most columns hidden and leave just `game_score` and `game_stats` from the query above. Then use the IR `Format\Control Break` functionality to group the stats.

## Common Attributes for both Template Components
| Attribute  | Description  | Examples |
|---|---|---|
| Home Team | The name of the Home Team. | West Ham |
| Home Team Score | The score for the Home Team. If the match has not started yet, leave it null. | 1 |
| Home Team Scorers | Provide a pipe "\|" delimited string of goal scorers. You could use listagg to generate such string. </br></br> select LISTAGG(scorer, '\| ') WITHIN GROUP (ORDER BY goal_time asc) home_team_scorers </br> from games </br> group by game_id | Plamen Mushkov (51', 88')\|Zlatan Ibrahimovic (70') |
| Away Team | Name of the Away Team. | Millwall |
| Away Team Score | The score for the Away Team. If the match has not started yet, leave it null. | 2 |
| Away Team Scorers | Provide a pipe "\|" delimited string of goal scorers. You could use listagg to generate such string. </br></br> select LISTAGG(scorer, '\| ') WITHIN GROUP (ORDER BY goal_time asc) away_team_scorers </br> from games </br> group by game_id | Plamen Mushkov (51', 88')\|Zlatan Ibrahimovic (70') |
| Game State | Game State should indicate if the game is yet to be played, is currently being played or has completed. The possible values are "COMPLETED", "LIVE" or null. Depending on the value specified, results will be coloured differently - light grey for the upcoming fixtures, blue for the live games and yellow for the completed ones. | COMPLETED </br> LIVE |
| GAME URL | Use it to enable a link on the score. Standard options for an APEX link are available. | # |
| Show Scorers | If enabled (and if there are any goalscorers), shows the goalscorers. Accepted values are 'Y' to show and 'N' or null to not show them. | 'Y' </br> 'N' </br> null |

## Additional Attributes for `BBC Match Facts` Template Component
| Attribute  | Description  | Examples |
|---|---|---|
| Fact Name | The name of the fact to display. It is displayed on top of the values. | Shots on Target |
| Is Percentage | Used to determine if the value displayed should include the % sign. Accepted values are 'Y' to show and 'N' or null to not show them.  | 'Y' </br> 'N' </br> null |
| AAA | BBB | CCC |
| Home Team Value | Value of the fact for the Home team. It is the label, displayed on the left side of the chart. | 19 |
| Home Team Value (in percent) | Value (in percent, out of 100%) of the fact for the Home team. It is used to display the chart correctly. Home team value in percent and Away Team value in percent shoub add to 100%. | 63.33|
| Away Team Value | Value of the fact for the Away team. It is the label, displayed on the right side of the chart. | 11 |
| Away Team Value (in percent) | Value (in percent, out of 100%) of the fact for the Away team. It is used to display the chart correctly. Away team value in percent and Home Team value in percent shoub add to 100. | 36.67 |

## How it's made
Curios to see how this plugin was created? </br>
Click on the link below and check my blog post ⤵️

[![How I created my first APEX Template Component](https://cdn.hashnode.com/res/hashnode/image/upload/v1697047311278/3b0a2579-fb50-495d-9caa-1f642231de1b.png?w=600&h=315&fit=crop&crop=entropy&auto=compress,format&format=webp)](https://blog.apexapplab.dev/how-i-created-my-first-apex-template-component)


