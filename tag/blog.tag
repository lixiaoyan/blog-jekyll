<blog>
  <header class="header">
    <h1><a href="{ base }/">IntPtr</a></h1>
    <p>I'm here.</p>
    <nav class="nav">
      <ul>
        <li><a href="{ base }/links.html">Links</a></li>
        <li><a href="{ base }/books.html">Books</a></li>
        <li><a href="http://www.intptr.im/">About</a></li>
        <li><a href="{ base }/atom.xml">Feed</a></li>
      </ul>
    </nav>
  </header>
  <main class="main">
    <div class="list" if={ !current }>
      <post each={ posts } data={ this }></post>
    </div>
    <div class="entry" if={ current }>
      <post data={ current } entry={ true }></post>
    </div>
  </main>
  <footer class="footer">
    <p>Powered by Jekyll and Riot. Copyright &copy; 2014-2015 IntPtr.</p>
  </footer>

  this.base = base;
  this.posts = opts.posts;
  this.pages = opts.pages;
  this.current = null;

  home() {
    this.current = null;
    document.title = "IntPtr's Blog";
    this.update();
  }
  post(context, next) {
    this.current = this.posts.find(function(post) {
      return post.url == context.path;
    });
    if(this.current) {
      document.title = this.current.title + " - IntPtr's Blog";
      this.update();
    } else {
      next();
    }
  }
  page(context, next) {
    this.current = this.pages.find(function(page) {
      return page.url == context.path;
    });
    if(this.current) {
      document.title = this.current.title + " - IntPtr's Blog";
      this.update();
    } else {
      next();
    }
  }

  page.base(base);
  page("*", function(context, next) {
    window.scrollTo(0, 0);
    next();
  });
  page("/", this.home);
  page("/post/:id", this.post);
  page("*", this.page);
  page.start();
</blog>
