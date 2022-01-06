const { json } = require('body-parser');
var express = require('express');
var router = express.Router();
var OrderRestaurant = require('../models/order')


router.get('/:idUser', async (req, res) => {
    const idUser = req.params.idUser;
    const orders = await OrderRestaurant.find().where({idUser: idUser})
    .select("_id nameFood urlImage price quantily");
    res.json(orders)
})

router.get('/', async (req, res) => {
    const orders = await OrderRestaurant.find();
    res.json(orders)
})

router.post('/', async (req, res) => {
    await OrderRestaurant.create(req.body);
    res.json("create.")
})

router.delete('/:id', async (req, res) => {
    const orders = await OrderRestaurant.findById(req.params.id);
    orders.delete();
    res.json("delete.")
})


module.exports = router;