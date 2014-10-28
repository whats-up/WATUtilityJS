(function() {
  var arr, arr1, arr2, watutility, _;

  watutility = require("../index");

  _ = require('underscore');


  /*
  digitCheck(number)
    数値の小数点以下の桁数を戻す
  引数
    number:数値
  戻り値
    小数点以下の桁数
   */

  console.log("digitCheck examples");

  console.log(watutility.digitCheck(1));

  console.log(watutility.digitCheck(2.34));

  console.log(watutility.digitCheck(5.67890));


  /*
  digitCheckWithArray(arr)
    arrayに格納された数値の情報を戻す
  引数
    arr:数値が格納された配列
  戻り値
    object:
    {max:(小数点以下の桁数の最大値),min:(小数点以下の桁数の最小値)}
   */

  console.log("digitCheckWithArray examples");

  arr1 = [1.23, 4.5, 5.6789541215420];

  console.log(watutility.digitCheckWithArray(arr1));

  console.log(watutility.digitCheckWithArray({
    name: "William",
    age: 43,
    score: 75.45
  }));

  arr2 = [
    {
      name: "William",
      age: 43,
      score: 75.45
    }, {
      name: "Robert",
      age: 38,
      score: 43.2345
    }, {
      name: "Bellamy",
      age: 25,
      score: 63.2
    }
  ];

  console.log(watutility.digitCheckWithArray(_.map(arr2, function(o) {
    return o.score;
  })));


  /*
  objectToSql(tablename,arr,option)
    arrayに格納したobjectをSQLのinsert文にコンバートする。
  引数
    tablename:sqlのテーブル名
    arr objectを格納したarray
    option:
      ignore:[INSERT IGNORE INTO]にする場合はtrue
  戻り値
    sql文字列
   */

  arr = [
    {
      name: "William",
      age: 43
    }, {
      name: "Robert",
      age: 38
    }
  ];

  console.log(watutility.objectToSql('tastTable', arr, {
    ignore: true
  }));

  console.log(watutility.objectToSql('tastTable', arr, {
    ignore: false
  }));

  console.log("ok");

}).call(this);
