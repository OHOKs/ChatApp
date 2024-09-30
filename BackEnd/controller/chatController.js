const currentTime = () =>{
    const date = new Date();
    const hungarianDate = new Date(date.toLocaleString('en-US', { timeZone: 'Europe/Budapest' }));

    const year = hungarianDate.getFullYear();
    const month = ('0' + (hungarianDate.getMonth() + 1)).slice(-2);
    const day = ('0' + hungarianDate.getDate()).slice(-2);
    const hours = ('0' + hungarianDate.getHours()).slice(-2);  
    const minutes = ('0' + hungarianDate.getMinutes()).slice(-2);  
    const seconds = ('0' + hungarianDate.getSeconds()).slice(-2);  

    return`${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
}

var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    port: "3306",
    user: "root",
    password: "",
    database: "chatapp"
});


const getMessages = async (req, res) => {
    try
    {
        const users = await new Promise((resolve, reject) => {
            con.query("SELECT * FROM `chat`", (err, result) => {
                if (err) { reject(err); } 
                else { resolve(result); }
            });
        });

        res.json(users);
    } catch (error){ res.status(500).json(error); }
};

const createMessage = async (req, res) => {

    const content = req.body.content;
    const sender_id = req.body.sender_id;
    const to_id = req.body.to_id;
    const created_at = currentTime();

    try{
        if (!content) { return res.status(400).json({ error: "Content is required" }); }

        if (!sender_id) { return res.status(400).json({ error: "Sender id is required" }); }

        if (!to_id) { return res.status(400).json({ error: "Reciever id is required" }); }

        await new Promise((resolve, reject) => {
            con.query("SELECT * FROM `user` WHERE `id` = ?", [sender_id],(err, result) => {
                if (err) { reject(err); } 
                else if (result.length === 0) { res.json({message: "Sender not found"}) } 
                else { resolve(result); }
            });
        });

        await new Promise((resolve, reject) => {
            con.query("SELECT * FROM `user` WHERE `id` = ?", [to_id],(err, result) => {
                if (err) { reject(err); } 
                else if (result.length === 0) { res.json({message: "Reciever not found"}) } 
                else { resolve(result); }
            });
        });

        con.query("INSERT INTO `chat` (`id`, `content`, `created_at`, `sender_id`, `to_id`) VALUES (NULL, ?, ?, ?, ?);", [content, created_at, sender_id, to_id],function (err, result, fields) {
            if (err) throw err;
        });

        res.json({message: "Message added"});
    } catch (error){ res.status(500).json(error); }
};

const updateMessage = async (req, res) => {

    const id = req.params.id;
    const content = req.body.content;

    try{
        if (!content) { return res.status(400).json({ error: "Content is required" }); }

        await new Promise((resolve, reject) => {
            con.query("UPDATE `chat` SET `content` = ? WHERE `id` = ?", [content, id],(err, result) => {
                    if (err) {
                        reject(err);  
                    } else if (result.affectedRows === 0) {
                        res.json({error: "Message not found"}); 
                    } else {
                        resolve(result); 
                    }
                }
            );
        });
        res.json({message: "Message updated"});
    } catch (error){ res.status(500).json(error); }
};

const deleteMessage = async (req, res) => {

    const id = req.params.id;

    try{
        await new Promise((resolve, reject) => {
            con.query("DELETE FROM `chat` WHERE `id` = ?", [id], (err, result) => {
                if (err) {
                    reject(err);
                } else if (result.affectedRows === 0) {
                    res.json({error: "Message not found"}); 
                } else {
                    resolve(result); 
                }
            });
        });
        res.json({message: "Message deleted"});
    }
    catch (error){ res.status(500).json(error); }
};

module.exports = {
    getMessages,
    createMessage,
    updateMessage,
    deleteMessage
}
