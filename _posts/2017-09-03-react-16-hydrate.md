---
title: "React 16: ReactDOM.hydrate(...)"
---

> hydrate `[ˈhaɪdɹeɪt]`
  : *v.* 〔化〕进行水合反应；(使)成水合物；(使)水合

惯例先上 React 15 的入口文件实现。

``` javascript
const render = () => {
  const container = document.querySelector("#app");
  const element = <App />;
  ReactDOM.render(element, container);
};

render();
```

在 React 15 中，在客户端内，可以使用跟普通 client rendering 一致的 `ReactDOM.render(...)` 方法，基于 server rendering 输出的 html 来渲染 React 组件。

在 React 15 中，是否复用 server rendering 创建的 DOM 元素，是根据 `[data-reactroot]` 元素上的 `data-react-checksum` 属性与前端渲染内容的 checksum 是否一致这个条件来判断的[^1]。即：只有完全复用和完全不复用两种情况。

在 React 16 中，新增加了 `ReactDOM.hydrate(...)` 这个方法[^2]，把与 server rendering 相关的处理从 `ReactDOM.render(...)` 中拆分了出来。

不像 React 15 中的 `ReactDOM.render(...)`，`ReactDOM.hydrate(...)` 总是会去尝试复用 DOM，而不再关心 checksum 是否相等[^3]。

``` javascript
const render = () => {
const render = (hydrate = false) => {
  const container = document.querySelector("#app");
  const element = <App />;
  if (hydrate) {
    ReactDOM.hydrate(element, container);
  } else {
    ReactDOM.render(element, container);
  }
};

render();
render(true);
```
{:data-diff="-1;+2,5-7,9;-12;+13"}

添加 [React Hot Loader](https://github.com/gaearon/react-hot-loader) 支持：

``` javascript
const render = (hydrate = false) => {
  const container = document.querySelector("#app");
  const element = <App />;
  const element = (
    <AppContainer>
      <App />
    </AppContainer>
  );
  if (hydrate) {
    ReactDOM.hydrate(element, container);
  } else {
    ReactDOM.render(element, container);
  }
};

render(true);

if (module.hot) {
  module.hot.accept(() => {
    render();
  });
}
```
{:data-diff="-3;+4-8,17-22"}

完整代码：<https://gist.github.com/lixiaoyan/e341588023881aaa02da90e941b05761>。

[^1]: <https://github.com/facebook/react/blob/15-stable/src/renderers/dom/server/ReactMarkupChecksum.js#L40-L52>
[^2]: <https://github.com/facebook/react/pull/10339>
[^3]: 在 React 16 中，server rendering 输出的 html 已经不再包含 `data-reactid` 和 `data-react-checksum` 属性。
