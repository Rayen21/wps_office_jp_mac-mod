## wps_office_jp_mac-mod

### 使用日本版是因为它这个版本是不需要强制使用帐户登录的，也没有广告这些弹窗，通过用国际版的libauth.dylib替换日版的同名文件来无障碍使用日版WPS的方法

### 第一步获取日版WPS的安装包

wps office 日本版无帐户和强制登录限制的30天试用版本（用本方法都可以无障碍使用）

https://dlv3.kingsoft.jp/download.php?type=wps&file=

https://dlv3.kingsoft.jp/download.php?type=wps&file=wps_mac_t.dmg

这两个版本（无帐户和强制登录限制）间没找到具体的差别，但是都只有阅读模式查看文档，不能编辑文档的需要序列号的注册版（用本方法都可以无障碍使用）

https://dlv3.kingsoft.jp/download.php?type=wps&file=wps_mac_s.dmg 

https://dlv3.kingsoft.jp/download.php?type=wps&file=wps_mac_p.dmg 

国际版的下载链接：

https://wdl1.pcfg.cache.wpscdn.com/wpsdl/macwpsoffice/download/3.0.0.4835/WPSOffice_3.0.0(4835).dmg 这个版本有点卡不推荐

https://wdl1.pcfg.cache.wpscdn.com/wpsdl/macwpsoffice/download/3.0.0.4840/WPSOffice_3.0.0(4840).dmg 这个版本有点卡不推荐

https://wdl1.pcfg.cache.wpscdn.com/wpsdl/macwpsoffice/download/3.1.1.5096/WPSOffice_3.1.1(5096).dmg 

https://wdl1.pcfg.cache.wpscdn.com/wpsdl/macwpsoffice/download/3.1.2.5330/WPSOffice_3.1.2(5330).dmg 

https://wdl1.pcfg.cache.wpscdn.com/wpsdl/macwpsoffice/download/3.1.4.5932/WPSOffice_3.1.4(5932).dmg 

https://wdl1.pcfg.cache.wpscdn.com/wpsdl/macwpsoffice/download/3.1.5.6233/WPSOffice_3.1.5(6233).dmg 

https://wdl1.pcfg.cache.wpscdn.com/wpsdl/macwpsoffice/download/3.1.6.6275/WPSOffice_3.1.6(6275).dmg 

https://wdl1.pcfg.cache.wpscdn.com/wpsdl/macwpsoffice/download/3.2.0.6370/WPSOffice_3.2.0(6370).dmg

### 第二步替换关键文件（取消试用和纯阅读模式）

使用国际版安装文件内的同名文件替换日版以下路径的文件即可达到去除时间和功能限制的效果：

/Applications/wpsoffice.app/Contents/Frameworks/office6/libauth.dylib

### 日版自带有中文语言包，但因为配置文件的原因，它不能在设置面板中显示出中文，想要显示中文请修改以下路径的文件：

/Applications/wpsoffice.app/Contents/Resources/office6/cfgs/product.dat

1、用文本编辑器打开product.dat，因为被官方加密的原因，打开是一堆乱码。

2、查找（g4ZPzWPkgQ8KXhNQBMM3vA..注意不包含括号，将=后面的(WHfH10HHgeQrW2N48LfXrA..)修改成（NsbhfV4nLv_oZGENyLSVZA..）

<img width="505" height="144" alt="image" src="https://github.com/user-attachments/assets/4d487249-6c3f-4cb0-a94f-52d24c53cd57" />

这个密文解密成明文的意思是：

g4ZPzWPkgQ8KXhNQBMM3vA..（MacExternal海外版的定义）

WHfH10HHgeQrW2N48LfXrA..（True定义为真）

NsbhfV4nLv_oZGENyLSVZA..（False定义为错）

### 感谢这个作者写的解密WPS product.dat的项目：

https://github.com/YukiIsait/WPSProfileCipher


