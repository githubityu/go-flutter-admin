<h1 align="center" style="margin: 30px 0 30px; font-weight: bold;">TD27 Admin</h1>
<h4 align="center">基于Gin+Vue3前后端分离的Golang快速开发框架</h4>

## 平台简介

* 前端技术栈 dart、flutter、riverpod
* 后端技术栈 Golang、Gin、Gorm、MySQL、Redis、Casbin

## 内置功能

- 用户管理：用户是系统操作者，该功能主要完成系统用户配置。
- 角色管理：分配权限控制的对象，不可角色可分配不同的菜单和后端接口权限。
- 菜单管理：根据用户角色动态分配菜单配置，实现不同角色不同菜单。
- 接口管理：不同角色可调用的api接口的权限不同。
- 操作记录：详细记录用户访问接口的行为
- 定时任务：~~目前仅支持配置文件方式~~ 支持配置文件和页面配置。
- 水印设置：目前仅支持在前端设置。
- 文件管理：文件上传、下载、删除

## 运行

默认账号密码

admin/123456

克隆项目
`git clone https://github.com/pddzl/td27-admin.git`

### 前端

```bash
# 配置
1. 一键安装 .vscode 目录中推荐的插件
2. node 版本 18+
3. pnpm 版本 8.x

# 进入项目目录
cd web

# 安装依赖
flutter pub get

# 启动服务
flutter run -d chrome

# 构建正式环境
flutter build web --release 

# 代码格式化
flutter format .
```

### 后端

```bash
# 配置
1. Go >= 1.19

# 进入server文件夹
cd server

# 使用 go mod 并安装go依赖包
go generate

# 编译 
go build -o server main.go

# 运行二进制
./server
```

**<u>如果选择手动部署，需要创建数据库（td27）并导入初始化数据。sql文件位置（./docker-compose/mysql/init/init.sql）</u>**

## swagger

```bash
cd server
swag init
```

`浏览`

```bash
http://localhost:8888/swagger/index.html
```

## 一键安装

Docker Compose 版本需要 V2

```bash
git clone https://github.com/pddzl/td27-admin
cd td27-admin
docker-compose -f docker-compose/docker-compose.yml build
docker-compose -f docker-compose/docker-compose.yml up -d
```

浏览器打开 `http://ip:8500`

## 项目预览图

<table>
  <tr>
    <td><img src="./img/cron.png"/></td>
    <td><img src="./img/接口管理.png"/></td>
  </tr>
  <tr>
    <td><img src="./img/接口管理-添加.png"/></td>
    <td><img src="./img/操作日志.png"/></td>
  </tr>
  <tr>
    <td><img src="./img/文件管理.png"/></td>
    <td><img src="./img/用户管理-添加.pic.jpg"/></td>
  </tr>
  <tr>
    <td><img src="./img/用户管理-添加2.pic.jpg"/></td>
    <td><img src="./img/用户管理-重置密码.png"/></td>
  </tr>
<tr>
    <td><img src="./img/菜单管理-添加.png"/></td>
    <td><img src="./img/菜单管理.pic.jpg"/></td>
  </tr>
</table>

## 致谢
+ 项目后端代码 [td27-admin](https://github.com/pddzl/td27-admin)

## 📄 License

[MIT](./LICENSE)

Copyright (c) 2022-present [githubityu](https://github.com/githubityu)
