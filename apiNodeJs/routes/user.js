const { json } = require('body-parser');
var express = require('express');
var router = express.Router();
var UserRestaurant = require('../models/user')


router.get('/', async (req, res) => {
    const users = await UserRestaurant.find();
    res.json(users)
})

router.post('/', async (req, res) => {
    await UserRestaurant.create(req.body);
    res.json("create.")
   
})


router.patch('/login', async (req, res) => {
    const email = req.body.email;
    const password = req.body.password;
    const user = await UserRestaurant.find().where({email: email}).where({password: password}).select("_id email userName password phoneNumber");
    res.json(user)
})

router.delete("/:id", async(req, res)=>{
    const user = await UserRestaurant.findById(req.params.id);
    await user.remove();
    res.json("delete oke")
})


module.exports = router;
