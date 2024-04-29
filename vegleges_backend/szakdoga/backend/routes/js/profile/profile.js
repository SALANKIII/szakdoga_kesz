const express = require('express');
const path = require('path');
const router = express.Router();

// adminProfile.js route
router.get('/profile.js', function (req, res) {
    res.sendFile(path.join(__dirname, '..', '..', '..', '..', 'frontend', 'js', 'profile', 'profile.js'));
});

module.exports = router;