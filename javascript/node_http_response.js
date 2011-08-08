// $ node -v 
// v0.4.7

var http = require('http'),
    url  = require('url'),
    util = require('util');

var argumentURL = process.argv[2] || '';

http.get(url.parse(argumentURL), function (res) {
  res.on('data', function (chunk) {
    console.log(String(chunk));
  });
}).on('error', function (e) {
  console.error(e.message);
});
