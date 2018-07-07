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
  
  connection.query('INSERT INTO user (username, currentRoomId) VALUES ("benny", 1)');

  connection.query('SELECT * FROM user', function (err, rows, fields) {
    if (err) { throw err; }
    
    console.log('The solution is: ', rows);
  });

  connection.end();
};

module.exports.establishDB = establishDB; 




// INSERT INTO rooms (name, createdBy, createdAt) VALUES
// (app.roomname, app.username, '2018-12-14 05:32:34')

// INSERT INTO user (username, currentRoomId) VALUES (app.username, app.roomname)

// INSERT INTO messages (text, createdById, roomId, createdAt) VALUES (message.text,  )