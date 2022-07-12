<!--
 * @Description:
 * @Autor: 吴浩舟
 * @Date: 2021-12-09 16:01:17
 * @LastEditors: 吴浩舟
 * @LastEditTime: 2022-07-12 11:52:21
-->

# npm 使用

## npm config

> npm 查询源命令

- npm 修改制定的源 `npm config set registry http://registry.npm.taobao.org/ `
- 设置过一次 npm config 后会在文件中出现 npmrc 文件，可以进行全局的配置。
- npm 恢复默认源 `npm config set registry https://registry.npmjs.org `
- 获取当前 npm 下载源 npm config get registry
- 修改当前 npm 源地址（例如切换到 taobao 源） npm config set registry https://registry.npm.taobao.org
- npm ls react 可以查看项目中使用的 react 的版本

### npm 查看包版本

- npm view {packageName} version 例如 npm view umi version

### .npmrc file

```
registry=http://registry.npm.taobao.org
@gome:registry=http://npm.qiaoqiaokeji.cn
@qiaoqiao:registry=http://maven.qiaoqiaokeji.cn/repository/npm-group
```

### 创建软链代替 npm link

```
ln -s /Users/wuhaozhou/project/test/qiaoqiao-pc-lib/lib lib
创建软连接
ln -s <源文件或目录> <目标文件或目录>
举个栗子：
当前路径创建link软链接引向 /root/pro/data.json
ln –s /root/pro/data.json link
```

# yarn 使用

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

###

```
 - packages
    - app-ui
    - app-lib
 - package.json
```

- 在外层使用`yarn` 可以直接帮里面的分包安装依赖

- 使用`yarn workspace app-ui dev` 可以直接在外层执行分包里面的代码
