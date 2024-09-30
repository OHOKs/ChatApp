const express = require('express')
var Router = express.Router()

const{
    getMessages,
    createMessage,
    updateMessage,
    deleteMessage
} = require('../controller/chatController.js')

Router.get('/', getMessages);

Router.post('/', createMessage);

Router.delete('/:id', deleteMessage);

Router.put('/:id', updateMessage);

module.exports = Router
