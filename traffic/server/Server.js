const http = require('node:http');
const fs = require('fs');
const { Http2ServerRequest } = require('node:http2');

const options = {
};

http.createServer(options, (req, res) => {
 res.writeHead(200, {});
 res.end('Hello KCD Munich!\n');
}).listen(3000, () => {
 console.log('Server is running on port 3000');
});
