<post>
  <article class="article">
    <header>
      <h1 if={ opts.entry }>{ opts.data.title }</h1>
      <h1 if={ !opts.entry }><a href={ base + opts.data.url }>{ opts.data.title }</a></h1>
    </header>
    <div class="content">
      <raw content={ opts.data.content } />
    </div>
    <footer if={ opts.data.date }>
      <span class="date">Posted on <time datetime="{ moment(opts.data.date).format('YYYY-MM-DD') }">{ moment(opts.data.date).format("MMMM Do, YYYY") }</time>.</span>
      <span class="link"><a href={ base + opts.data.url }>#permalink</a></span>
    </footer>
    <section class="comments" if={ opts.entry }></section>
  </article>

  this.base = base;

  this.on("updated", function() {
    if(opts.entry) {
      this.root.querySelector(".comments").innerHTML = "<a class=\"muut link\" href=\"https://muut.com/i/intptr/comments\" type=\"dynamic\">Comments</a>";
      $(this.root.querySelector(".muut")).muut();
    }
  });
</post>
