assert = (require 'chai').assert
watutility = require("../index")
_ = require "underscore"

describe "watutility_test", ->
  it 'digitCheck',()->
    d = watutility.digitCheck(1)
    assert.ok d is 0
    d = watutility.digitCheck(1.1)
    assert.ok d is 1
    d = watutility.digitCheck(1.111)
    assert.ok d is 3
    d = watutility.digitCheck(1.1110)
    assert.ok d is 3
    d = watutility.digitCheck('1.11')
    assert.ok d is null
  it 'digitCheckWithArray',(done)->
    arr1 =[1.23, 4.5, 5.6789541215420]
    da = watutility.digitCheckWithArray(arr1) #
    assert.deepEqual { max: 12, min: 1 } , da

    da = watutility.digitCheckWithArray({
      name:"William"
      age:43
      score:75.45
    })
    assert.deepEqual { max: 2, min: 0 } , da
    arr2=[
      {name:"William", age:43,score:75.45}
      {name:"Robert", age:38,score:43.2345}
      {name:"Bellamy", age:25,score:63.2}
    ]
    da = watutility.digitCheckWithArray(_.map arr2,(o)->o.score)
    assert.deepEqual { max: 4, min: 1 }, da
    done()
  it 'objectToSql',()->
    arr = [
      {name:"William", age:43}
      {name:"Robert", age:38}
    ]
    sql = watutility.objectToSql('tastTable',arr,{ignore:true})
    assert.equal sql , "INSERT IGNORE INTO tastTable (name,age) VALUES ('William','43'),('Robert','38')"
    sql　= watutility.objectToSql('tastTable',arr,{ignore:false})
    assert.equal sql , "INSERT INTO tastTable (name,age) VALUES ('William','43'),('Robert','38')"
