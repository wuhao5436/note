<!--
 * @Description: 
 * @Autor: 吴浩舟
 * @Date: 2022-07-25 16:00:27
 * @LastEditors: 吴浩舟
 * @LastEditTime: 2022-07-25 16:37:19
-->

## yarn work space

### 切换 yarn 版本

1. 需要更新[yarn](https://yarnpkg.com/getting-started/install)版本
   如提示

```
error Missing workspace name.
info Visit https://yarnpkg.com/en/docs/cli/workspace for documentation about this command.
// or
yarn workspaces list
yarn workspaces v1.22.19
error Invalid subcommand. Try "info, run"
```

需要输入 yarn 版本切换的命令

```
yarn set version berry
```

### 典型的workspace目录结构

```
 - packages
    - app-ui
        - package.json
        - tsconfig.json
    - app-lib
        - package.json
        - tsconfig.json
        - tsconfig.module.json
    - app-server
        - package.json
        - tsconfig.json
 - package.json
```

- 在外层使用`yarn` 可以直接帮里面的分包安装依赖

- 使用`yarn workspace app-ui dev` 可以直接在外层执行分包里面的代码

### app-lib 中package.json 的优先级比较
`module申明 > browser申明 > mian申明`

module申明|browser申明|mian申明
--|--|--
type="module"<br/>"module":"lib/index.module.js"|"browser":"es/browser.index.js"|"main":"es/index.js"

### workspace 在外层的作用
- 在外层直接内层结构的命令 
    - `yarn workspace app-lib build`
- 在外层统一存储内部项目的依赖，例如 app-ui 和 app-server 同时使用到lodash仓库，只需要安装一遍即可，存储在了'.yarn/cache'目录下
- 项目之间互相添加依赖
    - `yarn workspace app-ui add app-lib`


### conclusion
- 不同的目录是基于 tsconfig 配置不同打包到了不同的路径
- 最好还是通过引用打包完成后的组件 例如 app-server 中指定type="module" app-lib 直接打包成es6, npm run lib/index.js 来执行app-sercer的代码。
- [示例地址](https://github.com/wuhao5436/examples/tree/main/workspace)
