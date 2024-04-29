const express = require('express');
const path = require('path');
const router = express.Router();

// logout.js route
router.get('/logout.js', function (req, res) {
    res.sendFile(path.join(__dirname, '..', '..', '..', 'frontend', 'js', 'logout.js'));
});

module.exports = router;