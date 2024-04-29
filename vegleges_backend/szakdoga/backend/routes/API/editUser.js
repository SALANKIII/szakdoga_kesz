const express = require('express');
const bcrypt = require('bcrypt');
const connection = require('../../middleware/database.js');
const upload = require('../../middleware/upload.js');
const router = express.Router();

const saltRounds = 10;

// a username módosítása
router.put('/editUsername/:email', (req, res) => {
    const email = req.params.email;
    const username = req.body.username;

    connection.query('UPDATE account SET username = ? WHERE email = ?;', [username, email], (err, result) => {
        res.json("Sikeres módosítás!");
    });
});

// a születési dátum módosítása
router.put('/editBirthday/:email', (req, res) => {
    const email = req.params.email;
    const birthday = req.body.birthday;

    connection.query('UPDATE account SET birthDate = ? WHERE email = ?;', [birthday, email], (err, result) => {
        res.json("Sikeres módosítás!");
    });
});

// a jelszó módosítása
router.put('/editPassword/:email', (req, res) => {
    const email = req.params.email;
    const password = req.body.password;

    bcrypt.hash(password, saltRounds, (err, hash) => {
        if (err) throw err;

        connection.query('UPDATE account SET pwd = ? WHERE email = ?;', [hash, email], (err, result) => {
            res.json("Sikeres módosítás!");
        });
    });
});

router.put('/updateHeightWeight', (req, res) => {
    const email = req.body.email;
    const height = req.body.height;
    const weight = req.body.weight;
    console.log(height,weight, email);
    connection.query('UPDATE account SET height = ?, weight = ?  WHERE email = ?;', [height,weight, email], (err, result) => {
        console.log(result);
        res.json("Sikeres módosítás!");
    });
});

module.exports = router;