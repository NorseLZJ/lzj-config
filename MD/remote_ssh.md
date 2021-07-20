# vscode remote-ssh 插件错误

## 远程系统 ubuntu20.04 LTS

### 获取下载链接

$COMMITID 替换为图中2位置的ID，在浏览器打开，下载开始，就可以停掉，右键获取真实的下载链接

https://update.code.visualstudio.com/commit:$COMMITID/server-linux-x64/stable

到 $COMMITID 目录下 wget 下载  

然后执行 tar -xvf vscode-server-linux-x64.tar.gz --strip-components 1
