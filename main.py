import psycopg2

from constants import USERNAME, PASSWORD, DATABASE, HOST, PORT


query_1 = '''
select trim(author.name), count(review.id) 
from author inner join review on author.id = review.id
group by author.name
'''

query_2 = '''
select trim(review.name), count(ramen.id) from review inner join ramen
on review.id = ramen.id or review.id = ramen.id
group by review.name
'''

query_3 = '''
select trim(author.name), count(ramen.id) 
from author inner join ramen on author.id = ramen.id
group by author.name
'''

connection = psycopg2.connect(user=USERNAME, password=PASSWORD,
                              dbname=DATABASE, host=HOST, port=PORT)

with connection:
    cursor = connection.cursor()

    print('QUERY 1:')
    cursor.execute(query_1)
    for row in cursor:
        print(row)

    print('\nQUERY 2:')
    cursor.execute(query_2)
    for row in cursor:
        print(row)

    print('\nQUERY 3:')
    cursor.execute(query_3)
    for row in cursor:
        print(row)
