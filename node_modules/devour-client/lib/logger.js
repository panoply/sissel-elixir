'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Minilog = require('minilog');

var Logger = function () {
  function Logger() {
    _classCallCheck(this, Logger);
  }

  _createClass(Logger, null, [{
    key: 'debug',
    value: function debug(message) {
      this.instantiate().debug(message);
    }
  }, {
    key: 'disable',
    value: function disable() {
      Minilog.disable();
    }
  }, {
    key: 'enable',
    value: function enable() {
      Minilog.enable();
    }
  }, {
    key: 'error',
    value: function error(message) {
      this.instantiate().error(message);
    }
  }, {
    key: 'info',
    value: function info(message) {
      this.instantiate().info(message);
    }
  }, {
    key: 'instantiate',
    value: function instantiate() {
      if (!this.minilog) {
        this.minilog = Minilog('devour');
      }

      return this.minilog;
    }
  }, {
    key: 'warn',
    value: function warn(message) {
      this.instantiate().warn(message);
    }
  }]);

  return Logger;
}();

module.exports = Logger;