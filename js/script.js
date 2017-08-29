new Headroom(document.querySelector(".banner"), {
  offset: 200,
  tolerance: { up: 20, down: 10 },
}).init();

Array.from(document.querySelectorAll("pre > code")).forEach(code => {
  const pre = code.closest("pre");
  code.classList.add("code");
  code.innerHTML = code.innerHTML
    .replace(/\n$/, "")
    .split("\n")
    .map(item => `<div class="code-line"><code>${item}\n</code></div>`)
    .join("");
  if (pre.closest(".collapse")) {
    pre.classList.add("collapse");
  }
  const diff = pre.closest("[data-diff]");
  if (diff) {
    diff.dataset.diff.split(";").forEach(part => {
      const action = part.slice(0, 1) === "+" ? "add" : "delete";
      part
        .slice(1)
        .split(",")
        .forEach(range => {
          const [start, end = start] = range.split("-").map(Number);
          for (let i = start; i <= end; i++) {
            code.children[i - 1].classList.add(`code-diff-${action}`);
          }
        });
    });
  }
});
