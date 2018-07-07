var models = require('../models');

module.exports = {
  messages: {
    get: function (req, res) {
      res.send('hello');
      res.end(); 
    }, 
    // a function which handles a get request for all messages
    post: function (req, res) {
      res.send('POST request');
      res.end();
    } // a function which handles posting a message to the database
      
  },

  users: {
    // Ditto as above
    get: function (req, res) {},
    post: function (req, res) {}
  }
};

