const express = require('express');
const router = express.Router();

router.post('/logout', function(req, res) {
    res.clearCookie('userData');
    res.json({ success: true });
});

module.exports = router;