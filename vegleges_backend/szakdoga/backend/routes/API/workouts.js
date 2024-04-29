const express = require('express');
const connection = require('../../middleware/database.js');
const router = express.Router();

// az összes felhasználó összes workout lekérdezése
router.get('/workouts', function (req, res) {
    connection.query('SELECT account.accountID, account.username, account.email, account.gender, account.weight, account.height, account.role, account.birthDate, workouts.*, w_exercises.*, exercises.* FROM account JOIN workouts USING(accountID) JOIN w_exercises USING(workoutID) JOIN exercises USING (exerciseID);', (err, result))

    if (err) {
        return res.status(500).json('Internal server error!');
    }

    res.status(200).json(result);
});

// egy felhasználó összes workout lekérdezése
router.get('/workouts/:accountID', function (req, res) {
    const accountID = req.params.accountID;

    connection.query('SELECT * FROM workouts where accountID=?;', [accountID], (err, result)=>
    {
        if (err) {
            return res.status(500).json('Internal server error!');
        }
    
        res.status(200).json(result);
    });
});

// egy felhasználó egy adott workout lekérdezése
router.get('/workouts/:accountID/:workoutID', function (req, res) {
    const accountID = req.params.accountID;
    const workoutID = req.params.workoutID;

    connection.query('SELECT account.accountID, account.username, account.email, account.gender, account.weight, account.height, account.role, account.birthDate, workouts.*, w_exercises.*, exercises.* FROM account JOIN workouts USING(accountID) JOIN w_exercises USING(workoutID) JOIN exercises USING (exerciseID) WHERE workouts.accountID = ? AND workouts.workoutID = ?;', [accountID, workoutID], (err, result))

    if (err) {
        return res.status(500).json('Internal server error!');
    }

    res.status(200).json(result);
});

// új workout felvétele egy felhasználónak
router.post('/workouts', function (req, res) {
    const { wname, accountID} = req.body;

    connection.query('INSERT INTO workouts (wname, accountID) VALUES (?, ?);', [wname, accountID], (err, result) => {
        if (err) {
            return res.status(500).json('Internal server error!');
        }

        const workoutID = result.insertId;

        res.status(200).json([workoutID]);
    });
});

// új exercise felvétele egy adott workoutba
router.post('/w_exercises/:workoutID/:exerciseID', function(req, res) {
    const workoutID = req.params.workoutID;
    const exerciseID = req.params.exerciseID;
    const { sets, repetitions, weight } = req.body;

    connection.query('INSERT INTO w_exercises (exerciseID, workoutID, sets, repetitions, weight) VALUES (?, ?, ?, ?, ?)', [exerciseID, workoutID, sets, repetitions, weight], (err, result) => {
        if (err) {
            return res.status(500).json('Internal server error!');
        }

        res.status(200).json('Successfully created!');
    }); 
});

// egy felhasználó összes workout lekérdezése
router.get('/w_exercises/:workoutID', function (req, res) {
    const workoutID = req.params.workoutID;

    connection.query('SELECT * FROM w_exercises JOIN exercises USING (exerciseID) WHERE workoutID=?;', [workoutID], (err, result)=>
    {
        if (err) {
            return res.status(500).json('Internal server error!');
        }
    
        res.status(200).json(result);
    });

    
});



// egy felhasználó adott workout törlése
router.delete('/workouts/:workoutID', function (req, res) {
    const workoutID = req.params.workoutID;
    console.log(workoutID);
    connection.query('DELETE FROM workouts WHERE workoutID = ?', [workoutID], (err, result) => {
        if (err) {
            return res.status(500).json('Internal server error!');
        }
        console.log(result);
        res.status(200).json('Successfully deleted!');
    });
});

// egy felhasználó adott workout törlése
router.delete('/w_exercises/:workoutID', function (req, res) {
    const workoutID = req.params.workoutID;
    console.log(workoutID);
    connection.query('DELETE FROM w_exercises WHERE workoutID = ?', [workoutID], (err, result) => {
        if (err) {
            return res.status(500).json('Internal server error!');
        }
        console.log(result);
        res.status(200).json('Successfully deleted!');
    });
});

// egy felhasználó adott workout nevének szerkesztése
router.put('/workoutName/:workoutID', function (req, res) {
    const workoutID = req.params.workoutID;
    const wname = req.body.wname;

    connection.query('UPDATE workouts SET wname = ? WHERE workoutID = ?;', [wname, workoutID], (err, result) => {
        if (err) {
            return res.status(500).json('Internal server error!');
        }

        return res.status(200).json('Successfully updated!');        
    })
});


module.exports = router;