const multer = require('multer');

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'images/');
    },
    filename: function (req, file, cb) {
        const date = new Date();
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');

        const originalname = file.originalname;
        const filename = `${year}_${month}_${day}_${originalname}`;

        cb(null, filename);
    }
});

const upload = multer({ storage: storage });

module.exports = upload;