const mongoose = require('mongoose');
const db = 'mongodb+srv://thang1818:thang1818thang1818thang1818@cluster0.3ib45.mongodb.net/userconnect?retryWrites=true&w=majority';


const connectDB = async () => {
    try {
        await mongoose.connect(db);
        console.log('Connected to MongoDB');
    } catch (error) {
        console.log(err.message);
        process.exit(1);
    }
};

module.exports = connectDB;