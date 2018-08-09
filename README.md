# k8simage 

## 简介

该项目只能说作为一个demo来使用吧,还有很多可以改进的地方,希望大神看到可以帮忙提提意见

主要的功能是将kubernetes安装时用到的docker镜像下载下来,以帮助那些访问原资源困难的人,项目提供了一个拉取脚本,可以接收master和node两个参数,帮助你自动将镜像拉取下来,使kubernetes可以正常使用这些镜像,项目中只有k8s_image_load.sh是供用户使用的,其他的均为为dockerhub提供的Dockerfile文件

目前仅支持v1.11.1版本的镜像,



## 使用方式

将k8s_image_load.sh脚本下载到本地

主节点执行 `./k8s_image_load.sh master`

其他节点执行 `./k8s_image_load.sh node`



## 广告

本人有一个自己博客站点 [http://smartyhero.com](http://smartyhero.com) 大家可以共同交流~~(虽然目前更新的文章还不是很多)