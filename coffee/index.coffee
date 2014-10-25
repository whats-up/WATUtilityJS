

{EventEmitter} = require 'events'
# request = require('request')
_ = require 'underscore'
# path = require 'path'
# fs = require 'fs'
# exec =  require('child_process').exec
# async = require 'async'
csv = require("comma-separated-values")
jschardet = require('jschardet')
Iconv  = require('iconv').Iconv

module.exports =
  digitsCheck:(num)->
    unless typeof num is "number"
      return null
    num = String(num)
    arr = num.split('.')
    if arr.length > 1
      return arr[1].length
    else
      return 0
  digitsCheckWithArray:(arr)->
    max = undefined
    min = undefined
    first = true
    _.each arr,(o)=>
      if _.isNumber(o)
        i = @digitsCheck(o)
        if first
          min = i
          max = i
          first = false
        else
          min = i if min > i
          max = i if max < i
    return {max:max,min:min}
  textEncode:(text)->
    detectResult = jschardet.detect(text)
    iconv = new Iconv(detectResult.encoding, 'UTF-8//TRANSLIT//IGNORE')
    return iconv.convert(text).toString()

  objectToSql:(tablename,arr,option)->
    if not tablename
      throw new Error("not tableName")
    keys = _.keys(arr[0])
    sFileds = ''
    if option?.ignore is undefined or option?.ignore is false
      sql = "INSERT INTO #{tablename} "
    else
      sql = "INSERT IGNORE INTO #{tablename} "
    sql += "(#{keys.join(",")}) VALUES "
    first = true
    _.each arr ,(obj)->
      valArr = []
      _.each keys,(key)->
        valArr.push("'"+obj[key]+"'")
      str = "("+valArr.join(',')+")"
      if first
        sql += str
        first = false
      else
        sql +=","+str
    return sql
