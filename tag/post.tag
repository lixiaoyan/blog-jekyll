<post>
  <article class="article">
    <header>
      <h1 if={ opts.entry }>{ opts.data.title }</h1>
      <h1 if={ !opts.entry }><a href={ base + opts.data.url }>{ opts.data.title }</a></h1>
    </header>
    <div class="content">
      <raw content={ opts.data.content } />
    </div>
  </article>

  this.base = base;
</post>
