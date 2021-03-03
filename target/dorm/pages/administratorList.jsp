<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>数据表格_很简洁漂亮的Bootstrap响应式后台管理系统模板UniAdmin</title>
    <meta charset="UTF-8" />
    <meta name="author" content="order by dede58.com"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="../css/uniform.css" />
    <link rel="stylesheet" href="../css/select2.css" />
    <link rel="stylesheet" href="../css/unicorn.main.css" />
    <link rel="stylesheet" href="../css/unicorn.grey.css" class="skin-color" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>


<div id="header">
    <h1><a href="/index.jsp">DormManagement</a></h1>
</div>


<div id="user-nav" class="navbar navbar-inverse">
    <ul class="nav btn-group">
        <li class="btn btn-inverse"><a title="" href="/logout"><i class="icon icon-share-alt"></i> <span class="text">退出</span></a></li>
    </ul>
</div>
<div id="sidebar">
    <a href="#" class="visible-phone"><i class="icon icon-home"></i> 首页</a>
    <ul>
        <li ><a href="/index.jsp"><i class="icon icon-home"></i> <span>首页</span></a></li>
        <li><a href="/apartment/findAll"><i class="icon icon-th-list"></i> <span>公寓管理</span> </a></li>
        <li><a href="/dorm/findAll"><i class="icon icon-tint"></i> <span>寝室管理</span></a></li>
        <li><a href="/student/findAll"><i class="icon icon-pencil"></i> <span>学生管理</span></a></li>
        <li><a href="/evaRecord/findAll"><i class="icon icon-th"></i> <span>评价记录</span></a></li>
        <li><a href="/visitor/findAll"><i class="icon icon-th-list"></i> <span>访客查询</span></a></li>
        <li>
            <a href="/administrator/findAll"><i class="icon icon-signal"></i> <span>管理员</span></a>
        </li>
    </ul>
</div>

<div id="content">
    <div id="content-header">
        <h1>管理员信息</h1>

    </div>
    <div id="breadcrumb">
        <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 主页</a>
        <a href="#" class="current">管理员信息</a>
    </div>
    <div>
        <button onclick="location.href='/administrator/add'" class="btn bg-olive btn-xs">添加管理员</button>
    </div>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">

                <div class="widget-box">
                    <div class="widget-title">
								<span class="icon">
<%--									<input type="checkbox" id="title-checkbox" name="title-checkbox" />--%>
								</span>
                        <h5>管理员信息</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <table class="table table-bordered table-striped with-check">
                            <thead>
                            <tr>
                                <th><i class="icon-resize-vertical"></i></th>
                                <th>管理员号</th>
                                <th>管理员名称</th>
                                <th>密码</th>
                                <th>权限</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${all}" var="ad">
                                <tr>
<%--                                    <td><input  name="ids" type="checkbox"></td>--%>
                                    <td>${ad.ad_id}</td>
                                    <td>${ad.ad_name}</td>
                                    <td>${ad.password}</td>
                                    <td>${ad.permission}</td>
                                    <td><button type="button" class="btn btn-inverse" onclick="location.href='/administrator/update?ad_id=${ad.ad_id}'"><i class="icon-refresh icon-white"></i>更改</button>
                                        <button type="button" class="btn btn-danger" onclick="location.href='/administrator/delete?ad_id=${ad.ad_id}'"  ><i class="icon-remove icon-white"></i>删除</button>
                                    </td>
                                        
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="box-tools pull-right">
                    <ul class="pagination">
                    </ul>
                </div>


            </div>
        </div>

        <div class="row-fluid">
            <div id="footer" class="span12">
                2020 &copy; UniAdmin.</div>
        </div>
    </div>
</div>



<script src="../js/jquery.min.js"></script>
<script src="../js/jquery.ui.custom.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.uniform.js"></script>
<script src="../js/select2.min.js"></script>
<script src="../js/jquery.dataTables.min.js"></script>
<script src="../js/unicorn.js"></script>
<script src="../js/unicorn.tables.js"></script>
</body>
</html>

