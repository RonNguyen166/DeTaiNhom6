const { json } = require('body-parser');
var express = require('express');
var router = express.Router();
var FoodRestaurant = require('../models/food')


router.get('/', async (req, res) => {
    const foods = await FoodRestaurant.find();
    res.json(foods)
})
router.get('/client', async (req, res) => {
    const foods = await FoodRestaurant.find().select('nameFood price point description imageurl favorite');
    res.json( foods)
})

router.post('/', async (req, res) => {
    await FoodRestaurant.create(req.body);
    res.json("create.")
   
})


module.exports = router;
