// main is all program start

var cfg = require('./config')
var mysql = require('mysql')


var conn = mysql.createConnection({
    host: cfg.host,
    port: cfg.port,
    user: cfg.user,
    password: cfg.pass,
});

conn.connect(function (err) {
    if (err) {
        console.error('error connecting: ' + err.stack);
        return;
    }

    console.log('connected as id ' + connection.threadId);
});

conn.query('SELECT 1', function (err, results, fields) {
    if (error) {
        console.error('error exec: ' + err.stack);
        return;
    }

    console.log(results)
    console.log(fields)
});

conn.end();