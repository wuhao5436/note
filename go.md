
# go语言学习

## 程序概览
```go
/*
* 主包
*/
package main

import "fmt"

/*
* 主函数
*/
func main () {
    var a int  = 18
    var b string = 'xiaoli'
    fmt.Println("hello,world");
    fmt.Printf(format: "num:%d, 内存地址：%p， 类型是%T", a, &a, a);
}


```

## 变量定义
```go
// 1
var 变量名 变量类型 赋值符号 值 
// 2
int 和 string 类型的数据都是通过指针指向的，和js中的复杂数据类型类似
// 3.可以只申明不赋值 有默认值 int = 0  string = 空
var (
    name string
    age int
    attr string
)
// 4。 快捷定义, 类型推导
name2 := 'xiaoli'

```