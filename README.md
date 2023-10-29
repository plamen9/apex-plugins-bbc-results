# BBC Sports Result Template Component for APEX
[![APEX Community](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/78c5adbe/badges/apex-community-badge.svg)](https://apex.oracle.com/pls/apex/r/gamma_dev/demo/) [![APEX Plugin](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/b7e95341/badges/apex-plugin-badge.svg)](https://apex.oracle.com/pls/apex/r/gamma_dev/demo/)
[![APEX Built with Love](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/7919f913/badges/apex-love-badge.svg)](https://apex.oracle.com/pls/apex/r/gamma_dev/demo/)

## Preview
[![BBC Sports Result Template Component for APEX](https://cdn.hashnode.com/res/hashnode/image/upload/v1697037047986/09e58dc1-a60a-40a5-b501-603f6babc268.jpeg?auto=compress,format&format=webp)](https://cdn.hashnode.com/res/hashnode/image/upload/v1697037047986/09e58dc1-a60a-40a5-b501-603f6babc268.jpeg?auto=compress,format&format=webp)

## Description
A Template Component for Oracle APEX (23.1 and above). `BBC Results` plugin allows you to display a single game result or a list of results.

## Notes
- Games with a `GAME_STATE` value **COMPLETED** will be displayed in **yellow**. **LIVE** ones will be in **blue** and the upcoming fixteres (where `GAME_STATE` is **null**) will be in gray.
- `SHOW_SCORERS` is responsible for displaying or not the goalscorers. 'Y' or 'Yes' will display them, while 'N', 'No' or null values will hide them. You can control it using a hardcoded value, a database column value, `Swtich` item, `Checkbox`, `Dropdown` item, etc.

## Demo Application
[https://apex.oracle.com/pls/apex/r/gamma_dev/demo/bbc-results](https://apex.oracle.com/pls/apex/r/gamma_dev/demo/bbc-results)

## Installation
- Import plugin file `apex-plugins-bbc-results.sql` into your application
- (Optional) Deploy the CSS/JS files from `server` directory on your webserver and change the "File Prefix" to web servers folder (Inside the Plugin Settings).

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

## Attributes
| Attribute  | Description  | Examples |
|---|---|---|
| col1 | desc1 | example1 |

## How it's made
Curios to see how this plugin was created? </br>
Click on the link below and check my blog post ⤵️

[![How I created my first APEX Template Component](https://cdn.hashnode.com/res/hashnode/image/upload/v1697047311278/3b0a2579-fb50-495d-9caa-1f642231de1b.png?w=600&h=315&fit=crop&crop=entropy&auto=compress,format&format=webp)](https://blog.apexapplab.dev/how-i-created-my-first-apex-template-component)


