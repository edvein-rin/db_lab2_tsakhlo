import psycopg2
import matplotlib.pyplot as plt

from constants import USERNAME, PASSWORD, DATABASE, HOST, PORT


query_1 = '''
select teams.team_name, count(players.team_id) 
from teams inner join players on teams.team_id = players.team_id
group by teams.team_name
'''

query_2 = '''
select players.player_name, count(matches.match_id) from players inner join matches
on players.team_id = matches.home_team_id or players.team_id = matches.away_team_id
group by players.player_name
'''

query_3 = '''
select teams.team_name, count(matches.match_id) 
from teams inner join matches on teams.team_id = matches.home_team_id
group by teams.team_name
'''

connection = psycopg2.connect(user=USERNAME, password=PASSWORD,
                              dbname=DATABASE, host=HOST, port=PORT)

with connection:
    cur = connection.cursor()

    cur.execute(query_1)
    data_to_visualise = {}

    for row in cur:
        data_to_visualise[row[0]] = row[1]

    x_range = range(len(data_to_visualise.keys()))

    figure, bar_ax = plt.subplots()
    bar = bar_ax.bar(x_range, data_to_visualise.values(), label='Total')
    bar_ax.set_title('Гравці в командах')
    bar_ax.set_xlabel('Назва команди')
    bar_ax.set_ylabel('Кількість гравців')
    bar_ax.set_xticks(x_range)
    bar_ax.set_xticklabels(data_to_visualise.keys())

    cur.execute(query_2)
    data_to_visualise = {}

    for row in cur:
        data_to_visualise[row[0]] = row[1]

    figure, pie_ax = plt.subplots()
    pie_ax.pie(data_to_visualise.values(),
               labels=data_to_visualise.keys(), autopct='%1.1f%%')
    pie_ax.set_title('Частка матчів зіграних кожним гравцем')

    cur.execute(query_3)
    data_to_visualise = {}

    for row in cur:
        data_to_visualise[row[0]] = row[1]

    x_range = range(len(data_to_visualise.keys()))

    figure, bar_ax = plt.subplots()
    bar = bar_ax.bar(x_range, data_to_visualise.values(), label='Total')
    bar_ax.set_title('Команди, які зіграли матч на своєму стадіоні')
    bar_ax.set_xlabel('Назва команди')
    bar_ax.set_ylabel('Кількість зіграних матчів')
    bar_ax.set_xticks(x_range)
    bar_ax.set_xticklabels(data_to_visualise.keys())


mng = plt.get_current_fig_manager()
mng.resize(1400, 600)

plt.show()
