/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */

for (var i = 0; i < 100; i++) {
  console.log("i: " + i);
}

function start(address, port) {
  var http = require('http');
  
  http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello World\n');
  }).listen(port, address);
  
  console.log('Server running at http://' + address + ':' + port + '/');
}

start("127.0.0.1", 8124);

