var db = require('../db');

module.exports = {
  messages: {
    get: function (callback) {
      db.query('select * from messages', function(err, data) {
        if (err) {
          callback(err); 
        } else {
          console.log(data);
          callback(data);
        }      
      });
    }, 
    post: function () {} // a function which can be used to insert a message into the database
    //uses INSERT 
  },

  users: {
    // Ditto as above.
    get: function (callback) {
      db.query('select * from users', function(err, data) {
        if (err) {
          callback(err);
        } else {
          console.log(data);
          callback(data);
        }
      });
    },
    //none
    post: function () {}
    //adds the new user to the database
  }
};
