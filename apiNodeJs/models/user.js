const mongooes = require("mongoose");



var userRestaurantSchema = mongooes.Schema({
    email: {
        type: String,
        required: true,
    },
    phoneNumber: {
        type: String,
        required: true,
    },
    userName: {
        type: String,
        required: true,
    },
    password: {
        type: String,
        required: true,
    },
   

});

module.exports = mongooes.model('UserRestaurant', userRestaurantSchema);