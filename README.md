
## digitCheck(number)

```
console.log  watutility.digitCheck(1) # 0
console.log  watutility.digitCheck(2.34) # 2
console.log  watutility.digitCheck(5.67890) # 4

```

## digitCheckWithArray(arr)

### isArray
```
arr1 =[1.23, 4.5, 5.6789541215420]
console.log watutility.digitCheckWithArray(arr1)
# { max: 12, min: 1 }
```

### isObject
```
console.log watutility.digitCheckWithArray({
  name:"William"
  age:43
  score:75.45
})
# { max: 2, min: 0 }
```
### isObjectKey
```
arr2=[
  {name:"William", age:43,score:75.45}
  {name:"Robert", age:38,score:43.2345}
  {name:"Bellamy", age:25,score:63.2}
]
console.log watutility.digitCheckWithArray(_.map arr2,(o)->o.score)
# { max: 4, min: 1 }
```

## objectToSql(tablename,arr,option)

```
arr = [
  {name:"William", age:43}
  {name:"Robert", age:38}
]
console.log watutility.objectToSql('tastTable',arr)

# INSERT INTO tastTable (name,age) VALUES ('William','43'),('Robert','38')
```

```
console.log watutility.objectToSql('tastTable',arr,{ignore:true})
# INSERT IGNORE INTO tastTable (name,age) VALUES ('William','43'),('Robert','38')
```
