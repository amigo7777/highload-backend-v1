const express = require('express')

const { sequelize, tovars } = require('./models')

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

app.get('/tovars', async (req,res) =>{
    try{
        const tovar = await tovars.findAll()

        return res.json(tovar)
    }catch (err) {
        console.log(err)

        return res.status(500).json({error: 'Error: server guru meditation'})
    }
})

app.get('/tovars/:name', async (req,res) =>{
    const name = req.params.name
    try{
        const tovar = await tovars.findOne({
            where: {name}
        })
        
        return res.json(tovar)
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