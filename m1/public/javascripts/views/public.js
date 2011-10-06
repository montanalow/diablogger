if(! templates.public)
  templates.public = {};
if(! templates.layouts)
  templates.layouts = {};

templates.public.authorList = function(authors){
  return ul(
    authors.map(
      function(author){
        return li(
          a(author.pseudonym, {href:'/authors/'+author.id})
        );
      }
    ).join('')
  );
}

templates.public.index = function(){
  return body(
    p(a('create a diablog', {href: 'diablogs/create'})) +
    hr() +
    h3("Top Authors") +
    templates.public.authorList(data.top_authors)
  );
}

templates.layouts.public = function(content){
  return h1('Diablogger') + content;
}

