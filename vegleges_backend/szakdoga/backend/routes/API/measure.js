const express = require('express');
const connection = require('../../middleware/database.js');
const router = express.Router();

// aktuális időbélyeg meghatározása
const getCurrentTimestamp = () => {
    return new Date().toISOString().slice(0, 19).replace('T', ' ');
}

// egy felhasználó összes mérési adatának lekérdezése
router.get('/getMeasure/:id', (req, res) => {
    const id = req.params.id;
    

    connection.query('SELECT * FROM measure WHERE accountID = ? ORDER BY measureDate DESC', [id], (err, result) => {
        if (err) {
            return res.status(500).json('Internal server error!');
        }
        console.log(result);
        res.json(result);
    });
});

// egy felhasználó egy konkrét mérési adatinak lekérdezése
router.get('/getMeasure/:accountID/:measureID', (req, res) => {
    const accountID = req.params.accountID;
    const measureID = req.params.measureID;

    connection.query('SELECT * FROM measure WHERE accountID = ? AND measureID = ?', [accountID, measureID], (err, result) => {
        if (err) {
            return res.status(500).json('Internal server error!');
        }

        res.json(result);
    });
});

// új mérés felvétele
router.post('/newMeasure', (req, res) => {
    const { accountID , weight, bodyFatPercentage, caloricIntake, neck, shoulders, chest, leftBicep, rightBicep, leftForeArm, rightForeArm, upperAbs, waist, lowerAbs, hips, leftThigh, rightThigh, leftCalf, rightCalf } = req.body;

    const measureDate = getCurrentTimestamp();

    connection.query('INSERT INTO measure (measureID, accountID, weight, bodyFatPercentage, caloricIntake, neck, shoulders, chest, leftBicep, rightBicep, leftForeArm, rightForeArm, upperAbs, waist, lowerAbs, hips, leftThigh, rightThigh, leftCalf, rightCalf, measureDate) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);',[accountID , weight, bodyFatPercentage, caloricIntake, neck, shoulders, chest, leftBicep, rightBicep, leftForeArm, rightForeArm, upperAbs, waist, lowerAbs, hips, leftThigh, rightThigh, leftCalf, rightCalf, measureDate], (err,result)=>{
        if (err) {
            return res.status(500).json('Internal server error!');
        }

        res.status(200).json('Successfully created!');
    });
});


// egy konkrét mérés törlése
router.delete('/deleteMeasure/:measureID', function (req, res) {
    const measureID = req.params.measureID;

    connection.query('DELETE FROM measure WHERE measureID = ?', [measureID], (err, result) => {
        if (err) {
            return res.status(500).json('Internal server error!');
        }

        res.status(200).json('Successfully deleted!');
    });
});

// egy konrét mérés szerkesztése
router.put('/editMeasure/:id', function (req, res) {
    const measureID = req.params.id;
    
    const { weight, bodyFatPercentage, caloricIntake, neck, shoulders, chest, leftBicep, rightBicep, leftForeArm, rightForeArm, upperAbs, waist, lowerAbs, hips, leftThigh, rightThigh, leftCalf, rightCalf } = req.body;

    const measureDate = getCurrentTimestamp();

    connection.query('UPDATE measure SET weight = ?, bodyFatPercentage = ?, caloricIntake = ?, neck = ?, shoulders = ?, chest = ?, leftBicep = ?, rightBicep = ?, leftForeArm = ?, rightForeArm = ?, upperAbs = ?, waist = ?, lowerAbs = ?, hips = ?, leftThigh = ?, rightThigh = ?, leftCalf = ?, rightCalf = ?, measureDate = ? WHERE measure.measureID = ?', [weight, bodyFatPercentage, caloricIntake, neck, shoulders, chest, leftBicep, rightBicep, leftForeArm, rightForeArm, upperAbs, waist, lowerAbs, hips, leftThigh, rightThigh, leftCalf, rightCalf, measureDate, measureID], (err, result) => {
        if (err) {
            return res.status(500).json('Internal server error!');
        }

        res.status(200).json('Successfully updated!');
    });
});

module.exports = router;