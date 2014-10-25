watutility = require "../index"
_ = require 'underscore'

###
digitsCheck(number)
  数値の小数点以下の桁数を戻す
引数
  number:数値
戻り値
  小数点以下の桁数
###

# examples
console.log "digitsCheck examples"
console.log  watutility.digitsCheck(1) # 0
console.log  watutility.digitsCheck(2.34) # 2
console.log  watutility.digitsCheck(5.67890) # 4


###
digitsCheckWithArray(arr)
  arrayに格納された数値の情報を戻す
引数
  arr:数値が格納された配列
戻り値
  object:
  {max:(小数点以下の桁数の最大値),min:(小数点以下の桁数の最小値)}
###
console.log "digitsCheckWithArray examples"
# 引数が配列の場合
arr1 =[1.23, 4.5, 5.6789541215420]
console.log watutility.digitsCheckWithArray(arr1) # { max: 12, min: 1 }
# 引数がobjectの場合
console.log watutility.digitsCheckWithArray({
  name:"William"
  age:43
  score:75.45
})
# { max: 2, min: 0 }

# 配列の中の要素を指定する場合
arr2=[
  {name:"William", age:43,score:75.45}
  {name:"Robert", age:38,score:43.2345}
  {name:"Bellamy", age:25,score:63.2}
]
console.log watutility.digitsCheckWithArray(_.map arr2,(o)->o.score)
# { max: 4, min: 1 }
###
objectToSql(tablename,arr,option)
  arrayに格納したobjectをSQLのinsert文にコンバートする。
引数
  tablename:sqlのテーブル名
  arr objectを格納したarray
  option:
    ignore:[INSERT IGNORE INTO]にする場合はtrue
戻り値
  sql文字列
###

# examples
arr = [
  {name:"William", age:43}
  {name:"Robert", age:38}
]
console.log watutility.objectToSql('tastTable',arr,{ignore:true})
#INSERT IGNORE INTO tastTable (name,age) VALUES ('William','43'),('Robert','38')

console.log watutility.objectToSql('tastTable',arr,{ignore:false})
#INSERT INTO tastTable (name,age) VALUES ('William','43'),('Robert','38')
console.log "ok"
