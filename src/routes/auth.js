const express= require('express')
const Route =express.Router();

Route.get('register',authController.register)

module.exports = 