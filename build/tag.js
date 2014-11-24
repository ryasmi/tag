var __slice = [].slice;

(function(scope, document, Object, Array) {
  var alias, aliasFn, callList, tag;
  aliasFn = function(alias) {
    return function(element, value) {
      return element[alias] = value;
    };
  };
  alias = {
    'class': aliasFn('className'),
    'tag-show': function(element, value) {
      return (element.style = element.style || {}).display = value;
    }
  };
  callList = function(list) {
    return function() {
      var args;
      args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      return list.map(function(callback) {
        return callback.apply(null, args);
      });
    };
  };
  tag = function(tagName) {
    return tag[tagName] = function(options, content) {
      var element;
      if (options == null) {
        options = {};
      }
      if (content == null) {
        content = [];
      }
      if ((options != null) && (typeof options !== 'object' || Array.isArray(options))) {
        content = options || [];
        options = {};
      }
      content = Array.isArray(content) ? content : [content];
      element = document.createElement(tagName);
      Object.keys(options).forEach(function(option) {
        var cbArray, setKey;
        setKey = alias[option] || aliasFn(option);
        cbArray = option.indexOf('on') === 0 && options[option].constructor === Array;
        return setKey(element, cbArray ? callList(options[option]) : options[option]);
      });
      return tag.addContent(element, content.map(function(obj) {
        if (typeof obj !== 'object') {
          return document.createTextNode(obj);
        } else {
          return obj;
        }
      }));
    };
  };
  tag.addContent = function(element, content) {
    if (content == null) {
      content = [];
    }
    content.forEach(element.appendChild.bind(element));
    return element;
  };
  ['a', 'abbr', 'address', 'area', 'article', 'aside', 'audio', 'b', 'base', 'bdi', 'bdo', 'blockquote', 'body', 'br', 'button', 'canvas', 'caption', 'cite', 'code', 'col', 'colgroup', 'command', 'datalist', 'dd', 'del', 'details', 'dfn', 'div', 'dl', 'dt', 'em', 'embed', 'fieldset', 'figcaption', 'figure', 'footer', 'form', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'head', 'header', 'hgroup', 'hr', 'html', 'i', 'iframe', 'img', 'input', 'ins', 'kbd', 'keygen', 'label', 'legend', 'li', 'link', 'map', 'mark', 'menu', 'meta', 'meter', 'nav', 'noscript', 'object', 'ol', 'optgroup', 'option', 'output', 'p', 'param', 'pre', 'progress', 'q', 'rp', 'rt', 'ruby', 's', 'samp', 'script', 'section', 'select', 'small', 'source', 'span', 'strong', 'style', 'sub', 'summary', 'sup', 'table', 'tbody', 'td', 'textarea', 'tfoot', 'th', 'thead', 'time', 'title', 'tr', 'track', 'u', 'ul', 'var', 'video', 'wbr'].map(tag);
  if (typeof scope.define === 'function') {
    return scope.define('tag', [], function() {
      return tag;
    });
  } else {
    return scope.tag = tag;
  }
})(this, document, Object, Array);

//# sourceMappingURL=maps/tag.js.map