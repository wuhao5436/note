<!--
 * @Description: 
 * @Autor: 吴浩舟
 * @Date: 2022-09-03 16:16:58
 * @LastEditors: 吴浩舟
 * @LastEditTime: 2022-09-06 09:22:23
-->

# http (HyperText Transfer Protocal) 

## 组成
- 一条http 请求由请求行(request line)、请求头(header)、请求体组成(body)
- 一条http 请求由响应行(status line)、响应头(header)、响应体组成(body)
- 请求行包含：方法 + URL + http协议版本
- 相应行包含：http协议版本 + 状态码 + 描述语句


## 常见的http request header中的键值对
- content-type application/json 表示客户端将要传输的数据返回类型
- content-type multipart/form-data 用于表单数据传输
- content-type application/x-www-form-urlencoded 是默认制定的返回格式
- accept 指定接受的返回数据类型
- Authorization 授权状态
- content-length 请求正文的长度
- user-agent 
- cookies


## 常见的http response header中的键值对
- content-type 告诉浏览器的返回值类型 text/html 
- content-length 返回文件大小
- E-tag 表示请求文件的哈希版本标识
- expiress 响应的实效日期和时间
- connection  keep-alive 保持tcp连接状态


## 不同状态码表示的含义
 - 100 - 200 服务器收到请求正在处理中，正常处理返回200； 持续传输101
 - 200 - 300 请求已经被接受、处理
 - 300 - 400 300表示资源在其他地方 304使用浏览器缓存 
 - 400 - 500 大于400表示异常且不是服务器的错误 401 未授权 403 forbiden 禁止访问 404 not found 资源不存在
 - 500 表示服务器异常


## cookies
普通的ajax(json)请求和jsop跨域请求是默认携带cookie的，而cors跨域请求和fetch请求默认是不携带cookie的。因此，当我们的请求需要携带cookie时，我们就要对cors跨域请求和fetch请求这两中请求方式进行特殊配置处理。
```
    fetch 请求中 option 配置 credentials: 'include',
```
