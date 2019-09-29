# idea使用指南--基础配置：

视频链接：<https://www.bilibili.com/video/av21735428/?p=1>

## idea安装：

1. 快捷方式create destop shortcut：

​	32-bit launcher jdk1.7

​	64-bit launcher jdk1.8

2. create associations

   不建议勾选，勾选之后启动打开这些文件需要启动idea

## 基本配置

1. 设置等宽字体：

   editor -- font -- 勾选 show only monospaced fonts

2. 控制台设置：

   editor  -- color scheme -- console font 

3. 指定文件编码方式：

   editor -- file encodings

   注意：属性文件后面勾选Transparen navive-to-ascii conversion

   如果不勾选在配置文件中的中文会显示为ASCII码，而不是中文

4. 滚动鼠标滚轮改变字体大小

   editor -- general

   勾选 Change font size (Zoom) with Ctrl+Mouse Wheel

5. 显示行号

   editor -- general -- appearance

   show line numbers

6. 方法之间有横线作为间隔

   editor -- general -- appearance

   show method separators

7. 格式化代码

   editor -- code style -- java -- blank lines

   keep maximum blank lines 都设置成1

8. 自动提示

   editor -- general -- codecompletion

9. 自动导包

   editor -- general -- auto import

   java 下设置：insert imports pastes:all

   勾选：add unambiguous imports on the fly

   勾选：optimize imports on the fly (for current project)

10. 鼠标悬浮于类上，显示文档提示：

    editor -- general

    other下：

    show quick documentation on mouse move

11. 设置同时打开多个文件且分行显示？

    Window→Editor Tabs→Tabs Placement→ 取消：Show Tabs in Single Row

     自行设置打开文件窗口数

    configure -- editor -- general -- editor tabs -- tab limit ：可以设置为30个

12. 隐藏参数前的字符：

    settings -- editor -- appearance -- 不勾选show parameter name hints

13. 解决 xml 文件空行部分黄色背景的办法很简单。

    鼠标放在 xml 文件中（就是打开对应的xml 文件，不需要鼠标选定），然后按下

    ALT+ENTER 选择 un-inject Language/refence 即可。

14. 

    

    

<hr/>

### 其他设置：

6、关闭自动保存，打开 Settings-General，反选“Synchronize file on frame activation”和“Save files on frame deactivation”。同时修改未保存的显示星号，打开 Settings-Editor->Editor Tabs， 勾上“Mark modified tabs with asterisk”。 

7、开启序列化 serialVersionUID 检测，打开 Settings->Inspections， 

10、隐藏没用到的文件，比如 IDEA 的项目配置文件（*.iml 和*.idea），打开 Settings-File Types，ignore files and folders 加入要隐藏的文件后缀。 

​	*.iml;.idea;.myeclipse;.project.mymetadata;.settings;

11、代码提示不区分大小写，打开 Settings->Editor->Code Completion，将” Case sensitive completion”设置为 None。 



关闭浏览器缓存

打开谷歌浏览器，打开F12的Network选项栏，然后勾选【✅】Disable cache 。

#### 自动编译：

具体步骤：同时按住 Ctrl + Shift + Alt + /  然后进入Registry ，勾选自动编译并调整延时参数。

- compiler.automake.allow.when.app.running   -> 自动编译
- compile.document.save.trigger.delay  -> 自动更新文件

PS：网上极少有人提到compile.document.save.trigger.delay 它主要是针对静态文件如JS CSS的更新，将延迟时间减少后，直接按F5刷新页面就能看到效果！

## 快捷键使用：

Alt + enter : 1）导包、2）给对象创建变量

注释：Ctrl + / 单行注释

​	Ctrl + shift + / 多行注释

Ctrl + Alt + T ：添加try catch

Alt + insert ：添加get/set方法

格式化代码：Ctrl + Alt + L



## 代码模板：

1.添加类注释模板

settings -- editor -- file and code templates -- include -- file header 

```
/**
    @Author: 张世罡 
    @Date： ${DATE}
    @Description: ${PACKAGE_NAME}
    @version: 1.0
 */
 2.添加方法注释模板
 settings -- editor -- live template -- myGroup 
 /**
    功能描述
    @param: $param$
    @return: $return$
    @author: $user$
    @date:$date$ $time$
*/
```

## idea界面：

1. 显示工具栏

   view -- toolbar

2. 显示侧边工具

   view -- tool buttons

## 配置JVM参数

​	help -- edit custom vm options

​	-Xms1024m

​	-Xmx2048m

​	-XX:ReservedCodeCacheSize=500m

​	设置之后idea的响应速度会大大提升

## 进行全局设置的两种方式：

1. idea欢迎界面：welcome to intelliJ IDEA -- configure -- settings

   ​	进入主界面：file -- close project

2. file -- other settings -- settings for new projects

   ​	注：在主界面file -- settins下设置只会对当前工程生效，不推荐这种方式

## Debug的使用：

1. F7 Step into：执行到方法调用时，会进入方法内部

2. F8 Step over：执行到方法调用时，会跳过方法

3. F9 直接跳转的下一个断点

# 使用idea创建web工程

```txt
每次打开都是上一个工程，怎么给他关掉呢？

fle -- close Project -- configure -- settings -- Appearance & Behavior -- System Settings 

startup/Shutdown下：

不勾选 Reopen last project on startup 
```



1. 新建web工程：

   create new project -- java -- web application

![1561788778659](C:\Users\张世罡\AppData\Roaming\Typora\typora-user-images\1561788778659.png)



​		选择java EE版本会有对应的servlet版本。

2. 部署web工程

   ​	Edit configuration -- +号 -- Tomcat server -- local

   1）指定服务器名称

   2）Error：Application Server not specified

   ​	服务未指定

   ​	选择Tomcat路径即可

   3）Error：No artifacts marked for deployment

   ​	未指定部署项目

   ​	点击fix修复

4. open browser

   ​	勾选上after launch 并选择常用浏览器，可以在启动服务后

5. 配置下面两项可以自动加载更改的文件，免于重新启动服务器，节省时间

   ​	on 'update' action : redeploy

   ​	on frame deactivation : update classes and resources

## 为web工程添加第三方依赖：

1. 在WEB-INF下创建lib文件夹，拷贝gson到lib目录下

   ​	（第一次拷贝进去是不能使用gson的API的，需要进行一些配置）

2. 点击菜单栏project structure图标

3. 选择libraries -- +号 -- java -- 找到lib文件夹 -- OK -- OK -- Apply

4. 选择 Module 可以看到 lib 文件夹已经添加到当前工程的依赖里面了

5. 勾选 lib 项，生效，现在就可以在工程中使用 gson 了

## 创建servlet：

1. 新建HelloServlet

   ​	发现Httpservlet包没有导入

2. 添加Tomcat环境：选中项目 -- 点击project structure图标 -- module -- Dependencies -- +号 -- 选择Tomcat -- add selected -- 勾选Tomcat -- OK

3. 运行Tomcat 访问servle-mapping中的路径即可

# Maven的配置：

​	configure -- build,execution,deployment -- build tools -- maven 

​	需要修改一下三个内容：

​	maven home directory:

​	user settings file

​	local repository

## 使用Maven创建JavaSE工程

​	create new project -- maven -- 选中create from archetype -- 选择让quickstart骨架  -- 设置完成

​	项目打开之后点击右下角的 Enable-Auto-Import

## 使用Maven创建Java web工程

​	create new project -- maven -- 选中create from archetype -- 选择让webapp骨架  -- 设置完成

​	项目打开之后点击右下角的 Enable-Auto-Import

​	发现目录不完整：

​	在main文件夹下创建java、resource文件夹

​	右键 java 文件夹 -- mark directory as -- sources root

​	右键 resource文件夹 -- mark directory as -- resources root

## 使用maven发布工程：

1.在当前工程添加Tomcat插件？？？？？

​	pom 文件中添加plugin

2.使用Tomcat发布web工程

# 使用maven创建聚合工程

![1561802249651](C:\Users\张世罡\AppData\Roaming\Typora\typora-user-images\1561802249651.png)

1. create new project -- 选择site骨架 

2. 前台工程和后台工程骨架都创选择site：右键点击mall项目名称 -- new -- module -- 选择site骨架 -- 下一步：将add as module to 改为 none -- 设置子模块保存路径和父模块在同一路径下-- 填写项目名称为portal 或 back

   ​	注：将add as module to 改为 none 是让子模块受父模块管理，但不继承mall 

3. 前、后台子模块的三个子模块

   ​	打包方式：jar / jar / war

   ​	创建方式：quickstart / quickstart / webapp

   注：dao、service层以quickstart方式创建，web层用webapp方式创建

4. 在service层添加dao层依赖，在web层添加service层依赖

5. web层文件夹不完整，需要创建java 、resources目录 ，并标记

   

   



# svn管理项目



# git管理项目





