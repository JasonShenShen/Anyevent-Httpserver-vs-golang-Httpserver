#golang vs anyevent-perl exceeds MTU 大报文测试

编写golang和perl的httpserver，接收ab的post请求进行打印输出

#benchmarks

ab 2M post 100 并发

* goserver 

Requests per second:    5114.31 [#/sec] (mean)

* aeserver

Requests per second:    2464.04 [#/sec] (mean)