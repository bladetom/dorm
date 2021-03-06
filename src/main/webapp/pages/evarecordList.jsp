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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style>
        .bar6 input {
            border: 2px solid #444444;
            border-radius: 5px;
            background: transparent;
            top: 0;
            right: 0;

        }
        .bar6 button {
            background: #444444;
            border-radius: 0 5px 5px 0;
            width: 60px;
            top: 0;
            right: 0;
        }
        .bar6 button:before {
            content: "搜索";
            font-size: 13px;
            color: #F9F0DA;
        }
    </style>
</head>
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
        <h1>评价记录信息</h1>

    </div>
    <div id="breadcrumb">
        <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 主页</a>
        <a href="#" class="current">评价记录</a>
    </div>

    <div class="search bar6" align="center">
        <form action="/evaRecord/fuzzyQuery" method="get">
            <input type="text" name="str"  placeholder="请输入您要搜索的内容...">
            <button type="submit" class="btn"></button>
        </form>
    </div>
    <div>
        <button onclick="addRecord()" class="btn bg-olive btn-xs">添加评价记录</button>
    </div>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">

                <div class="widget-box">
                    <div class="widget-title">
								<span class="icon">
								</span>
                        <h5>寝室详细信息表</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <table class="table table-bordered table-striped with-check" id="dataList">
                            <thead>
                            <tr>
<%--                                <th><i class="icon-resize-vertical"></i></th>--%>
                                <th><input type="checkbox" onclick="selectAll(this)"></th>
                                <th>记录编号</th>
                                <th>标题</th>
                                <th>内容</th>
                                <th><button onclick="deleteDorm()" class="btn btn-danger" ><i class="icon-remove icon-white"></i>删除</button></th>
                                <!--有些是disable的按钮应该灰掉-->
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pageInfo.list}" var="record">
                                <tr>
                                    <td><input  class="ids" type="checkbox" value="${record.evaRecordid}" class="btn bg-olive btn-xs"></td>
                                    <td>${record.evaRecordid}</td>
                                    <td>${record.title}</td>
                                    <td>${record.content}</td>
                                    <td>
                                        <button type="button" class="btn" onclick="location.href='/evaRecord/findDetail?evaRecordId=${record.evaRecordid}'" ><i class="icon-eye-open"></i>查看详情</button>
                                        <button type="button" class="btn btn-inverse" onclick="location.href='/evaRecord/updateRecord?evaRecordId=${record.evaRecordid}'"><i class="icon-refresh icon-white"></i>更改</button>
<%--                                        <c:choose>--%>
<%--                                        <c:when test="${dorm.students.size()==0}">--%>
<%--                                            <button type="button" class="btn bg-olive btn-xs" onclick="location.href='/dorm/delete?dormid=${dorm.dormid}'" >删除</button>--%>
<%--                                        </c:when>--%>
<%--                                        </c:choose>--%>
                                        <c:if test="${record.dorms.size()==0}"><button type="button" class="btn btn-danger" onclick="location.href='/evaRecord/delete?recordId=${record.evaRecordid}'"  ><i class="icon-remove icon-white"></i>删除</button></c:if>
                                        <c:if test="${record.dorms.size()!=0}"><button type="button" class="btn btn-danger" onclick="location.href='/evaRecord/delete?recordId=${record.evaRecordid}'" disabled="disabled"><i class="icon-remove icon-white"></i>删除</button></c:if>
                                    </td>
                                </tr>
                                <!--dorm删除时连接了student就删除不了了 ，应该查询student 把List<student>返回，判断是否为空，非空则disable delete-->
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="pagination alternate">
                    <ul>
                        <li><a href="/evaRecord/findAll?page=1&pageSize=${pageInfo.pageSize}" >首页</a></li>
                        <li><a href="/evaRecord/findAll?page=${pageInfo.pageNum-1}&pageSize=${pageInfo.pageSize}">上一页</a></li>
                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                            <li><a href="/evaRecord/findAll?page=${pageInfo.pageNum}&pageSize=${pageInfo.pageSize}">${pageNum}</a></li>
                        </c:forEach>
                        <li><a href="/evaRecord/findAll?page=${pageInfo.pageNum+1}&PageSize=${pageInfo.pageSize}">下一页</a></li>
                        <li><a href="/evaRecord/findAll?page=${pageInfo.pages}&pageSize=${pageInfo.pageSize}">尾页</a></li>
                    </ul>
                </div>
                <div class="box-footer">
                    <div class="pull-left">
                        <div class="form-group form-inline">
                            总共${pageInfo.pages}页，共${pageInfo.size}条数据。
                            <select class="form-control" id="changePageSize" onchange="changePageSize()">
                                <option>5</option>
                                <option>10</option>
                                <option>20</option>
                                <option>50</option>
                            </select> 条
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

<script>
    function changePageSize() {
        //获取下拉框的值
        var pageSize = $("#changePageSize").val();
        //向服务器发送请求，改变没页显示条数
        location.href = "/evaRecord/findAll?page=1&pageSize="+pageSize;
    }
    function search(){
        var content = $("#searchone").val();
        location.href = "/evaRecord/fuzzyQuery?str=" +content;
        // alert(content)
    };
    $(function () {
        $("td:gt(0):odd").css("backgroundColor","pink");
        $("td:gt(0):even").css("backgroundColor","yellow");
    });

    //全选后再取消选择一个后全选按钮不会取消
    // 全选操作
    function selectAll(obj) {
        $(".ids").prop("checked",obj.checked);
    }

    function deleteDorm() {
        var array = new Array();
        var flag;
        $("input[class='ids']:checkbox").each(function () {
            if ($(this).attr("checked")) {
                flag = true;

            }
        })
        // alert(array);
        if (flag) {
            $("input[class='ids']:checkbox").each(function () {
                if ($(this).attr("checked")) {
                    array.push($(this).val());
                }
            })
            location.href = "/evaRecord/deleteList?str=" + array;
        }else {
            alert("请至少选择一个");
        }

    }

    function addRecord() {
        location.href = "/evaRecord/add";
    }
</script>

<script src="../js/jquery.min.js"></script>
<script src="../js/jquery.ui.custom.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.uniform.js"></script>
<script src="../js/select2.min.js"></script>

<%--</body>--%>
</html>

