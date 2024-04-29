const express = require('express');
const path = require('path');
const router = express.Router();

// admin.js route
router.get('/admin.js', function (req, res) {
    res.sendFile(path.join(__dirname, '..', '..', '..', '..', 'frontend', 'js', 'admin', 'admin.js'));
});

module.exports = router;