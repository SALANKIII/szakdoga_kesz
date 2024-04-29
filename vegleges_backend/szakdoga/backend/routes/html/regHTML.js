const express = require('express');
const path = require('path');
const router = express.Router();

// reg.html route
router.get('/reg.html', function (req, res) {
    res.sendFile(path.join(__dirname, '..', '..', '..', 'frontend', 'html', 'reg.html'));
});

module.exports = router;