import datetime
import json
from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import urlparse, parse_qs

from cursor import Database

cur = Database()
tables = ["tovars","orders","cart","customers"]

#создает JSON из ответа sql
#да, криво и много, будет желание и силы перепишим
def get_JSON(path, rows):
    tovars = []
    if path == "tovars":
        for row in rows:
            tovar = {'id': row[0], 'name': row[1], 'price': str(row[2]), 'amount': row[3]}
            tovars.append(tovar)
    elif path == "orders":
        for row in rows:
            tovar = {'id': row[0], 'spisok': str(row[1]), 'sum_price': str(row[2]),
                     'orders_date': str(row[3]), 'buyer': row[4]}
            tovars.append(tovar)
    elif path == "cart":
        for row in rows:
            tovar = {'id': row[0], 'list': str(row[1]), 'sumprice': str(row[2]), 'buyer': row[3]}
            tovars.append(tovar)

    if path == "customers":
        for row in rows:
            tovar = {'id': row[0], 'name': row[1], 'password': str(row[2]), 'uuid': row[3]}
            tovars.append(tovar)

    return tovars

class MyServer(BaseHTTPRequestHandler):
    #запросы вида: http://localhost:8080/tovars?1 где локалхост/таблица?параметры(ид или нейм)

    def do_GET(self):
        rows = ""
        parsed_url = urlparse(self.path)
        if parsed_url.path[1:] in tables and parsed_url.query == "":
            # Получение списка товаров из базы данных
            rows = cur.execute_query(f"SELECT * FROM {parsed_url.path[1:]}")
            self.send_response(200)
        elif parsed_url.path[1:] in tables and parsed_url.query != "":
            print(parsed_url.query)
            try:
                if parsed_url.path[1:] == "cart":
                    rows = cur.execute_query(f"SELECT * FROM {parsed_url.path[1:]}"
                                             f" where id={int(parsed_url.query)};")
                elif  parsed_url.path[1:] == "tovars" or parsed_url.path[1:] == "customers":
                    rows = cur.execute_query(f"SELECT * FROM {parsed_url.path[1:]}"
                                             f" where id={int(parsed_url.query)};"
                                             f"or name='{parsed_url.query}';")
                self.send_response(200)
            except:
                print("что то не так c параметрами")
                self.send_error(404)
                pass
        else:
            print("просто сервер")
            self.send_response(200)

        # Формирование ответа в формате JSON
        tovars = get_JSON(parsed_url.path[1:], rows)
        response = json.dumps(tovars)

        # Отправка ответа клиенту
        self.send_header('Content-type', 'application/json')
        self.end_headers()
        self.wfile.write(response.encode())


    def do_POST(self):
        # Разбор URL-адреса и получение параметров запроса
        parsed_url = urlparse(self.path)
        table = parsed_url.path[1:]
        query = parsed_url.query
        if table == "tovars":
            #если будет требвать айдишник то тут получаем максимальный и +1
            #id = int(cur.execute_query(f"SELECT MAX(id) from {table}")) + 1
            name = query.get('name', [''])[0]
            price = query.get('price', [''])[0]
            amount = query.get('amount', [''])[0]
            #чето я не придумал как будет id подтягиваться поэтому как нибудь сами
            # Выполнение SQL-запроса
            sql = (f"INSERT INTO {table} (name, price, amount) VALUES"
                   f" ({name}, {price}, {amount})")
        elif table == "cart":
            #пихать весь список целиком в юрл
            # если будет требвать айдишник то тут получаем максимальный и +1
            # id = int(cur.execute_query(f"SELECT MAX(id) from {table}")) + 1
            list = query.get('list', [''])[0]
            sumprice = query.get('sumprice', [''])[0]
            buyer = query.get('buyer', [''])[0]
            # чето я не придумал как будет id подтягиваться поэтому как нибудь сами
            # Выполнение SQL-запроса
            sql = (f"INSERT INTO {table} (list, sumprice, buyer) VALUES"
                   f" ({list}, {sumprice}, {buyer})")
        elif table == "orders":
            #указывать в параметрах только айди нужной корзины
            cart_id = int(query)
            order = cur.execute_query(f"SELECT * FROM cart where id={cart_id}")

            # если будет требвать айдишник то тут получаем максимальный и +1
            # id = int(cur.execute_query(f"SELECT MAX(id) from {table}")) + 1
            #order_id = order[0]    чето я не уверен насчет этого
            spisok = order[1]
            sum_price = order[2]  #сами поправляйте тип данных
            orders_date = datetime.date
            buyer = int(order[3])

            #парсим список товаров и уменьшаем количество каждого на 1
            for tovar in spisok.split(", "):
                cur.execute_query(f"UPDATE tovars SET amount = amount -1 WHERE name = {tovar}")

            # Выполнение SQL-запроса
            # чето я не придумал как будет id подтягиваться поэтому как нибудь сами
            sql = (f"INSERT INTO {table} (spisok, sum_price, orders_date, buyer) VALUES"
                   f" ({spisok}, {sum_price}, {orders_date}, {buyer})")
        elif table == "customers":
            # если будет требвать айдишник то тут получаем максимальный и +1
            # id = int(cur.execute_query(f"SELECT MAX(id) from {table}")) + 1
            name = query.get('name', [''])[0]
            password = query.get('password ', [''])[0]
            uuid = query.get('uuid', [''])[0]
            # чето я не придумал как будет id подтягиваться поэтому как нибудь сами
            # Выполнение SQL-запроса
            sql = (f"INSERT INTO {table} (name, password, uuid) VALUES"
                   f" ({name}, {password}, {uuid})")
        try:
            cur.execute_query(sql)
            print("Post create succes")
            self.send_response(200)
            self.end_headers()
        except:
            self.send_error(400)
            print("POST что то поломалось при создании записи в таблицы")



    def do_PUT(self):
        parsed_url = urlparse(self.path)
        table = parsed_url.path[1:]
        query = parsed_url.query
        if table == "tovars" and query != "":
            params = parse_qs(parsed_url.query)
            tovar_id = int(params.get('id', [''])[0])
            old_tovar = cur.execute_query(f"SELECT * FROM tovars"
                                          f" WHERE id = {tovar_id}")

            #заполнение значений
            #новые значения из юрл иначе берем старые из бд
            tovar_name = params.get('name', [''])
            tovar_name = tovar_name[0] if tovar_name else old_tovar[1]
            #!!!!!!!!!!!!!ОБЯЗАТЕЛЬНО ПОМЕНЯТЬ ТИП ЗНАЧЕНИЯ ЦЕНЫ ЧТОБЫ НЕ КРАШИЛОСЬ
            #временная заглушка для этого дерьма, не факт что работает
            tovar_price = float(params.get('price', ['']))
            tovar_price = tovar_price[0] if tovar_price else float(old_tovar[2])
            tovar_count = int(params.get('amount', ['']))
            tovar_count = tovar_count[0] if tovar_count else int(old_tovar[-1])

            cur.execute_query(f"UPDATE tovars SET name = {tovar_name},"
                              f"price = {tovar_price}, amount = {tovar_count}"
                              f"WHERE id = {tovar_id}")
            print("tovar UPDATED")
            self.send_response(200)
            self.end_headers()
        else:
            print("something went wrong!")
            self.send_error(403)


    def do_DELETE(self):
        parsed_url = urlparse(self.path)
        table = parsed_url.path[1:]
        query = parsed_url.query
        if table == "tovars" and query != "":
            tovar_id = int(query)
            cur.execute_query(f"DELETE FROM tovars WHERE id = {tovar_id}")
            print("tovar DELETED")
            self.send_response(200)
            self.end_headers()
        elif table == "cart" and query != "":
            cart_id = int(query)
            cur.execute_query(f"DELETE FROM cart WHERE id = {cart_id}")
            print("cart DELETED")
            self.send_response(200)
            self.end_headers()
        else:
            self.send_error(403)



httpd = HTTPServer(('localhost', 8080), MyServer)
print('Server listening on localhost:8080...')
print("Connect via: http://localhost:8080")
httpd.serve_forever()


cur.disconnect()