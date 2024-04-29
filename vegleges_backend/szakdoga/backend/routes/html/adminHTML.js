const express = require('express');
const path = require('path');
const router = express.Router();
const checkRole = require('../../middleware/isAdmin.js');

// admin.html route
router.get('/admin.html', checkRole(1), function (req, res) {
    res.sendFile(path.join(__dirname, '..', '..', '..', 'frontend', 'html', 'admin', 'admin.html'));
});

module.exports = router;
