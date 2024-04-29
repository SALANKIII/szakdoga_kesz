const express = require('express');
const connection = require('../../middleware/database.js');
const router = express.Router();

// összes gyakorlat lekérdezése
router.get('/exercises', function(req, res) {
    connection.query('SELECT * FROM exercises', (err, result) => {
        if (err) {
            return res.status(500).json('Internal server error!');
        }

        res.json(result);
    });
});

// egy konkrét gyakorlat lekérdezése id alapján
router.get('/exercises/:id', function(req, res) {
    const exerciseID = req.params.id;

    connection.query('SELECT * FROM exercises WHERE exerciseID = ?', [exerciseID], (err, result) => {
        if (err) {
            return res.status(500).json('Internal server error!');
        }

        res.json(result);
    });
});

// új gyakorlat felvétele
router.post('/exercises', function(req, res) {
    const exercise_name = req.body.exercise_name;

    connection.query('INSERT INTO exercises (exerciseID, exercise_name) VALUES (NULL, ?);', [exercise_name], (err, result) => {
        if (err) {
            return res.status(500).json('Internal server error!');
        }

        res.status(200).json('Successfully created!');
    });
});

// meglévő gyakorlat törlése
router.delete('/exercises/:id', function(req, res) {
    const exerciseID = req.params.id;

    connection.query('DELETE FROM exercises WHERE exercises.exerciseID = ?', [exerciseID], (err, result) => {
        if (err) {
            return res.status(500).json('Internal server error!');
        }

        res.status(200).json('Successfully deleted!');
    });
});

// meglévő gyakorlat módosítása
router.put('/exercises/:id', function (req, res) {
    const exerciseID = req.params.id;
    const exercise_name = req.body.exercise_name;

    connection.query('UPDATE exercises SET exercise_name = ? WHERE exercises.exerciseID = ?;', [exercise_name, exerciseID], (err, result) => {
        if (err) {
            return res.status(500).json('Internal server error!');
        }

        res.status(200).json('Successfully updated!');
    });
});

module.exports = router;