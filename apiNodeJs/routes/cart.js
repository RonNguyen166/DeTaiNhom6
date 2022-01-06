const { json } = require('body-parser');
var express = require('express');
var router = express.Router();
var CartRestaurant = require('../models/cart')


router.get('/:idUser', async (req, res) => {
    const idUser = req.params.idUser;
    const carts = await CartRestaurant.find().where({idUser: idUser})
    .select("_id nameFood urlImage price quantily");
    res.json(carts)
})

router.get('/', async (req, res) => {
    const carts = await CartRestaurant.find();
    res.json(carts)
})

router.post('/', async (req, res) => {
    await CartRestaurant.create(req.body);
    res.json("create.")
})

router.delete('/:id', async (req, res) => {
    const carts = await CartRestaurant.findById(req.params.id);
    carts.delete();
    res.json("delete.")
})

router.delete('/:idUser', async (req, res) => {
    const idUser = req.params.idUser;
    const carts = await CartRestaurant.find().where({idUser: idUser})
    carts.delete();
    res.json("delete.")
})


module.exports = router;