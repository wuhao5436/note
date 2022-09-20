<!--
 * @Description: 
 * @Autor: 吴浩舟
 * @Date: 2022-09-20 10:55:54
 * @LastEditors: 吴浩舟
 * @LastEditTime: 2022-09-20 11:43:03
-->
# rollup

## rollup 打包原理
- 分析ast语法书合并文件

## rollup 打包流程
- 读取配置： 入口文件进入，构建bundle类
- 构建bundle实例： bundle在build的时候，从入口出发，每个文件构建一个module实例
- 语法分析，tree-shaking: 在module实例中进行ast语法书分析，和 tree-shaking分析
- 最后的合并： 完成分析后移出额外代码，解决变量重命名 然后generate生产代码
- 写入文件




## rollup 适用场景
-  

## tree-shaking
tree-shaking 可以有效减少文件打包的体积，只打包有效代码
```ts
// before tree-shaking
import utils from 'util'
utils.ajax('xxxx')
// after tree-shaking
import { ajax } from 'util'
ajax('xxxx')
```