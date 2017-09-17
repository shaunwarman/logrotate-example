const Express = require('express');
const FS = require('fs');
const Logger = require('./logger');
const Path = require('path');

const app = Express();

const LOG_PATH = Path.join('/app/node/logs', 'applog.log');

const logger = new Logger({logPath: LOG_PATH});


app.get('/', (req, res) => {
  logger.log(`${Date.now()} - user: test router: /user`);
  res.send('Hello');
});

app.listen(8000, (err) => {
  logger.log('App is listening on port 8000');
});

process.on('uncaughtException', (err) => {
  setTimeout(() => {
    logger.log(`${Date.now()} - Error: ${JSON.stringify(err)}`);
    process.exit(1);
  }, 10000);
});

process.on('SIGINT', () => {
  logger.log('SIGINT sent to pid 1');
  logger.rotate();
});
