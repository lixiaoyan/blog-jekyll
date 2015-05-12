(function() {
  Prism.languages.html = Prism.languages.markup;

  var ignorePages = [
    "/index.html",
    "/atom.xml",
    "/data/posts.json",
    "/data/pages.json"
  ];

  function json(req) {
    return req.json();
  }

  Promise.all([
    fetch(base + "/data/posts.json").then(json),
    fetch(base + "/data/pages.json").then(json)
  ]).then(function(data) {
    var posts = data[0];
    var pages = data[1];
    posts.forEach(function(post) {
      post.date = new Date(post.date);
      post.excerpt = post.content.split("\n\n", 1)[0];
    });
    pages = pages.filter(function(page) {
      if(ignorePages.indexOf(page.url) != -1) {
        return false;
      }
      if(page.url.startsWith("/file/")) {
        return false;
      }
      return true;
    });
    return {
      posts: posts,
      pages: pages
    };
  }).then(function(data) {
    riot.compile(function() {
      document.querySelector("#loader").remove();
      riot.mount("blog", data);
    });
  });

  document.body.addEventListener("click", function(e) {
    var ele = e.target;
    if(ele.classList.contains("footnote") || ele.classList.contains("reversefootnote")) {
      document.getElementById(ele.getAttribute("href").slice(1)).scrollIntoView();
    }
  });
})();
