const express = require('express');
const path = require('path');
const router = express.Router();

// index.html route (nyitóoldal)
router.get('/', function (req, res) {
    res.sendFile(path.join(__dirname, '..', '..', '..', 'frontend', 'html', 'index.html'));
});

module.exports = router;