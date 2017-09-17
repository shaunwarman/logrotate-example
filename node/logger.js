const FS = require('fs');

class Logger {
  constructor(options) {
    this.logPath = options.logPath;

    this._createWriteStream();
  }

  log(log) {
    console.log(log);
    this.writeStream.write(`${log} \n`);
  }

  rotate() {
    this.writeStream.end();
    this._createWriteStream();
  }

  _createWriteStream() {
    this.writeStream = FS.createWriteStream(this.logPath);
  }
}

module.exports = Logger;
