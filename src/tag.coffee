module Tag {
  interface AliasOptions {
    options: Object,
    content: array<Object>,
    tagName: string
  };
 
  export function tag(name: string) {
    tag[name] = (options: Object = {}, arg2: any = []) => {
      var content: Array<Object>;
      var element: HTMLElement;
      
      if (options != null && (typeof options !== 'object' || Array.isArray(options))) {
        arg2 = options || [];
        options = {};
      }
      
      if (!Array.isArray(arg2)) {
        arg2 = [arg2];
      }
      
      content = arg2;
      element = document.createElement(name);
 
      // Sets options on the element.
      Object.keys(options).forEach((option: string) => {
        var setKey = tag.aliases[option] || tag.alias(option);
 
        // Creates a callback function if an array of callbacks are provided for an event.
        var callbackArray = option.indexOf('on') is 0 && options[option].constructor is Array;
        var keyValue = callbackArray ? callList(options[option]) : options[option];
        setKey(element, keyValue, {
          options: options,
          content: content,
          tagName: name
        });
      });
 
      // Adds content to the element.
      tag.addContent(element, content.map((obj: Object) => {
        return typeof obj !== 'object' ? document.createTextNode(obj) : obj;
      }));
    }
  };
 
  // Creates a function that calls a list of functions.
  tag.callList = (array<Function> list) => {
    return (...args: any[]) => {
      return list.map((callback: Function) => {
        return callback.apply(this, args);
      });
    };
  };
 
  // Creates an alias.
  tag.alias = (string: alias) => {
    // Assigns the value to the alias on the element.
    return (element: HTMLElement, value: any, options: AliasOptions) => {
      element[alias] = value;
    };
  };
 
  // Defines aliases for attributes.
  tag.aliases = {
    'class': tag.alias('className'),
    'tag-show': (element: HTMLElement, value: any) => {
      (element.style = element.style || {}).display = value
    }
  };
 
  // Adds content to an element.
  tag.addContent = (element: HTMLElement, content: Array<HTMLElement> = []) => {
    content.forEach(element.appendChild.bind(element))
    return element;
  };
 
  // Defines the HTML tags on the tag function.
  var htmlTags: Array<string> = [
    'a','abbr','address','area','article','aside','audio','b','base','bdi','bdo','blockquote','body','br', 'button','canvas','caption','cite','code','col','colgroup','command','datalist','dd','del','details', 'dfn','div','dl','dt','em','embed','fieldset','figcaption','figure','footer','form','h1','h2','h3','h4','h5','h6','head','header','hgroup','hr','html','i','iframe','img','input','ins','kbd','keygen','label','legend','li','link','map','mark','menu','meta','meter','nav','noscript','object','ol','optgroup','option','output','p','param','pre','progress','q','rp','rt','ruby','s','samp','script','section','select','small','source','span','strong','style','sub','summary','sup','table','tbody','td','textarea','tfoot','th','thead','time','title','tr','track','u','ul','var','video','wbr'
  ];
  htmlTags.map(tag);
};
