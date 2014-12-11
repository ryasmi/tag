# Tag
```coffee
# Creates a new tag.
myTag = tag('myTag')

# Uses `myTag`.
myElement = myTag({id: 'mine'}, [
  tag.div('hello world')
  'hello world'
])

# Shows `myElement`.
tag.addContent(document.body, [myElement])

# Creates a new attribute alias called 'myalias'.
tag.aliases.myalias = (element, value, options) ->
  options.options
  options.content
  options.tagName
  element.display = value
```
