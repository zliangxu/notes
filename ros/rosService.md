[ros Service](http://wiki.ros.org/ROS/Tutorials/UnderstandingServicesParams)

## introduction
service 是一种ros节点之间进行信息传输的另一种形式，它允许节点发送一个请求然后接收到一个回应。

## usage

```shell
$ rosservice list
$ rosservice call  #call the service with the provided args
$ rosservice type  #print service type 
$ rosservice find  #find services by service type
$ rosservice uri
```