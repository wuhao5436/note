<!--
 * @Description: 
 * @Autor: 吴浩舟
 * @Date: 2022-08-30 10:34:17
 * @LastEditors: 吴浩舟
 * @LastEditTime: 2022-09-11 17:08:28
-->
* 创建文件 touch a.log

### 文件压缩

- 添加压缩文件 tar -zcvf 文件名.tar.gz 文件夹
- 解压缩文件 tar -xzvf 文件名.tar.gz
- 压缩文件  tar -cf 要压缩的文件名.tar *
- 解压文件 tar zxvf 文件名.tgz  -C /指定路径
### 文件上传
- scp 文件名称 root@101.11.11.111:opt/anywhere/anywehwe


### 目录
- 查询当前目录 pwd


### 筛选
- `grep` 跟在 `|` 的后面，表示一种筛选，例如 ls | grep linux ; netstat | grep localhost