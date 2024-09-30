const express = require('express')
var Router = express.Router()

const{
    getUsers,
    createUser,
    updateUser,
    deleteUser
} = require('../controller/userController.js')

Router.get('/', getUsers);

Router.post('/', createUser);

Router.delete('/:id', deleteUser);

Router.put('/:id', updateUser);

module.exports = Router
