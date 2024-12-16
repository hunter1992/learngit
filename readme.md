*Hello git!*

<a id="readme-top"></a>

# Git常规使用方法

## 目录

- [建立仓库并同步远近端](#建立仓库并同步远近端)
  - [建立云端仓库并同步到本地仓库](#建立云端仓库并同步到本地仓库)
  - [建立本地仓库并同步到云端仓库](#建立本地仓库并同步到云端仓库)
- [推送本地仓库的更改到云端仓库](#推送本地仓库的更改到云端仓库)
- [拉取云端仓库的更改到本地仓库](#拉取云端仓库的更改到本地仓库)
- [版本回退](#版本回退)
- [建立分支](#建立分支)

## 建立仓库并同步远近端

### 建立云端仓库并同步到本地仓库

（此时本地还没有仓库）

1. 首先在Github上建立一个空仓库   

2. 将云端仓库拉取到本地

从Github拉取仓库有两种手段，均只需一条命令，仓库会被自动下载到运行命令的路径下。

+ 使用HTTPS

```
git clone https://github.com/hunter1992/某仓库名字.git
```
   
*!!! 但HTTPS方法在每次fetch和push代码时都需要输入帐号和密码 !!!*
+ 使用SSH   
```
git clone git@github.com:hunter1992/某仓库名字.git
```
与HTTPS方法相似，但只需要输入密码，相当于记住了用户名。

<p align="right">
(<a href="#readme-top">back to top</a>)</p>

### 建立本地仓库并同步到云端仓库

1. 首先建立一个本地仓库   

+ ```git init``` 初始化仓库

+ ```git add .``` 提交所有文件到暂存区

+ ```git commit -m '提交说明'``` 提交暂存区的内容到本地仓库

2. 建立一个云端仓库

3. 连接本地仓库到云端仓库

使用HTTPS或者SSH中的一种地址都可以（建议使用SSH），执行：

```
git remote add origin https://github.com/hunter1992/某仓库名字.git
```

或：

```
git remote add origin git@github.com:hunter1992/某仓库名字.git
```

4. 如果step3中出现错误

fatal: remote origin already exists，则执行以下语句：

```
git remote rm origin
```

后，再重新执行step3中的命令，即可成功。

5. 推送本地仓库到云端仓库

```
git push origin main
```

如果出现错误：failed to push som refs to……，则先执行下面的语句，把云端仓库先拉下来，再push回去

```
git push origin main
```

<p align="right">
(<a href="#readme-top">back to top</a>)</p>

## 推送本地仓库的更改到云端仓库

做好1.2中的step1之后，运行

```
git push
```

<p align="right">
(<a href="#readme-top">back to top</a>)</p>

## 拉取云端仓库的更改到本地仓库

在Github上对云端仓库内的文件进行修改之后，先查看本地仓库与云端仓库是否存在差异：

```
git status
```

若显示“您的分支落后...”，说明云端有更改还未同步到本地，执行：

```
git pull
```

<p align="right">
(<a href="#readme-top">back to top</a>)</p>

## 版本回退

1. 确认回退位置

查看版本变化的历史记录来知道回退到哪里，查看历史记录需运行如下命令：

```
git log
```

可以打开“--pretty=oneline”开关，只将commit id显示在一行内。

2. 开始回退

Git使用HEAD指针指向当前版本，回退本质是在操作HEAD指针。

HEAD^表示上一个版本，依次类推，但当需要退回的版本代数比较多时，写成HEAD～100。

回退到上一版运行：

```
git reset --hard HEAD^
```

2.1 如果回退后又后悔了，想回到新的版本

先找到之前提交本地仓库时，每个版本的commit id：

```
git reflog
```

找到你想前往的版本，记住commit id的一部分，前往：

```
git reset --hard COMMIT ID
```

<p align="right">
(<a href="#readme-top">back to top</a>)</p>

## 建立分支

在项目进行到一定的规模后，如果要加入一个较大的功能，假如这个功能需要大面积地使用你的项目中已有的设施，故而很难单独出一个小系统用来调试。此时在已有规模上直接添加的话，出现错误后需要花极大的精力打扫。

这时候就非常有必要使用Git的分支功能，在已有主分支的基础上分裂出一个当前分支，用于开发、调试新功能，确认无误后合并进主分支即满足了前述需求。建立、合并分支的过程中涉及到的命令主要有：

1. 创建新的分支

```
git switch -c <new-branch-name>
```

上面这条命令相当于下面两个命令的依次作用的效果：

```
git branch <new-branch-name>
git switch <new-branch-name>
```

2. 查看当前分支

确认一下当前的开发内容会进入正确的分支中。

```
git branch
```

3. 向当前分支提交内容

```
git add <file-name>
git commit -m "infos"
```

4. 完成新任务的开发后，切换回主分支

```
git switch master
```

可以再使用git branch命令，确认一下回到了主分支。

5. 将开发分支的内容合并到主分支

```
git merge <branch-name>
```

6. 确认更新后的主分支无误后，删除原先新开的分支

```
git branch -d <branch-name>
```

<p align="right">
(<a href="#readme-top">back to top</a>)</p>
