const express = require('express');
const connection = require('../../middleware/database.js');
const router = express.Router();

// az összes felhasználó lekérdezése
router.get('/getUsers', (req, res) => {
    connection.query('SELECT accountID, username, email, gender, weight, height, role, DATE_FORMAT(birthDate, "%Y-%m-%d") AS formattedBirthday FROM account', (err, result) => {
        res.json(result);
    });
});

// keresés a felhasználók adatai között
router.post('/searchingUser', (req, res) => {
    let searching = req.body.searching;
    const searchingType = req.body.searchingType;

    if (searching === '1') {
        searching = 1;
    } else if (searching === '0') {
        searching = 0;
    } else if (searching === '') {
        searching = '';
    } else {
        searching = searching;
    }

    const query = `SELECT accountID, username, email, gender, weight, height, role, DATE_FORMAT(birthDate, "%Y-%m-%d") AS formattedBirthday FROM account WHERE ${searchingType} LIKE ?`;
    connection.query(query, [`%${searching}%`], (err, result) => {
        res.json(result);
    });
});

router.delete('/deleteUser/:id', (req, res) => {
    const accountID = req.params.id;
    //console.log(accountID);

    connection.query('DELETE FROM account WHERE accountID = ?', [accountID], (err, result) => {
        res.json({ success : true });
       
    });
});

module.exports = router;