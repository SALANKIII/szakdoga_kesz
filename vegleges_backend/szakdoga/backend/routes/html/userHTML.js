const express = require('express');
const path = require('path');
const router = express.Router();
const checkRole = require('../../middleware/isAdmin.js');

// user.html route
router.get('/user.html', checkRole(0), function (req, res) {
    res.sendFile(path.join(__dirname, '..', '..', '..', 'frontend', 'html', 'user', 'user.html'));
});

module.exports = router;
