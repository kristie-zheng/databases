var establishDB = function() {
  var mysql = require('mysql');

  // Create a database connection and export it from this file.
  // You will need to connect with the user "root", no password,
  // and to the database "chat".
  console.log('wat');
  var connection = mysql.createConnection({
    host: 'localhost',
    user: 'student',
    password: 'student',
    database: 'chat'
  });

  connection.connect();

  connection.query('SELECT * FROM user', function (err, rows, fields) {
    if (err) { throw err; }

    console.log('The solution is: ', rows);
  });

  connection.end();
};

module.exports.establishDB = establishDB; 




