templates = {}

function Template(){}
Template.prototype = {
  tag: function(tag, args){
    // decode the args
    var children = args[0];
    var attributes = args[1];

    // create the element
    var element = '<' + tag;
    // assign the attributes
    for( var attribute in attributes ){
      element += ' ' + attribute + '="' + attributes[attribute] + '"';
    }
    element += '>' + children + '</' + tag + '>';
    return element;
  }
}

function a(){return Template.prototype.tag('a', arguments);}
function b(){return Template.prototype.tag('b', arguments);}
function big(){return Template.prototype.tag('big', arguments);}
function body(){return Template.prototype.tag('body', arguments);}
function br(){return Template.prototype.tag('br',arguments);}
function dd(){return Template.prototype.tag('dd',arguments);}
function dl(){return Template.prototype.tag('dl',arguments);}
function dt(){return Template.prototype.tag('dt',arguments);}
function em(){return Template.prototype.tag('em', arguments);}
function embed(){return Template.prototype.tag('embed', arguments);}
function font(){return Template.prototype.tag('font', arguments);}
function form(){return Template.prototype.tag('form', arguments);}
function h1(){return Template.prototype.tag('h1', arguments);}
function h2(){return Template.prototype.tag('h2', arguments);}
function h3(){return Template.prototype.tag('h3', arguments);}
function h4(){return Template.prototype.tag('h4', arguments);}
function h5(){return Template.prototype.tag('h5', arguments);}
function h6(){return Template.prototype.tag('h6', arguments);}
function head(){return Template.prototype.tag('head', arguments);}
function hr(){return Template.prototype.tag('hr', arguments);}
function html(){return Template.prototype.tag('html', arguments);}
function i(){return Template.prototype.tag('i', arguments);}
function img(){return Template.prototype.tag('img', arguments);}
function input(){return Template.prototype.tag('input', arguments);}
function li(){return Template.prototype.tag('li', arguments);}
function link(){return Template.prototype.tag('link', arguments);}
function marquee(){return Template.prototype.tag('marquee', arguments);}
function menu(){return Template.prototype.tag('menu', arguments);}
function meta(){return Template.prototype.tag('meta', arguments);}
function ol(){return Template.prototype.tag('ol', arguments);}
function option(){return Template.prototype.tag('option', arguments);}
function p(){return Template.prototype.tag('p', arguments);}
function small(){return Template.prototype.tag('small', arguments);}
function strike(){return Template.prototype.tag('strike', arguments);}
function strong(){return Template.prototype.tag('strong', arguments);}
function table(){return Template.prototype.tag('table', arguments);}
function td(){return Template.prototype.tag('td', arguments);}
function th(){return Template.prototype.tag('th', arguments);}
function title(){return Template.prototype.tag('title', arguments);}
function tbody(){return Template.prototype.tag('tbody', arguments);}
function tfoot(){return Template.prototype.tag('tfoot', arguments);}
function thead(){return Template.prototype.tag('thead', arguments);}
function tr(){return Template.prototype.tag('tr', arguments);}
function tt(){return Template.prototype.tag('tt', arguments);}
function ul(){return Template.prototype.tag('ul', arguments);}

