<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>通用表单页面_很简洁漂亮的Bootstrap响应式后台管理系统模板UniAdmin</title>
    <meta charset="UTF-8" />
    <meta name="author" content="order by dede58.com"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="../css/colorpicker.css" />
    <link rel="stylesheet" href="../css/datepicker.css" />
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
        <!--大标题-->
        <h1>添加学生</h1>

    </div>
    <!--左标题-->
    <div id="breadcrumb">
        <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 主页</a>
        <a href="#" class="tip-bottom">学生管理</a>
        <a href="#" class="current">添加学生信息</a>
    </div>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">
                <div class="widget-box">
                    <div class="widget-title">
								<span class="icon">
									<i class="icon-align-justify"></i>
								</span>
                        <h5>Text inputs</h5>
                    </div>

                    <div class="widget-content nopadding">
                        <form action="/student/save" method="get" class="form-horizontal" />
                        <div class="control-group">
                            <label class="control-label">学生姓名</label>
                            <div class="controls">
                                <input type="text" name="stuname"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">学生密码</label>
                            <div class="controls">
                                <input type="password" name="stupassword"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">学生性别</label>
                            <div class="controls">
                                <select name="gender">
                                    <option selected="selected">男</option>
                                    <option>女</option>
                                </select>
                                <span class="help-block">This is a description</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">寝室号</label>
                            <select name="dormid">
                                <c:forEach var="dorm" items="${dorms}">
                                    <option>${dorm.dormid}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="control-group">
                            <label class="control-label">学院</label>
                            <div class="controls">
                                <input type="text" placeholder="This is a placeholder..." name="college"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">主修</label>
                            <div class="controls">
                                <input type="text" placeholder="This is a placeholder..." name="major"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">电话号码</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入8-11位的电话号码" id="telephone" name="telephone"/>
                                <div id="error"></div>
                                <span class="help-block">请输入8-11位的电话号码</span>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="submit" id="submitButton" class="btn btn-primary">Save</button>
                        </div>
                        </form>
                    </div>
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
<script src="../js/bootstrap-colorpicker.js"></script>
<script src="../js/bootstrap-datepicker.js"></script>
<script src="../js/jquery.uniform.js"></script>
<script src="../js/select2.min.js"></script>
<script src="../js/unicorn.js"></script>
<script src="../js/unicorn.form_common.js"></script>

<script>
    $(function () {
        $("#telephone").blur(function () {
            var telephone = $("#telephone").val();

            var reg_tele = /[1-9][0-9]{8,10}/;
            var flag = reg_tele.test(telephone);
            if (flag){
                $("#telephone").css("border","");
            }else {
                $("#telephone").css("border","1px solid red");
                // $("#error").html("您输入的信息不符合8-11位数字");
                // $("#submitButton").attr("disabled","true");
            }
            return flag;
        })})
</script>
</body>
</html>

