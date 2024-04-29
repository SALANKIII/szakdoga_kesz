const bcrypt = require('bcrypt');
const express = require('express');
const router = express.Router();
const connection = require('../../middleware/database.js');

const saltRounds = 10;

// felhasználó regisztrációja
router.post('/reg', function (req, res) {
    const { email, username, gender, weight, height, birthDate, password } = req.body;

    connection.query('SELECT * FROM account WHERE account.email = ?', [email], (err, result) => {
        if (err) {
            return res.json("Hiba a regisztráció során!");
        }

        if (result.length > 0) {
            return res.status(400).json("Az Email cím már foglalt!");
        }

        bcrypt.hash(password, saltRounds, (err, hash) => {
            if (err) throw err;

            connection.query('INSERT INTO account (accountID, username, email, pwd, gender, weight, height, role, birthDate) VALUES (NULL, ?, ?, ?, ?, ?, ?, 0, ?)', [username, email, hash, gender, weight, height, birthDate], (err, result) => {
                if (err) {
                    res.json("Hiba a regisztráció során!");
                }

                res.json("Sikeres regisztráció!");
            });
        });
    });
});

router.post('/regMobil', function (req, res) {
    const { email, username, gender, weight, height, birthDate, password } = req.body;
    console.log(email, username, gender, weight, height, birthDate, password );

    connection.query('SELECT * FROM account WHERE email = ?', [email], (err, result) => {
        if (err) {
            console.log("Hiba a regisztráció során!");
            return res.json("Hiba a regisztráció során!");
        }

        if (result.length > 0) {
            console.log("Az Email cím már foglalt!");
            return res.status(400).json("Az Email cím már foglalt!");
        }

        bcrypt.hash(password, saltRounds, (err, hash) => {
            if (err) throw err;
            connection.query('INSERT INTO account (accountID, username, email, pwd, gender, weight, height, role, birthDate) VALUES (NULL, ?, ?, ?, ?, ?, ?, 0, ?)', [username, email, hash, gender, weight, height, birthDate], (err, result) => {
                if (err) {
                    console.log("Hiba a regisztráció során!");
                    res.json("Hiba a regisztráció során!");
                }else{
                    const accountID = result.insertId;
                    connection.query('SELECT * FROM account WHERE accountID=?', [accountID], (err, result2) => {
                        const {email, username,role, gender, weight, height, birthDate, accountID  }=result2[0];
                        return res.json([{accountID: accountID, email:email, username:username,role: role, gender: gender,weight: weight, height:height, birthDate:birthDate}]);   
                    });
                }
            });
        });
    });
});



module.exports = router;