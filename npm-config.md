# npm 使用
## npm config
> npm 查询源命令
* npm 修改制定的源 `npm config set registry http://registry.npm.taobao.org/ `
* 设置过一次npm config 后会在文件中出现npmrc文件，可以进行全局的配置。
* npm 恢复默认源 `npm config set registry https://registry.npmjs.org `
* 获取当前npm下载源 npm config get registry  
* 修改当前npm源地址（例如切换到taobao源） npm config set registry https://registry.npm.taobao.org
* npm ls react 可以查看项目中使用的react的版本

### npm 查看包版本
* npm view {packageName} version  例如 npm view umi version 

### .npmrc file
```
registry=http://registry.npm.taobao.org
@gome:registry=http://npm.qiaoqiaokeji.cn
@qiaoqiao:registry=http://maven.qiaoqiaokeji.cn/repository/npm-group
```

### 创建软链代替npm link
```
ln -s /Users/wuhaozhou/project/test/qiaoqiao-pc-lib/lib lib 
创建软连接
ln -s <源文件或目录> <目标文件或目录>
举个栗子：
当前路径创建link软链接引向 /root/pro/data.json
ln –s /root/pro/data.json link
```
