import psycopg2
from my_pass import password


def db_connect():
    print("Коннектимся к базе")
    try:
        connection = psycopg2.connect(user="postgres",
                                      password=password(),
                                      host="127.0.0.1",
                                      port="5432",
                                      database="testdb",
                                      )
        cursor = connection.cursor()
        print("Успешный коннект и создали курсор")
        return connection, cursor
    except:
        print("Ошибка при работе с PostgreSQL")


def send_request_to_db_1(cursor):
    # Выполнение SQL-запроса
    try:
        req = """
            SELECT * FROM maintab;
        """
        cursor.execute(req)
        print("Запрос успешен")
    except:
        print('Выполнение не успешно')
    try:
        data = cursor.fetchall()
        for dt in data:
            print(dt)
    except:
        print('fetch не выполнился')


def send_request_to_db_2_get_names(cursor):
    # Выполнение SQL-запроса
    try:
        req = """
        SELECT fk_authors
        FROM maintab join authors ON authors.id_fk_author = maintab.fk_author
        group BY fk_authors
        """
        cursor.execute(req)
        print("Запрос успешен")
    except:
        print('Выполнение не успешно')
    try:
        return cursor.fetchall()
    except:
        print('fetch не выполнился')


def send_request_to_db_2(cursor, user_name_input):
    # Выполнение SQL-запроса
    try:
        req = f"""
        SELECT name, price, description, is_published, fk_authors
        FROM maintab join authors ON authors.id_fk_author = maintab.fk_author
        where fk_authors = '{user_name_input}'
        """
        cursor.execute(req)
        print("Запрос успешен")
    except:
        print('Выполнение не успешно')
    try:
        return cursor.fetchall()
    except:
        print('fetch не выполнился')


def send_request_to_db_3(cursor, low, high):
    try:
        req = f"""SELECT name,price
        FROM maintab 
		where price >'{low}' and price < '{high}'
		order by price desc
        """
        cursor.execute(req)
        print("Запрос успешен")
    except:
        print('Выполнение не успешно')
    try:
        return cursor.fetchall()
    except:
        print('fetch не выполнился')


def send_request_to_db_4_get_cities(cursor):
    # Выполнение SQL-запроса
    try:
        req = """
        SELECT adress_fk
        FROM maintab 
		join adresses 
		ON adresses.id_fk = maintab.fk_adress
		group BY adress_fk
        """
        cursor.execute(req)
        print("Запрос успешен")
    except:
        print('Выполнение не успешно')
    try:
        return cursor.fetchall()
    except:
        print('fetch не выполнился')


def send_request_to_db_4(cursor, user_city_input):
    # Выполнение SQL-запроса
    try:
        req = f"""
        SELECT name, price, description,is_published,adress_fk
        FROM maintab 
		join adresses 
		ON adresses.id_fk = maintab.fk_adress
		where adresses.adress_fk like '{user_city_input}%'
        """
        cursor.execute(req)
        print("Запрос успешен")
    except:
        print('Выполнение не успешно')
    try:
        return cursor.fetchall()
    except:
        print('fetch не выполнился')


def send_request_to_db_5(cursor, person):
    try:
        req = f"""SELECT price
        FROM maintab join authors ON authors.id_fk_author = maintab.fk_author
        where fk_authors = '{person}'
        """
        cursor.execute(req)
        print("Запрос успешен")
    except:
        print('Выполнение не успешно')
    try:
        return cursor.fetchall()
    except:
        print('fetch не выполнился')


def send_request_to_db_5_2(cursor, person, price):
    try:
        req = f"""SELECT name
        FROM maintab join authors ON authors.id_fk_author = maintab.fk_author
        where fk_authors = '{person}' and price = '{price}'
        """
        cursor.execute(req)
        print("Запрос успешен")
    except:
        print('Выполнение не успешно')
    try:
        return cursor.fetchall()
    except:
        print('fetch не выполнился')


def close_connection_to_db(connection, cursor):
    if connection:
        cursor.close()
        connection.close()
        exit("Соединение с PostgreSQL закрыто")


def main():
    print("Привет! Давай поработаем с базой")
    connection, cursor = db_connect()
    while True:
        print("Укажи, что будем делать:\n"
              "1. Вывести все обьявления\n"
              "2. Вывести объявления только конкретных пользователей\n"
              "3. Вывести объявления в диапазоне цен, которые Вы укажите с сортировкой порядке возрастания цены\n"
              "4. Вывести объявления для конкретного города\n"
              "5. Вывести информацию для определенного пользователя и цены\n"
              "6. Закончить работу с БД")
        user_input = input()
        if user_input == "1":
            send_request_to_db_1(cursor)
        elif user_input == "2":
            names = send_request_to_db_2_get_names(cursor)
            print("Выберите по какому имени ищем")
            print(names)
            name_input = input()
            data = send_request_to_db_2(cursor, name_input)
            for d in data:
                print(d)
        elif user_input == "3":
            lower = input("Укажите низ диапазона >>>")
            upper = input("Укажите верх диапазона >>>")
            get_data = send_request_to_db_3(cursor, lower, upper)
            for g in get_data:
                print(g)
        elif user_input == "4":
            cities = send_request_to_db_4_get_cities(cursor)
            print("Выберите по какому городу ищем")
            print(cities)
            cities_input = input()
            print(cities_input)
            city_data = send_request_to_db_4(cursor, cities_input)
            print(city_data)
            for c in city_data:
                print(c)
        elif user_input == "5":
            print("есть следующие пользователи:")
            names = send_request_to_db_2_get_names(cursor)
            print(names)
            print("Выберите по какому имени ищем")
            name_input = input()
            print(f'У пользователи {name_input} есть обьявления со следующими ценами,:')
            print(send_request_to_db_5(cursor, name_input))
            price_offer = input("Какое объявление показать? - Выберите цену")
            print(send_request_to_db_5_2(cursor, name_input, price_offer))
        elif user_input == "6":
            close_connection_to_db(connection, cursor)
        else:
            print('Вы ошиблись при вводе')


if __name__ == '__main__':
    main()
