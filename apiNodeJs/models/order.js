var mongooes = require('mongoose');

var orderRestaurantSchema = mongooes.Schema({

    idUser: {
        type: String,
        required: true,
    },

    nameFood: {
        type: String,
        required: true,
    },
    urlImage: {
        type: String,
        required: true,
    },
    price: {
        type: Number,
        required: true,
    },
    quantily: {
        type: Number,
        required: true,
    },
   


});

module.exports = mongooes.model('OrderRestaurant', orderRestaurantSchema);