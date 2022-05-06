*Hello git!*

## 这个仓库主要用于记录Git的常规使用方法。
### 1.建立仓库
#### 1.1 建立云端仓库并同步到本地
##### step1. 首先在Github上建立一个空仓库   
##### step2. 将空仓库拉取到本地

从Github拉取仓库有两种手段，均只需一条命令，仓库会被自动下载到运行命令的路径下。

+ 使用HTTPS   
输入：

```
git clone https://github.com/hunter1992/某仓库名字.git
```
   
*!!!但HTTPS方法在每次fetch和push代码时都需要输入帐号和密码!!!*
+ 使用SSH
输入：   
```
git clone git@github.com:hunter1992/某仓库名字.git
```
与HTTPS方法相似，但只需要输入密码，相当于记住了用户名。
