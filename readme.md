*Hello git!*

# Git常规使用方法
## 1.建立并初始化仓库
### 1.1 建立云端仓库并同步到本地
（此时本地还没有仓库）
#### step1. 首先在Github上建立一个空仓库   
#### step2. 将云端仓库拉取到本地

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
### 1.2 建立本地仓库并推送到云端仓库
#### step1. 首先建立一个本地仓库   
+ ```git init``` 初始化仓库
+ ```git add .``` 提交所有文件到暂存区
+ ```git commit -m '提交说明'``` 提交暂存区的内容到本地仓库
#### step2. 建立一个云端仓库
#### step3. 连接本地仓库到云端仓库
使用HTTPS或者SSH中的一种地址都可以，执行：
```
git remote add origin https://github.com/hunter1992/某仓库名字.git
```
或：
```
git remote add origin git@github.com:hunter1992/某仓库名字.git
```
##### step3.1 如果出现错误
fatal: remote origin already exists，则执行以下语句：
```
git remote rm origin
```
后，再重新执行step3中的命令，即可成功。
#### step4. 推送本地仓库到云端仓库
```
git push origin master
```
如果出现错误：failed to push som refs to……，则先执行下面的语句，把云端仓库先拉下来，再push回去
```
gir push origin master
```
## 2.推送本地仓库的更改到云端仓库
做好1.2中的step1之后，运行
```
git push
```
## 3.拉取云端仓库的更改到本地仓库
在Github上对云端仓库内的文件进行修改之后，先查看本地仓库与云端仓库是否存在差异：
```
git status
```
若显示“您的分支落后...”，说明云端有更改还未同步到本地，执行：
```
git pull
```
