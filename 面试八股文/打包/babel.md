<!--
 * @Description: 
 * @Autor: 吴浩舟
 * @Date: 2022-09-20 11:43:59
 * @LastEditors: 吴浩舟
 * @LastEditTime: 2022-09-20 14:30:57
-->
# babel

## babel的本质
babel 是一种 源码到源码的编译器

## babel的能力
- 国际化
- 自动生成文档
- 自动埋点
- linter（eslint）
- type checker
- 压缩混淆
等

## babel如何工作的
- babel 读取一种代码文件 通过 ast 语法数分析，生成另外一种文件

## babel插件
- babel 插件需要我们暴露一个function， function内返回visitor对象
```ts
module.exports = function({types:t}){

    return {
        visitor:{
            
        }
    }
    
}
```

## 文档
[babel详细文档](https://github.com/jamiebuilds/babel-handbook/blob/master/translations/zh-Hans/plugin-handbook.md)