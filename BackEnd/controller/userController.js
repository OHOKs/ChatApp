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

const getUsers = async (req, res) => {
    try{
        const users = await new Promise((resolve, reject) => {
            con.query("SELECT * FROM `user`", (err, result) => {
                if (err) { reject(err); } 
                else { resolve(result); }
            });
        });

        res.json(users);
    } catch (error){ res.status(500).json(error); }
};

const createUser = async (req, res) => {

    const username = req.body.username;
    const password = req.body.password;
    const email = req.body.email;
    const birth_date = "2005-06-25 12:00:00.000"
    const created_at = currentTime();

    try{
        if (!username) { return res.status(400).json({ error: "Name is required" }); }

        if (!password) { return res.status(400).json({ error: "Password is required" }); }

        if (!email) { return res.status(400).json({ error: "Email is required" }); }

        if (!birth_date) { return res.status(400).json({ error: "Birth Date is required" }); }

        await new Promise((resolve, reject) => {
            con.query("SELECT * FROM `user` WHERE `username` = ?", [username],(err, result) => {
                if (err) { reject(err); } 
                else if (result.length === 0) { resolve(result); } 
                else { res.json({message: "Username Already exists"}); }
            });
        });

        await new Promise((resolve, reject) => {
            con.query("SELECT * FROM `user` WHERE `email` = ?", [email],(err, result) => {
                if (err) { reject(err); } 
                else if (result.length === 0) { resolve(result); } 
                else { res.json({message: "Email Already exists"}) }
            });
        });

        con.query("INSERT INTO `user` (`id`, `username`, `password`, `email`, `birth_date`, `created_at`, `updated_at`) VALUES (NULL, ?, ?, ?, ?, ?, ?);", [username, password, email, birth_date, created_at, created_at],function (err, result, fields) {
            if (err) throw err; 
        });

        res.json({message: "User added"});
    } catch (error){ res.status(500).json({error}); }
};

const updateUser = async (req, res) => {

    const userId = req.params.id; 
    const newName = req.body.username; 
    const updated_at = currentTime();

    try{
        if (!newName) {
            return res.status(400).json({ error: "Name is required" }); 
        }

        await new Promise((resolve, reject) => {
            con.query("SELECT * FROM `user` WHERE `username` = ?", [newName],(err, result) => {
                if (err) { reject(err); } 
                else if (result.length === 0) { resolve(result); } 
                else { res.json({message: "Username Already exists"}) }
            });
        });


        await new Promise((resolve, reject) => {
            con.query("UPDATE `user` SET `username` = ?, `updated_at` = ? WHERE `id` = ?", [newName, updated_at, userId],(err, result) => {
                    if (err) {
                        reject(err);  
                    } else if (result.affectedRows === 0) {
                        res.json({message: "User not found"})
                    } else {
                        resolve(result); 
                    }
                }
            );
        });
        res.json({message: "User updated"});
    } catch (error){ res.status(500).json(error); }
};

const deleteUser = async (req, res) => {

    const id = req.params.id;

    try{
        await new Promise((resolve, reject) => {
            con.query("DELETE FROM `user` WHERE `id` = ?", [id], (err, result) => {
                if (err) {
                    reject(err);
                } else if (result.affectedRows === 0) {
                    res.json({message: "User not found"})
                } else {
                    resolve(result); 
                }
            });
        });

        res.json({message: "User deleted"});
    }
    catch (error){ res.status(500).json(error); }
};

module.exports = {
    getUsers,
    createUser,
    updateUser,
    deleteUser
}

