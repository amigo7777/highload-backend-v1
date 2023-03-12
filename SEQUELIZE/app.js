const express = require('express')

const { sequelize, tovars, customers, orders, carts } = require('./models')

const app = express()
app.use(express.json())

app.post('/tovars', async(req, res)=> {
    const {name, price, amount} = req.body

    try{
        const tovar = await tovars.create({name, price, amount})

        return res.json(tovar)
    } catch(err){
        console.log(err)
        return res.status(500).json(err)
    }
})

app.get('/catalog', async (req,res) =>{
    try{
        const tovar = await tovars.findAll()

        return res.json(tovar)
    }catch (err) {
        console.log(err)

        return res.status(500).json({error: 'Error: server guru meditation'})
    }
})

app.get('/tovars/:id/:name', async (req,res) =>{
    const name = req.params.name
    const id = req.params.id
    try{
        const tovar = await tovars.findOne({
            where: {name, id}
        })

        return res.json(tovar)
    }catch (err) {
        console.log(err)

        return res.status(500).json({error: 'Error: server guru meditation'})
    }
})

//удаление товара по его идентификатору
app.delete('/tovars/:id', async (req,res) =>{
    const id = req.params.id
    try{
        const tovar = await tovars.findOne({ where: {id} })
        await tovar.destroy()
        return res.json({message: 'Tovar delete!'})
    }catch (err) {
        console.log(err)

        return res.status(500).json({error: 'Error: server guru meditation'})
    }
})

// извеняет информацию о товаре с укзанным идентификатором
app.put('/tovars/:id', async (req,res) =>{
    const id = req.params.id
    const {name, price, amount} = req.body
    try{
        const tovar = await tovars.findOne({ where: {id} })
        
        tovar.name = name
        tovar.price = price
        tovar.amount = amount

        await tovar.save()
        return res.json(tovar)
    }catch (err) {
        console.log(err)

        return res.status(500).json({error: 'Error: server guru meditation'})
    }
})

//создание пользователя 
app.post('/customers', async (req, res) =>{
    const {name, password} = req.body

    try{
        const user = await customers.create({name, password})

        return res.json(user)
    } catch(err){
        console.log(err)
        return res.status(500).json(err)
    }
})

// создание заказа
app.post('/orders', async (req, res) => {
    const {/*customerUuid,*/ orders_date, status, cartId} = req.body

    try {
        const cart = await carts.findOne({where: {id: cartId}})
        
        // const customer = await customers.findOne({where: {uuid: customerUuid}})

        const order = await orders.create({cstomerId: cart.customerId, cartId: cart.id, spisok: cart.list, sum_price: cart.sumprice, orders_date, status})

        return res.json(order)
    } catch(err){
        console.log(err)
    }
})

// получение информации о конкретном заказе
app.get('/orders/:id', async (req,res) =>{
    const id = req.params.id

    try{
        const order = await orders.findOne({
            where: {id},
            include: customers // добавление информации о пользователе
        })

        return res.json(order)
    }catch (err) {
        console.log(err)

        return res.status(500).json({error: 'Error: server guru meditation'})
    }
})

// получение информации о заказах
app.get('/orders', async (req,res) =>{
    
    try{
        const order = await orders.findAll({})

        return res.json(order)
    }catch (err) {
        console.log(err)

        return res.status(500).json({error: 'Error: server guru meditation'})
    }
})

// обновление статуса заказа
app.put('/orders/:id/status', async (req,res) =>{
    const id = req.params.id
    const {status} = req.body

    try{
        const order = await orders.findOne({ where: {id}, }) 

        order.status = status

        await order.save()

        return res.json(order)
    }catch (err) {
        console.log(err)

        return res.status(500).json({error: 'Error: server guru meditation'})
    }
})

//добавление товара в корзину по его идентификатору
app.post('/cart', async(req, res)=> {
    const {/*list,*/ sumprice, customerUuid, tovarid} = req.body
    // const id = req.params.id

    try{
        const customer = await customers.findOne({where: {uuid: customerUuid}})

        const tovar = await tovars.findOne({ where: {id: tovarid},})

        const cart = await carts.create({customerId: customer.id, list: tovar.name, sumprice})

        return res.json(cart)
    } catch(err){
        console.log(err)
        return res.status(500).json(err)
    }
})

// получение информации о корзинах
app.get('/cart', async (req,res) =>{
    try{
        const cart = await carts.findAll()

        return res.json(cart)
    }catch (err) {
        console.log(err)

        return res.status(500).json({error: 'Error: server guru meditation'})
    }
})

// удаление товара из корзины по идетификатору товара (пока что делает просто удаление корзины)
app.delete('/cart/:id', async (req,res) =>{
    const id = req.params.id
    try{
        const cart = await carts.findOne({ where: {id},})

        await cart.destroy()

        return res.json({message: 'Cart is deleted!'})
    }catch (err) {
        console.log(err)

        return res.status(500).json({error: 'Error: server guru meditation'})
    }
})

app.listen({port: 5000}, async()=>{
    console.log('Server up on http://localhost:5000')
    await sequelize.authenticate()
    console.log('Database Connected!')
})

// async function main(){
//     await sequelize.sync({alter: true})
// }

// main()