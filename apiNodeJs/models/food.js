var mongooes = require('mongoose');

var foodRestaurantSchema = mongooes.Schema({
    nameFood: {
        type: String,
        required: true,
    },
    price: {
        type: Number,
        required: true,
    },
    point: {
        type: Number,
        required: true,
    },
    description: {
        type: String,
        required: true,
    },
    imageurl: {
        type: String,
        required: true,
    },
    favorite: {
        type: Boolean,
        default: false
    },


});

module.exports = mongooes.model('FoodRestaurant', foodRestaurantSchema);