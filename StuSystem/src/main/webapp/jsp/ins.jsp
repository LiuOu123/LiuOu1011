<%--
  Created by IntelliJ IDEA.
  User: 86131
  Date: 2020/10/11
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/ins" method="post" enctype="multipart/form-data">
    <table class="table-flowser" width="500" border="1" align="center">
        <tr>
            <th colspan="2">增加标准信息</th>
        </tr>
        <!-- 第一行 -->
        <tr>
            <td align="center">标准号</td>
            <td><input type="text" class="nicheng" name="stdNum" /></td>
        </tr>
        <!-- 第二行 -->
        <tr>
            <td align="center">中文名称</td>
            <td><input type="text" class="nicheng" name="zhname" /></td>
        </tr>
        <tr>
            <td align="center">版本</td>
            <td><input type="text" class="nicheng" name="versionn" /></td>
        </tr>
        <tr>
            <td align="center">关键词/字</td>
            <td><input type="text" class="nicheng" name="keyss" /></td>
        </tr>
        <tr>
            <td align="center">发布日期(yyyy-MM-dd)</td>
            <td><input type="text" class="nicheng" name="releaseDate" /></td>
        </tr>
        <tr>
            <td align="center">实施日期(yyyy-MM-dd)</td>
            <td><input type="text" class="nicheng" name="implDate" /></td>
        </tr>
        <tr>
            <td align="center">附件</td>
            <td><input type="file" class="nicheng" name="packagePath2" /></td>
        </tr>
        <!-- 第三行 -->
        <tr align="center">
            <td><button type="submit" class="tijiao">提交</button></td>
            <td><button type="button" onclick="fanhui()">返回</button></td>
        </tr>
    </table>
</form>
</body>
</html>
