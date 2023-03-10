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
    const {customerUuid, spisok, sum_price, orders_date, status} = req.body

    try {
        const customer = await customers.findOne({where: {uuid: customerUuid}})

        const order = await orders.create({cstomerId: customer.id, spisok, sum_price, orders_date, status})

        return res.json(order)
    } catch(err){
        console.log(err)
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