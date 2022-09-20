<!--
 * @Description: 
 * @Autor: 吴浩舟
 * @Date: 2022-09-20 10:37:21
 * @LastEditors: 吴浩舟
 * @LastEditTime: 2022-09-20 10:57:30
-->

# webpack
## webpack 打包流程

- 初始化参数： 读取config文件和shell携带的参数完成一个compiler的构建
- 加载依赖： compiler对象加载各种所需要的插件和loader
- 模块解析： 根据配置的entry进入文件，并且根据文件的引用关系使用loader对文件进行编译
- 组织chunk： 形成一个个chunk文件
- 写入文件系统

## webpack 的适用场景
- 打包生产环境代码

