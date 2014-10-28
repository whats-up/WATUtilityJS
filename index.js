(function() {
  var Iconv, jschardet, _;

  _ = require('underscore');

  jschardet = require('jschardet');

  Iconv = require('iconv').Iconv;

  module.exports = {
    digitCheck: function(num) {
      var arr;
      if (typeof num !== "number") {
        return null;
      }
      num = String(num);
      arr = num.split('.');
      if (arr.length > 1) {
        return arr[1].length;
      } else {
        return 0;
      }
    },
    digitCheckWithArray: function(arr) {
      var first, max, min;
      max = void 0;
      min = void 0;
      first = true;
      _.each(arr, (function(_this) {
        return function(o) {
          var i;
          if (_.isNumber(o)) {
            i = _this.digitCheck(o);
            if (first) {
              min = i;
              max = i;
              return first = false;
            } else {
              if (min > i) {
                min = i;
              }
              if (max < i) {
                return max = i;
              }
            }
          }
        };
      })(this));
      return {
        max: max,
        min: min
      };
    },
    textEncode: function(text) {
      var detectResult, iconv;
      detectResult = jschardet.detect(text);
      iconv = new Iconv(detectResult.encoding, 'UTF-8//TRANSLIT//IGNORE');
      return iconv.convert(text).toString();
    },
    objectToSql: function(tablename, arr, option) {
      var first, keys, sFileds, sql;
      if (!tablename) {
        throw new Error("not tableName");
      }
      keys = _.keys(arr[0]);
      sFileds = '';
      if ((option != null ? option.ignore : void 0) === void 0 || (option != null ? option.ignore : void 0) === false) {
        sql = "INSERT INTO " + tablename + " ";
      } else {
        sql = "INSERT IGNORE INTO " + tablename + " ";
      }
      sql += "(" + (keys.join(",")) + ") VALUES ";
      first = true;
      _.each(arr, function(obj) {
        var str, valArr;
        valArr = [];
        _.each(keys, function(key) {
          return valArr.push("'" + obj[key] + "'");
        });
        str = "(" + valArr.join(',') + ")";
        if (first) {
          sql += str;
          return first = false;
        } else {
          return sql += "," + str;
        }
      });
      return sql;
    }
  };

}).call(this);
