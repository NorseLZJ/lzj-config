#### **windowsTerminal**

- windowsTerminal 配置 bash or git-bash

- 打开你的windowsTerminal 在最上方你会看到一个下拉三角，点击，并且再次点击setting，会有一个选择以某种方式打开,选择你熟悉的某种方式打开，搜索或查找到 profiles ，下面就是配置不同终端的，你至少应该看到有一个，然后复制一下代码，到其中，注意json格式不要出错，完事保存，如果有错误会有提示，请自行查看对应行是否有错误。
```json
{
    "acrylicOpacity": 0.5,
    "closeOnExit": true,
    "colorScheme": "Campbell",
    "commandline": "C:\\Program Files\\Git\\bin\\bash.exe", // 默认git安装路径如果你不一样就替换
    "cursorColor": "#FFFFFF",
    "cursorShape": "bar",
    "fontFace": "Monaco",
    "fontSize": 10,
    "guid": "{1d4e097e-fe87-4164-97d7-3ca794c316fd}",
    "historySize": 9001,
    "icon": "C:\\Users\\walterlv\\Resources\\Icons\\git-bash.png",
    "name": "Bash",
    "padding": "0, 0, 0, 0",
    "snapOnInput": true,
    "startingDirectory": "%USERPROFILE%"
    //"useAcrylic": true
}
```

- [我的配置文件地址](https://github.com/NorseLZJ/lzj-config/tree/master/windowsTerminal)