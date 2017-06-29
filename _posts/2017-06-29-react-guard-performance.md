---
title: "React Guard 性能测试"
---

使用知乎新版前端项目在 `NODE_ENV=development` 环境下测试得到的数据。  
使用了自己 fork 的 [react-guard](https://github.com/lixiaoyan/react-guard)。（修复了 stateless components 的相关问题）

| Case (ms / request) | Time (avg) | Time (min) | Time (max) |
| ------------------- | ---------: | ---------: | ---------: |
| React               | 90.39      | 123.37     | 62.65      |
| React + React Guard | 97.48      | 139.09     | 68.69      |
|                     | +7.84%     | +12.74%    | +9.64%     |

### 完整数据

#### React

```
render: 84.970ms
render: 84.916ms
render: 84.943ms
render: 118.300ms
render: 67.221ms
render: 69.608ms
render: 114.675ms
render: 82.260ms
render: 84.776ms
render: 87.542ms
render: 62.651ms
render: 67.413ms
render: 118.061ms
render: 79.945ms
render: 79.473ms
render: 90.955ms
render: 76.818ms
render: 66.268ms
render: 110.653ms
render: 79.091ms
render: 78.067ms
render: 83.752ms
render: 72.173ms
render: 78.040ms
render: 114.261ms
render: 74.924ms
render: 70.372ms
render: 86.347ms
render: 78.466ms
render: 78.007ms
render: 107.640ms
render: 81.664ms
render: 77.356ms
render: 94.622ms
render: 94.270ms
render: 114.047ms
render: 80.174ms
render: 66.405ms
render: 83.968ms
render: 99.189ms
render: 97.121ms
render: 94.939ms
render: 75.695ms
render: 92.257ms
render: 86.966ms
render: 85.331ms
render: 112.490ms
render: 87.230ms
render: 88.452ms
render: 97.680ms
render: 74.220ms
render: 120.699ms
render: 86.606ms
render: 84.136ms
render: 89.672ms
render: 73.250ms
render: 121.281ms
render: 87.570ms
render: 90.869ms
render: 94.011ms
render: 91.837ms
render: 114.843ms
render: 90.066ms
render: 81.374ms
render: 78.660ms
render: 87.602ms
render: 119.521ms
render: 82.274ms
render: 91.627ms
render: 91.755ms
render: 74.354ms
render: 120.123ms
render: 84.767ms
render: 82.194ms
render: 98.206ms
render: 87.207ms
render: 115.115ms
render: 83.282ms
render: 86.179ms
render: 96.129ms
render: 89.905ms
render: 117.688ms
render: 74.412ms
render: 89.289ms
render: 91.642ms
render: 102.228ms
render: 120.341ms
render: 100.309ms
render: 87.123ms
render: 88.287ms
render: 93.693ms
render: 117.933ms
render: 85.633ms
render: 87.326ms
render: 91.391ms
render: 74.532ms
render: 123.373ms
render: 91.757ms
render: 87.258ms
render: 102.963ms
```

#### React + React Guard

```
render: 95.319ms
render: 106.289ms
render: 122.210ms
render: 88.520ms
render: 83.583ms
render: 91.901ms
render: 123.968ms
render: 90.673ms
render: 90.496ms
render: 98.265ms
render: 123.814ms
render: 89.525ms
render: 97.306ms
render: 94.848ms
render: 121.663ms
render: 68.685ms
render: 81.993ms
render: 92.764ms
render: 127.916ms
render: 84.133ms
render: 81.996ms
render: 95.356ms
render: 118.332ms
render: 89.911ms
render: 74.213ms
render: 96.045ms
render: 114.836ms
render: 88.282ms
render: 72.812ms
render: 102.830ms
render: 126.896ms
render: 75.593ms
render: 94.025ms
render: 87.243ms
render: 121.108ms
render: 85.739ms
render: 94.239ms
render: 97.319ms
render: 119.011ms
render: 92.899ms
render: 71.326ms
render: 92.313ms
render: 126.709ms
render: 84.222ms
render: 101.023ms
render: 79.193ms
render: 120.799ms
render: 90.827ms
render: 70.348ms
render: 97.640ms
render: 125.726ms
render: 75.344ms
render: 73.627ms
render: 96.963ms
render: 121.439ms
render: 96.768ms
render: 96.060ms
render: 100.025ms
render: 128.247ms
render: 91.471ms
render: 88.443ms
render: 89.958ms
render: 120.814ms
render: 88.931ms
render: 72.044ms
render: 95.213ms
render: 126.255ms
render: 96.286ms
render: 84.496ms
render: 100.738ms
render: 119.326ms
render: 95.707ms
render: 72.004ms
render: 96.360ms
render: 130.705ms
render: 94.431ms
render: 94.046ms
render: 93.452ms
render: 139.095ms
render: 93.239ms
render: 75.257ms
render: 99.708ms
render: 129.030ms
render: 86.173ms
render: 94.030ms
render: 81.275ms
render: 121.713ms
render: 87.211ms
render: 86.065ms
render: 87.391ms
render: 110.232ms
render: 89.051ms
render: 95.642ms
render: 96.301ms
render: 116.466ms
render: 69.533ms
render: 96.801ms
render: 82.054ms
render: 119.334ms
render: 90.885ms
```
