((scope, document, Object, Array) ->
  tag = (->
    # Creates an alias.
    aliasFn = (alias) -> (element, value) ->
      element[alias] = value

    # Defines aliases for element attributes.
    alias =
      'class': aliasFn('className')
      'tag-show': (element, value) ->
        (element.style = element.style or {}).display = value

    # Calls a list of callbacks.
    callList = (list) -> (args...) ->
      list.map((callback) -> callback(args...))

    # Creates a tag.
    (tagName) ->
      # Creates an element.
      tag[tagName] = (options = {}, content = []) ->
        element = document.createElement(tagName)

        # Sets options on the element.
        Object.keys(options).forEach((option) ->
          setKey = alias[option] or aliasFn(option)

          # Creates a callback function if an array of callbacks are provided for an event.
          cbArray = option.indexOf('on') is 0 and options[option].constructor is Array
          setKey(element, if cbArray then callList(options[option]) else options[option])
        )

        # Adds content to the element.
        tag.addContent(element, content.map((obj) ->
          if obj.constructor isnt HTMLDivElement then document.createTextNode(obj)
          else obj
        ))
  )()

  # Adds content to an element.
  tag.addContent = (element, content = []) ->
    content.forEach(element.appendChild.bind(element))
    element

  # Generates tags.
  [
    'a','abbr','address','area','article','aside','audio','b','base','bdi','bdo','blockquote','body','br',
    'button','canvas','caption','cite','code','col','colgroup','command','datalist','dd','del','details',
    'dfn','div','dl','dt','em','embed','fieldset','figcaption','figure','footer','form','h1','h2','h3','h4',
    'h5','h6','head','header','hgroup','hr','html','i','iframe','img','input','ins','kbd','keygen','label',
    'legend','li','link','map','mark','menu','meta','meter','nav','noscript','object','ol','optgroup','option',
    'output','p','param','pre','progress','q','rp','rt','ruby','s','samp','script','section','select','small',
    'source','span','strong','style','sub','summary','sup','table','tbody','td','textarea','tfoot','th','thead',
    'time','title','tr','track','u','ul','var','video','wbr'
  ].map(tag)

  # Exposes tag via CommonJS, AMD, or a Global.
  if typeof scope.define is 'function'
      scope.define('tag', [], () -> tag)
  else scope.tag = tag
)(this, document, Object, Array)