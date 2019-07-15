**Redis安装**

**Windows安装**

<https://jingyan.baidu.com/article/0f5fb099045b056d8334ea97.html>

**Linux安装**

**安装Redis** 

官方网站：http://redis.io/ 

官方下载：http://redis.io/download 可以根据需要下载不同版本 

（域名后缀io属于国家域名，是british Indian Ocean territory，即英属印度洋领地）

**Redis安装** 

Redis是C语言开发，安装Redis需要先将官网下载的源码进行编译，编译依赖gcc环境，如果没有gcc环境，需要安装gcc 

![img](https://note.youdao.com/yws/public/resource/bfcc478547c920926146675e678e4a1f/xmlnote/OFFICE639A3BEBCA194A98850A6CF74C8DAFA3/6140)

**安装gcc**

gcc的安装很简单，首先要确保root登录，其次就是Linux要能连外网

yum -y install gcc automake autoconf libtool make





**注意：**运行yum时出现/var/run/yum.pid已被锁定,PID为xxxx的另一个程序正在运行的问题解决

rm -f /var/run/yum.pid



**安装Redis**

命令1： wget http://download.redis.io/releases/redis-4.0.1.tar.gz

命令2：**tar zxvf redis-4.0.1.tar.gz**

命令3： **cd redis-4.0.1**

命令4（编译）： make   或 **make MALLOC=libc**      如下图代表成功：

![img](https://note.youdao.com/yws/public/resource/bfcc478547c920926146675e678e4a1f/xmlnote/OFFICEFF162BC606A84C428CA958BBEB31E245/6141)

命令5：**make PREFIX=/usr/local/redis install**

（安装编译后的文件） 安装到指目录： 

**注意：**PREFIX必须大写、同时会自动为我们创建redis目录，并将结果安装此目录



命令6： **cd /usr/local/redis**  查看

命令7：查看bin目录下，如图：

![img](https://note.youdao.com/yws/public/resource/bfcc478547c920926146675e678e4a1f/xmlnote/OFFICEA277F785D8464F48BC0AC4060E57D952/6142)



**Redis启动**

**启动Redis服务**

 进入对应的安装目录 **/usr/local/redis**

 执行命令： **./bin/redis-server**

![img](https://note.youdao.com/yws/public/resource/bfcc478547c920926146675e678e4a1f/xmlnote/OFFICECDEFB5911DA347AAB2029E106EB149BE/6143)



**启动Redis客户端**

**进入Redis客服端**（Clone Session克隆一个窗口）：

 进入对应的安装目录 **cd  /usr/local/redis**

 执行命令： **./bin/redis-cli**

![img](https://note.youdao.com/yws/public/resource/bfcc478547c920926146675e678e4a1f/xmlnote/OFFICEE8BDE86BB4AF487CB80B365AC433C701/6144)

**启动Redis 客户端命令：**

   **redis-cli –h IP地址 –p 端口**

**退出客户端命令：Ctrl+C**    



检测是否服务端启动

启动 redis 客户端，打开终端并输入命令 **redis-cli**。该命令会连接本地的 redis 服务。



$redis-cli

redis 127.0.0.1:6379>

redis 127.0.0.1:6379> PING

PONG





在以上实例中我们连接到本地的 redis 服务并执行 **PING** 命令，该命令用于检测 redis 服务是否启动。



**Linux配置Redis**

Redis 的配置文件位于 Redis 安装目录下，文件名为 **redis.conf**(Windows 名为 redis.windows.conf)。





**配置Redis**

Redis端口号或启动有默认配置。但一般我们都会通过手动配置完成

回到根目录找到**解压文件中**的reids.conf

![img](https://note.youdao.com/yws/public/resource/bfcc478547c920926146675e678e4a1f/xmlnote/OFFICE6AC5313640324D1FB5F296DAFF051F6D/6145)

命令：**cp redis.conf /usr/local/redis** 将配置文件复制到安装文件的目录下

![img](https://note.youdao.com/yws/public/resource/bfcc478547c920926146675e678e4a1f/xmlnote/OFFICE76DF846835F24A1EA31ECCA6B704D8C8/6146)

**Redis配置至此全部完成** 


  