<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/10/11
  Time: 9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>标准信息列表</title>
    <script type="text/javascript" src="/static/js/jquery-3.4.1.js"></script>
</head>
<body>
<center>
    <h1>标准信息列表</h1>
    <table border="1px" width="700px" id="mytable">
        <tr>
            <td colspan="7">
                <input type="text" class="ming"  name="title">
                <button onclick="aj()">提交检索</button>
                <button>新增标准</button>
                <button>删除标准</button>
            </td>
        </tr>
        <tr style="text-align: center">
            <td>
                <input type="checkbox" id="xuankuang" onclick="xuan()">
            </td>
            <td>
                标准号
            </td>
            <td>
                中文名称
            </td>
            <td>
                版本
            </td>
            <td>
                发布日期
            </td>
            <td>
                实施日期
            </td>
            <td>
                操作
            </td>
        </tr>

    </table>
    <table border="1px" width="700px">
        <tr style="text-align: center">
            <td colspan="6"><a href="javascript:void(0)" onclick="shou()">首页</a>
                <a href="javascript:void(0)" onclick="shang()">上一页</a>
                <a class="ye">1/1</a>
                <a href="javascript:void(0)" onclick="xia()">下一页</a>
                <a href="javascript:void(0)" onclick="wei()">尾页</a></td>
        </tr>
    </table>
</center>
</body>
</html>
<script type="text/javascript">
    function xuan() {
          $("#xuankuang").click(function () {
              if ($(this).is(':checked')) {
                  $('.kuang').attr('checked','checked');
              }else{
                  $('.kuang').removeProp('checked');
              }
          })
    }
    var pageInfo;
    var pageNum = 1;
    var pageSize = 2;

    function shou() {

        if (pageInfo.isFirstPage == false) {
            pageNum=1;
            aj();
        }
    }

    function shang() {
        if(pageInfo.hasPreviousPage){
            pageNum=pageInfo.prePage;
            aj();
        }
    }

    function xia() {
        if(pageInfo.hasNextPage){
            pageNum=pageInfo.nextPage;
            aj();
        }
    }

    function wei() {
        if(pageInfo.isLastPage==false){
            pageNum=pageInfo.lastPage;
            aj();
        }
    }

    function aj() {
        var mo=$(".ming").val();
        $(".bian").remove();
        var json = {
            pageNum: pageNum,
            pageSize: pageSize,
            title:mo
        }
        $.ajax({
            url: "/chushi",
            type: "POST",
            data: json,
            dataType: "json",
            success: function (result) {
                /*if (result.status == "true") {*/
                    $(".ye").text(result.data.pageNum+"/"+result.data.pages);
                    pageInfo = result.data;
                    $.each(result.data.list, function (index, v) {
                        var $tr = $("<tr style=\"text-align: center\" class='bian'></tr>");
                        var $td = $("<td><input type=\"checkbox\" class='kuan'></td><td>" + v.stdNum + "</td><td>" + v.zhname + "</td><td>" + v.versionn + "</td><td>" + v.releaseDate + "</td><td>" + v.implDate + "</td><td><a href=''>下载</a><a href=''>修改</a></td>");
                        $tr.append($td);
                        $("#mytable").append($tr);
                        $(".bian:even").css("background-color", "#87FDFD");
                    })
                /*} else {

                }*/
            }
        })
    }
    $(function () {
        aj();
    })
</script>
