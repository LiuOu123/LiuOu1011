<%--
  Created by IntelliJ IDEA.
  User: 86131
  Date: 2020/10/11
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/static/js/jquery-3.4.1.min.js"></script>
</head>
<body>
<h3 align="center">标准信息列表</h3>

<table border="1" width="600px" class="table-x" align="center">
    <p align="center"><input type="text" name="zhname" class="zhname">
        <button class="chaxun">提交检索</button>
        <button class="xin">新增标准</button>
        <button class="del">删除标准</button>
    </p>
    <tr>
        <th width="10"><input type="checkbox" name="xuan" class="xuan"></th>
        <th width="100">标准号</th>
        <th width="100">中文名称</th>
        <th width="100">版本</th>
        <th width="120">发布日期</th>
        <th width="200">实施日期</th>
        <th width="200">操作</th>
    </tr>
</table>
<table class="table table-fenye" width="300" border="1" align="center">
    <tr align="center">
        <td><a href=" " onclick="startPage()">首页</a></td>
        <td><a href="javascript:void(0)" onclick="prev()">上一页</a></td>
        <td class="page">1/1</td>
        <td><a href="javascript:void(0)" onclick="next()">下一页</a></td>
        <td><a href="javascript:void(0)" onclick="endPage()">尾页</a></td>
    </tr>
</table>
</body>
</html>
<script>
    $(document).ready(function () {
        cha();
        $(".chaxun").click(function () {
            cha();
            alert(zhname)
        })
        $(".xin").click(function () {
            location.href = "jsp/ins.jsp";
        })

        $(".xuan").click(function () {
            if (this.checked) {
                $(".dd").prop("checked", true);
            } else {
                $(".dd").prop("checked", false);
            }
        })
        $(".del").click(function () {
            var arr = new Array();
            $.each($(".dd"), function (i, v) {
                console.log(v.checked)
                if (v.checked) {
                    arr.push($(v).next().val())
                }
            })
            if (arr.length > 0) {
                var json = {
                    "arr": arr
                }
                $.post("/del", json, function (data2) {
                    if (data2.success) {
                        alert("删除成功")
                        cha();
                    }
                }, "json")
            }
        })
    })
    var pageSize = 3;
    var pageIndex = 1;
    var data1;

    function prev() {
        pageIndex = data1.sel.prePage;
        cha();
    }

    function next() {
        pageIndex = data1.sel.nextPage;
        cha();
    }

    function cha() {
        $(".table-x tr:gt(0)").remove();
        var zhname = $(".zhname").val();
        var json = {
            zhname: zhname,
            pageindex: pageIndex,
            pagesize: pageSize
        }
        $.ajax({
            type: "GET",
            url: "/sel",
            data: json,
            dataType: "json",
            success: function (data) {
                console.log(data)
                $(".page").text("第" + data.sel.pageNum + "页/第" + data.sel.pages + "页");
                data1 = data;
                $.each(data.sel.list, function (i, v) {
                    console.log(v)
                    var $tr = $("<tr><td><input type='checkbox' class='dd'></td><td hidden >" + v.packagePath + "</td><td hidden>" + v.id + "</td><td>"
                        + v.stdNum + "</td><td>" + v.zhname
                        + "</td><td>" + v.versionn
                        + "</td><td>" + v.releaseDate + "</td><td>" + v.implDate + "</td><td><a href='/chuan/" + v.stdNum + "/" + v.zhname + "/" + v.versionn + "/" + v.keyss + "/" + v.releaseDate + "/" + v.implDate + "/" + v.packagePath + "/" + v.id + "" + "'>修改</a><a href='/xiazai/"+v.packagePath+""+"' class='xia2'>下载</a></td></tr>");
                    $(".table-x").append($tr);
                })

            }
        })
    }
</script>