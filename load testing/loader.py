import json
import random
import time

import requests
import matplotlib.pyplot as plt

URL = "http://localhost"
PORT = "5000"
usllsSht = ["c1cba4e5-d9db-4ca8-af60-8d672dd56871","cf6c8a03-a325-42e0-bd30-42ae2a4e9f48",
            "cf6c8a03-a325-42e0-bd30-42ae2a4e9f48", "149226a6-7431-49bf-8c67-d1e3e19d07d0"]
cardId = -1


def getTovarCnt():  # получить кол-во всех товаров
    response = requests.get(f'{URL}:{PORT}/catalog')
    #jjson = json.loads(response.json())
    jjson = response.json()
    print(len(jjson))
    return len(jjson)


def counter(func):
    def wrapper(*args, **kwargs):
        wrapper.count += 1
        return func(*args, **kwargs)

    wrapper.count = 0
    return wrapper


@counter
def getCart():  # получение списка корзин
    print("getCart")
    requests.get(f'{URL}:{PORT}/cart')


@counter
def postCart(tovarCnt):     # создаем товар корзине
    print("postCart")
    jsonParam = {
	"customerid": random.choice([1, 2, 12, 13]),
	"sumprice": random.randint(1000,20000),
	"tovarid": random.randint(1,3)
}
    #print(json.dumps(jsonParam))
    resp = requests.post(f'{URL}:{PORT}/cart', json=jsonParam)
    print(resp.text)
    cardId = json.loads(resp.text)["id"]
    #print(cardId)
    return cardId


@counter
def putRandTovar(tovarCnt): #изменение количества какого-то товара
    tovarid = random.randint(1, tovarCnt)
    tovarName = json.loads(requests.get(f'{URL}:{PORT}/tovars/{tovarid}').text)["name"]
    # print(tovarName)
    if random.randint(0, 10) % 2 == 0:
        print("putRandTovarCnt")
        jsonParam = {
            "name": tovarName,
            "price": random.randint(1000, 20000),
            # "amount": random.randint(2, 88)
        }
    else:
        print("putRandTovarAmount")
        jsonParam = {
            "name": tovarName,
            "amount": random.randint(1, 100),
        }
    #print(jsonParam)
    res = requests.put(f'{URL}:{PORT}/tovars/{tovarid}', json=jsonParam)
    print(res)


@counter
def getGoods():    # получение всех товаров
    print("getTovars")
    r = requests.get(f'{URL}:{PORT}/catalog')
    #print(r.text)


@counter
def deleteCartId(cardId):   # удалить корзину
    print("deleteCartId")
    r = requests.delete(f'{URL}:{PORT}/cart/{cardId}')
    print(r)
    # не работает пока не разберемся с айди корзин


@counter
def getOrders(): #получение всех заказов
    print("getOrders")
    requests.get(f'{URL}:{PORT}/orders')



def main():
    print("Start")
    tovarCnt = getTovarCnt()
    uuid = str(random.choice(usllsSht))
    while (True):

        getCartCount = getCart.count
        postCartCount = postCart.count
        putRandTovarCount = putRandTovar.count
        getTovarsCount = getGoods.count

        try:
            print("--------")
            getCart()
            if getCartCount >= 4:
                postCart(tovarCnt)
            if getCartCount >= 2:
                putRandTovar(tovarCnt)    # не рабоатет корректно
            if getCartCount >= 3:
                getGoods()
            #deleteCartId(cardId)

        except Exception as e:
           print(e)

        print(getCartCount)
        print(postCartCount)
        print(getTovarsCount)
        print(putRandTovarCount)

        if getTovarsCount == 100:
            break
        name = ["getCart", "postCart", "getGoods", "putRandTovar"]
        values = [getCartCount, postCartCount, getTovarsCount, putRandTovarCount]
        plt.bar(name, values)



if __name__ == "__main__":
    tovarNames = []
    main()
    plt.show()
