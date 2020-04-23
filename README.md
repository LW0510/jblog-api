
## Docker 安装 Redis
```bash
docker run -p 6379:6379 --name redis5 -d redis:5.0.5 redis-server
```  
## Docker 安装 MySQL (版本)
```bash
docker run -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=`Ghc2020!` -d mysql:latest
```
 
## Docker 安装 Postgre (版本)
```bash
```
## 创建数据库
```bash
数据库名：framework
执行数据库脚本：framework_YYYYMMDD.sql
```
## 修改数据库链接
```bash
applicaiton-druid.yml
```
## 运行Framework API
```bash
开发模式：运行 Application.java
```