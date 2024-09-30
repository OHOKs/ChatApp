const express = require("express");
var bodyParser = require('body-parser');

const userRoutes = require('./routes/userRoutes');
const chatRoutes = require('./routes/chatRoutes');

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json()); 

app.use('/user', userRoutes);
app.use('/chat', chatRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT,() => {
    console.log(`Server is running at http://localhost:${PORT}`);
});