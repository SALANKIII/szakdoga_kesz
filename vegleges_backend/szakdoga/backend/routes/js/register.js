const express = require('express');
const path = require('path');
const router = express.Router();

// register.js route
router.get('/register.js', function (req, res) {
    res.sendFile(path.join(__dirname, '..', '..', '..', 'frontend', 'js', 'register.js'));
});

module.exports = router;