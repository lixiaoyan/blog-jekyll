---
title: "React 16: Portal"
---

> 这大概会是一个系列，介绍升级 React 16 过程中会遇到的坑。

先来看一下 React 15 下的 Portal 实现。

``` javascript
class Portal extends React.Component {
  componentDidMount() {
    this.renderPortal();
  }

  componentDidUpdate() {
    this.renderPortal();
  }

  componentWillUnmount() {
    if (this.target) {
      ReactDOM.unmountComponentAtNode(this.target);
      this.target.remove();
    }
  }

  getTarget() {
    if (!this.target) {
      this.target = document.createElement("div");
      document.body.appendChild(this.target);
    }
    return this.target;
  }

  renderPortal() {
    ReactDOM.unstable_renderSubtreeIntoContainer(
      this,
      this.props.children,
      this.getTarget(),
    );
  }

  render() {
    return null;
  }
}
```

在 React 15 中，一般使用 `ReactDOM.unstable_renderSubtreeIntoContainer(...)` 去渲染 portal 内容，这样可以保证 portal 内的组件也能正常使用外部传递的 context。

上面这个实现在 React 16 下会碰到坑：在 `componentDidUpdate` 内无法拿到 portal 内组件的 `ref`。[^1]

在 React 16 中，`ReactDOM` 上新增加了一个方法 `createPortal(...)`，可以使用这个方法代替 `unstable_renderSubtreeIntoContainer(...)` 来渲染 portal。

``` javascript
class Portal extends React.Component {
  componentDidMount() {
    this.renderPortal();
  }

  componentDidUpdate() {
    this.renderPortal();
  }

  componentWillUnmount() {
    if (this.target) {
      ReactDOM.unmountComponentAtNode(this.target);
      this.target.remove();
    }
  }

  getTarget() {
    if (!this.target) {
      this.target = document.createElement("div");
      document.body.appendChild(this.target);
    }
    return this.target;
  }

  renderPortal() {
    ReactDOM.unstable_renderSubtreeIntoContainer(
      this,
      this.props.children,
      this.getTarget(),
    );
  }

  render() {
    return null;
    return ReactDOM.createPortal(
      this.props.children,
      this.getTarget(),
    );
  }
}
```
{:data-diff="-2-9,12,25-32,34;+35-38"}

如果需要支持 server rendering，还需要额外增加代码，确保不会在服务器端使用 DOM。

``` javascript
class Portal extends React.Component {
  state = { mounted: false };

  componentDidMount() {
    this.setState({ mounted: true });
  }

  componentWillUnmount() {
    if (this.target) {
      this.target.remove();
    }
  }

  getTarget() {
    if (!this.target) {
      this.target = document.createElement("div");
      document.body.appendChild(this.target);
    }
    return this.target;
  }

  render() {
    if (!this.state.mounted) {
      return null;
    }
    return ReactDOM.createPortal(
      this.props.children,
      this.getTarget(),
    );
  }
}
```
{:data-diff="+2-7,23-25"}

完整代码：<https://gist.github.com/lixiaoyan/daa71d4342e7a9b7ce45a7ff75339110>。

[^1]: <https://github.com/facebook/react/issues/9808>
