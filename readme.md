*Hello git!*



# Git常规使用方法

## 目录

- [建立并初始化仓库](#建立并初始化仓库)
  - [建立云端仓库并同步到本地仓库](#建立云端仓库并同步到本地仓库)
  - [建立本地仓库并推送到云端仓库](#建立本地仓库并推送到云端仓库)
- [推送本地仓库的更改到云端仓库](#推送本地仓库的更改到云端仓库)
- [拉取云端仓库的更改到本地仓库](#拉取云端仓库的更改到本地仓库)
- [版本回退](#版本回退)

## 建立并初始化仓库

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

### 建立本地仓库并推送到云端仓库

1. 首先建立一个本地仓库   

+ ```git init``` 初始化仓库

+ ```git add .``` 提交所有文件到暂存区

+ ```git commit -m '提交说明'``` 提交暂存区的内容到本地仓库

2. 建立一个云端仓库

3. 连接本地仓库到云端仓库

使用HTTPS或者SSH中的一种地址都可以，执行：

```
git remote add origin https://github.com/hunter1992/某仓库名字.git
```

或：

```
git remote add origin git@github.com:hunter1992/某仓库名字.git
```

3.1 如果出现错误

fatal: remote origin already exists，则执行以下语句：

```
git remote rm origin
```

后，再重新执行step3中的命令，即可成功。

4. 推送本地仓库到云端仓库

```
git push origin main
```

如果出现错误：failed to push som refs to……，则先执行下面的语句，把云端仓库先拉下来，再push回去

```
git push origin main
```

## 推送本地仓库的更改到云端仓库

做好1.2中的step1之后，运行

```
git push
```

## 拉取云端仓库的更改到本地仓库

在Github上对云端仓库内的文件进行修改之后，先查看本地仓库与云端仓库是否存在差异：

```
git status
```

若显示“您的分支落后...”，说明云端有更改还未同步到本地，执行：

```
git pull
```

## 版本回退

1. 查看版本变化的历史记录，知道回退到哪里

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
