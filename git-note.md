<!--
 * @Description: In User Settings Edit
 * @Author: luoshi
 * @Date: 2019-05-08 14:27:59
 * @LastEditTime: 2019-08-22 11:53:55
 * @LastEditors: Please set LastEditors
 -->

# git 和 svn 的比较
* svn subversion 集中化的版本控制系统， 有一台集中管理的服务器，所有客户端都和这个服务器交互，缺点如果服务器宕机或者数据丢失，文件没有备份的情况下风险较高
    * svn 的工作需要网络的联系，svn的保存逻辑是一组文件随着时间积累的变化
    * git 的工作可以在脱离网络的情况下commit ，也可以比较之前的某个版本，而这些版本信息都是保存在本地的，无需网络，git记录版本的逻辑，是每次commit是一次全量的快照。并保存这个快照的索引。
* git 分布式版本控制系统， 每一次的clone是一次对代码库的完整备份

# git 文件的三种状态
* git 文件有三种状态 committed staged modified
* 对应git的三个工作区 的概念 git仓库 暂存区 工作区

# git 文件的配置
* git 文件在根目录下会有一份配置 /etc/gitconfig 或 ~/.gitconfig
    * --global代表读写全局的问题
* git 在项目文件下理应也有一份配置 .git/cofnig
* 每一个级别覆盖上一个级别的配置 .git/config 会覆盖 /etc/gitconfig 的文件
* git config list 会检索每一级的配置，同名配置级别高的覆盖级别低的
* git config <key> 来检查git的某一项配置  git config user.name

#git 使用

## 首先配置你的用户信息
```
git config --global user.name 'john'
git config --global user.email john@163.com 
```
* git init 
* git clone
    * git clone 注意和 checkout 的区别，clone 是把整个git 项目的，所有版本，所有提交全部clone下来了，整个clone是一个完整的镜像，如果服务器的git 数据库丢失完全可以用本地的镜像恢复服务器的git项目
    * git clone https://github.com/libgit2/xxx 会在本地创建一个xxx的目录，如果你想自定义目录名字，在这条命令的后面添加 my_project 目录
* git clone 会自动创建远程仓库和本地仓库的关联关系
* 如果是自己本地创建的项目想和远程的git仓库关联起来，那么需要执行的命令是git push -u origin featureA ; -u 是--set-upstream 的简写，
    * 还有一种情况，如果git项目的地址发生了变化, 重新设定remote origin 的地址后，本地库和远程仓库丢失关联，这个时候需要重新设定一下关联 git branch --set-upstream-to=origin/master master ，让本地分支和远程分支再次关联起来。
* git push -u origin featureB:featureBee, 可以将本地featureB分支上的修改提交到远程featureBee上面

* gitignore
    * 所有空行或者以#开头的会被忽略，常见的是各种注释
    * 使用glob模式匹配（shell所使用的简化正则表达式）
    * 匹配模式以(/)开头，防止递归
    * 匹配模式以(/)结尾指定目录
    * !取反
        * glob 模式
        * (*) 匹配任意多个字符
        * (?) 只匹配一个字符
        * [0-9] 匹配0到9的数字
        * (**) 匹配任意中间目录
* git diff 可以查看未暂存的文件的变化
    * git diff --cached 可以查看已经暂存的文件的变化  
    * git difftool --tool-help 可以查看系统可以使用的git diff 插件   

* git commit 会启动默认文本编辑器
    * git config --global core.editor 可以指定编辑软件
    * git commit -a -m 'bug fix xxx' 在commit 加上-m可以省略git add 的操作，直接把跟踪的文件提交
* git 移除文件
    * rm 本地移除动作
    * 在git rm  本地工作区删除文件 + 缓存区删除文件，例如  git rm user.log 可以删除git对文件的跟踪
    * 如果不小心把日志文件，或者某一类很大的文件传上去了，仓库不需要，但是你的本地需要可以使用命令 git rm --cached user.log ，commit掉以后仓库的文件就会删除掉
    * git rm log/\*log 可以移除log目录下的所有文件
    * git rm \*.txt 可以移除所有已txt结尾的文件（包括文件夹下的）
    * -- -f 没搞懂是什么意思 --
* git 移动文件
    * git mv a.js b.js 等于下面几条命令
        * mv a.js b.js
        * git rm a.js
        * git add b.js
* git log 日志系统 很好很强大
    * git log -2 显示最近的两次提交
    * git log -p -2 现在最近两次提交每次的差异
    * git log --stat 查看提交的简略统计信息
    * git log --pretty=oneline 格式化提交日志还可以是short,full,fuller
    * 猜测，git log featureA..origin/featureA可以对比本地和远程的差异
    * 更加牛逼的是format工具 git log --pretty=format:"%h -%an"
    
        |选项 | 说明|
        |-|-|
        |%H  | commit 的完整hash|
        |%h  | commit 的简短hash|
        |%an  | 文件作者 |
        |%cn  | 文件提交者 |
        |%s  | 提交的commit信息 |
        |%s  | 提交的commit信息 |
        |%s  | 提交的commit信息 |
    * 一个很有用的筛选项 是-S  
        git log -Sfunction_name 可以列出添加或删除了某些字段的提交
        git log --committer wuhao 可以把wuhao的提交过滤出来
        --auther wuhao 可以把作者是wuhao的筛选出来
        --grep aaa 可以把提交信息中包含“aaa”的提交筛选出来

* 撤销操作
    * commit 信息的提交后如果想重置信息可以使用 git commit --amend
      * git commit --amend 可以重置最近一次的commit信息， 如果使用了bash编辑， i进入编辑，完成后然后esc进入命令模式`:wq` 保存并退出
      * [bash操作](https://www.cnblogs.com/sunshc/p/10875400.html)
    * 如果使用了git add . 把不想加入的文件也加入了，那么使用git reset HEAD aa.md 或者 git reset Head . 可以将aa.md 或全部文件 移出暂存区
    * reset 不加 --hard 命令并不危险
    * git checkout -- aa.md 可以将aa.md 的全部修改清空，回到上一次commit的状态，是一个危险操作
    * git checkout -- . 可以将全部修改都撤销
    * git commit 了以后进行回滚
        * git reset --hard <commit_id> 可以回到你想回到的某一个版本
        * git reset --hard HEAD^ 回到最新的一次提交
        * git reset HEAD^ 回到git add 钱

* git 远程操作
    * git remote -v 可以查看对应的远程仓库
    * git remote add aaa git@github.com:wuhao5436/happyPIg.git 可以添加远程仓库，并命名短名字aaa ，以后再推动的过程中可以 git push aaa master , 把本地的master分支推送到短名aaa, 对应的远程仓库（成功的前提是远程仓库没有其他人提交）
    * git remote show 可以列出类似于aaa这样的所有短名
    * git remote show aaa 可以查看该远程仓库的详细信息
    * git fetch 操作执行完成后，你会拥有那个远程仓库中所有分支的引用
    * git fetch 和 git pull 的区别。git fetch 会把远程的数据拉取到本地，但是不会自动合并，git pull 会自动合并
    * git clone 克隆一个远程仓库会自动把这个仓库设置为本地仓库的远程仓库，并默认以origin简写
    * git clone 命令会自动设置本地master分支跟踪克隆的远程仓库的master分支
    * git remote rename 去修改一个远程仓库的简写名 例如 git remote rename origindev dev
    * 如果不需要某个简写仓库了可以移除 git remote rm dev
    * git tag 可以打标签，一般是用来记录发布重要节点的，查看的时候git tag -l 'v1.8.5*'
    会把1.8.5开头相关的都列出来
    * 标签分为轻量标签lightweight和附注标签annotated
        * 轻量标签是一个一般不会改变的分支，它只是特定提交的引用
        * 附注标签（建议），是git数据库中的一个完整对象，可以被校验，可以添加很多打标者的信息， GPG验证
    * 创建标签 git tag -a 20190616 -m '20190616 md2 功能上线'
    * git show 20190616 可以查看这次打标的详细信息 作者的信息，日期，提交的内容
    * 打轻量级标签 git tag v1.2.3 不要提供-a -m -s 选项
    * 推送tag到远程仓库
        * git push origin v1.2.3
        * git push origin --tags 推送所有tag到远程origin
        * 删除tag ，在本地操作的过程中创建出一个40位hash串命名的tag名称，所有想象删除操作如何，根据规律git tag -h ,查询到了很多命令，有一个-d类似见过，运行 git tag -d 0wsdfs44dfs... 删除掉了这个tag
        * 删除远程的tag git push origin :refs/tags/20190616
    * 检出一个tag， tag不能像branch一样来回切换，想要某个tag的拷贝还是要创建一个新分支
    git checkout -b newpass v1.2.3
    * git 别名git别名的意思就是可以给比较长的命令写配置一个简写，这样操作起来更加方便
        ```
        git config --global alias.co checkout // 运行git co = 运行 git checkout
        git config --global alias.unstage 'reset HEAD --' //运行 git unstage file1 相当于运行 git reset HEAD -- file1
        // 可以尝试一下编辑我的那个 --no-verify 使用一下
        ```
    * 变基
        * 操作是这样的，首先你拉出A分支开发新功能，然后master分支有其他人提交（commit1，commit2），当要合并你的A分支到master的时候，可以选择变基，让提交记录变成一连串的记录，A分支上的提交位于commit1和commit2后面
        ```
            git checkout A
            git rebase origin/master
            git push -f A
        ```
        
* smartgit 试用过期以后文件破解目录  %APPDATA%\syntevo\SmartGit 删除 setting.xml 目文件
* git本地公钥生成命令 `$ ssh-keygen -t rsa -C "17xxxxx30@qq.com"` 一路next 下去
* git 提交禁止esLint 校验 git add . && git commit --no-verify -m "代码规范强制提交测试"
* [git 常见操作命令](http://www.ruanyifeng.com/blog/2015/12/git-cheat-sheet.html)
* [git 操作文档2](https://www.jianshu.com/p/65e9c799fe2c)
### git 删除本地分支和远程分支
* git branch -d 和 -D 的区别， 该分支已经完全和他的上游分支完成了merge的情况下可以使用 -d (--delete) 删除，-D (--delete --force)是在不检查merge的情况下直接删除强制删除分支
* 有些时候远程的分支删除了，本地显示远程分支还在，使用git fetch 无效，使用git remote prune origin 可以删除本地记录的远程分支
```
    git 删除本地分支
    git branch -D branchName 
 
    git 删除远程分支
    git branch -r -d origin/branchName
    git push origin :branchName

```


# github 使用
### github 访问慢的解决方案
1. 修改host
    * [打开Dns检测工具](http://tool.chinaz.com/dns/)
    * 查询响应最快的IP
    * 打开host路径 `C:\Windows\System32\drivers\etc\hosts`
    * 修改host 格式 `ip  域名`
        * 例如 `13.250.177.223  github.com`
* [参考文档](http://www.mamicode.com/info-detail-2942782.html)