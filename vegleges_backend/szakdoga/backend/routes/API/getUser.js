const express = require('express');
const connection = require('../../middleware/database.js');
const router = express.Router();

// egy felhasználó adatainak lekérdezése
router.get('/getUser/:emailFromCookie', (req, res) => {
    const email = req.params.emailFromCookie;

    connection.query('SELECT accountID, email, username, role, DATE_FORMAT(birthDate, "%Y-%m-%d") AS formattedBirthday FROM account WHERE email=?', [email], (err, result) => {
        res.json(result);
        console.log(result);
    });
});


module.exports = router;