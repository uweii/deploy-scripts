# deploy-scripts
Linux下一键部署jar包脚本

## 目录
``` 
——project
    你自己的jar包.jar
——script
    application.sh
    start.sh
    stop.sh
    restart.sh
    status.sh
```

## 使用方法
> 将`project` 和 `script`放到同一个目录中， 然后将`project`目录下的jar替换为你自己的jar包如`xxx.jar`， 
然后编辑 `script`目录下的`application.sh`, 将里面的`app_name='demo.jar'`替换为`app_name='xxx.jar'`
