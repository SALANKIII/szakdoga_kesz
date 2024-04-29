const bcrypt = require('bcrypt');
const express = require('express');
const router = express.Router();
const connection = require('../../middleware/database.js');

// login route
router.post('/login', function (req, res) {
    const { email, password } = req.body;

    connection.query('SELECT * FROM account WHERE email = ?', [email], (err, result) => {
        if (err) {
            //console.log(err);
            return req.status(500).json("Hiba történt a bejelentkezés során!");
        }

        //console.log(result);

        if (result.length === 0 || !bcrypt.compareSync(password, result[0].pwd)) {
            return res.status(401).json("Hibás jelszó vagy felhasználónév!");
        }

        const user = {
            username : result[0].username,
            email : result[0].email,
            role: result[0].role
        }

        res.cookie('userData', JSON.stringify(user), { httpOnly: true, maxAge: 1000 * 60 * 60 * 12 });
        if (user.role === 1) {
            return res.json({ success: true, user, redirect: '/home.html '});
        } else if (user.role === 0) {
            return res.json({ success: true, user, redirect: '/user.html' });
        }
    });
});

// mobil login route
router.post('/loginMobile', function (req, res) {
    const { email, password } = req.body;
    //
    console.log(email,password);

    connection.query('SELECT * FROM account WHERE account.email = ?', [email], (err, result) => {
        if (err) {
            return req.status(500).json("Hiba történt a bejelentkezés során!");
        }

        if (result.length === 0 || !bcrypt.compareSync(password, result[0].pwd)) {
            console.log("Hibás jelszó vagy email!");
            return res.status(401).json("Hibás jelszó vagy email!");
        }

        const {accountID, email, username,role, gender, weight, height, birthDate  }=result[0];
            return res.json([{accountID: accountID, email:email, username:username,role: role, gender: gender,weight: weight, height:height, birthDate:birthDate}]);   
    });
});

router.get('/mobilAutoLogin/:email', (req, res) => {
    const email = req.params.email;
    console.log("get user from mail "+email);
    connection.query('SELECT * FROM account WHERE email=?', [email], (err, result) => {
        if(err){
            console.log(log);
            res.json("Hiba a lekérdezés során!");
        }else{
            console.log(result);
            const {email, username,role, gender, weight, height, birthDate, accountID  }=result[0];
            return res.json([{accountID: accountID, email:email, username:username,role: role, gender: gender,weight: weight, height:height, birthDate:birthDate}]);  
        }
        
    });
});
module.exports = router;