<%--
  Created by IntelliJ IDEA.
  User: 孙阔
  Date: 2020/10/11
  Time: 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/static/js/jquery-3.4.1.min.js"></script>
</head>
<body>
<center>
    <h2>标准信息列表</h2>
    <table border="1" style="width:1000px;height: 100px;" class="fen">
        <tr align="right">
            <td colspan="7">
                <input type="text" name="title" class="tt"><input type="button" value="提交检索" onclick="submit()">
                <input type="button" value="新增标准" onclick="add()">
                <input type="button" value="删除标准" class="del">
            </td>
        </tr>
        <tr class="bian" align="center" style="font-weight: bolder;background-color: #808080">
            <td><input type="checkbox" class="kuang"></td>
            <td>标准号</td>
            <td>中文名称</td>
            <td>版本</td>
            <td>发布日期</td>
            <td>实施日期</td>
            <td>操作</td>
        </tr>
    </table>
    <table class="table_kong" width="300" border="1" align="center">
        <tr align="center">
            <td><a href="javascript:void(0)" class="shou">首页</a></td>
            <td><a href="javascript:void(0)" class="shang">上一页</a></td>
            <td class="ye">1/1</td>
            <td><a href="javascript:void(0)" class="xia">下一页</a></td>
            <td><a href="javascript:void(0)" class="wei">尾页</a></td>
        </tr>
    </table>
</center>
</body>
<script type="text/javascript">
    $(function () {
        $(".kuang").click(function () {
            if (this.checked) {
                $(".fkuan").prop("checked", true);
            } else {
                $(".fkuan").prop("checked", false);
            }
        })
        $(".del").click(function () {
            var arr = new Array();
            $.each($(".fkuan"), function (i, v) {
                console.log(v.checked)
                if (v.checked) {
                    arr.push($(v).next().val())
                }
            })
            if (arr.length > 0) {
                var json = {
                    "arr": arr
                }
                $.post("del", json, function (data) {
                    if (data.success) {
                        alert("删除成功")
                        fen();
                    }
                }, "json")
            }
        })
        fen();
        $(".xia").click(function () {
            if (datapage.hasNextPage) {
                pageIndex = datapage.nextPage;
                fen()
            }
        })
        $(".shang").click(function () {
            if (datapage.hasPreviousPage) {
                pageIndex = datapage.prePage;
                fen()
            }
        })
        $(".shou").click(function () {
            if (!datapage.isFirstPage) {
                pageIndex = datapage.firstPage;
                fen()
            }

        })
        $(".wei").click(function () {
            if (!datapage.isLastPage) {
                pageIndex = datapage.lastPage;
                fen()
            }
        })
    })
    var pageIndex = 1;
    var pageSize = 3;
    var zhname = "";
    var datapage;

    function fen() {
        $(".fen tr:gt(1)").remove();
        zhname = $(".tt").val();
        var json = {
            "zhname": zhname,
            "pageIndex": pageIndex,
            "pageSize": pageSize
        }
        $.post("select", json, function (data) {
            datapage = data.data;
            console.log(data.data.list)
            $(".ye").text(data.data.pageNum + "/" + data.data.pages)
            $.each(data.data.list, function (i, v) {
                var $tr = $('<tr class="bian" align="center"> <td><input type="checkbox" class="fkuan"><input type="text" hidden value="' + v.id + '"></td> <td>' + v.stdNum + '</td> <td>' + v.zhname + '</td> <td>' + v.versionn + '</td> <td>' + v.releaseDate.substring(0, 10) + '</td> <td>' + v.implDate.substring(0, 10) + '</td><td><a href="xiazai?fileName='+v.packagePath+'">下载</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="chuan?id='+v.id+'">修改</a></td></tr>');
                $(".fen").append($tr);
            })

        }, "json")
    }

    function submit() {
        fen()
    }
    function add() {
        window.location.href="toadd";
    }
</script>
</html>
