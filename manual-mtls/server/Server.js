const https = require('node:https');
const fs = require('fs');
const { Http2ServerRequest } = require('node:http2');

const options = {
 key: fs.readFileSync('./server.key'),
 cert: fs.readFileSync('./server.crt'),
 ca: [
   fs.readFileSync('./client.crt'),
 ],
 requestCert: true,
 passphrase: 'hello'
};

https.createServer(options, (req, res) => {
 res.writeHead(200, {});
 res.end('Hello CloudNativeSecurityCon!\n');
}).listen(3000, () => {
 console.log('Server is running on port 3000');
});
