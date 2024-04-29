const mysql = require('mysql');

// adatbázishoz kapcsolódás
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'szakdoga'
});

connection.connect((err) => {
    if (err) {
        console.log(`Hiba az adatbázis kapcsolódásakor: ${err}`);
        return;
    }

    console.log('Sikeres adatbázis kapcsolat!');
});

module.exports = connection;