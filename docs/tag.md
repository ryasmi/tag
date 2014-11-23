# Tag

```coffee
# Gets `tag`.
tag = require('poser/build/tag')

# Creates a new tag.
myTag = tag('myTag')

# Uses `myTag`.
myElement = myTag({id: 'mine'}, [
  tag.div({}, ['hello world'])
  'hello world'
])

# Shows `myElement`.
tag.addContent(document.body, [myElement])
```

## Short CoffeeScript
```coffee
# Gets `tag`.
tag = require 'poser/build/tag'

# Creates a new tag.
myTag = tag 'myTag'

# Uses `myTag`.
myElement = myTag {id: 'mine'}, [
  tag.div {}, ['hello world']
  'hello world'
])

# Shows `myElement`.
tag.addContent document.body, [myElement]
```
