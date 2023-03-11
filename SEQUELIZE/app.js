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

app.get('/orders', async (req,res) =>{
    
    try{
        const order = await orders.findAll({})

        return res.json(order)
    }catch (err) {
        console.log(err)

        return res.status(500).json({error: 'Error: server guru meditation'})
    }
})

app.post('/cart', async(req, res)=> {
    const {list, sumprice, customerUuid} = req.body

    try{
        const customer = await customers.findOne({where: {uuid: customerUuid}})

        const cart = await carts.create({customerId: customer.id, list, sumprice})

        return res.json(cart)
    } catch(err){
        console.log(err)
        return res.status(500).json(err)
    }
})

app.get('/cart', async (req,res) =>{
    try{
        const cart = await carts.findAll()

        return res.json(cart)
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