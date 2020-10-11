<%--
  Created by IntelliJ IDEA.
  User: 86131
  Date: 2020/10/11
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/upd" method="post">
<table class="table-flowser" width="500" border="1" align="center">
    <tr>
        <th colspan="2">修改标准信息</th>
    </tr>
    <!-- 第一行 -->
    <tr>
        <td align="center">标准号</td>
        <td hidden><input type="text" class="nicheng" name="id" value="${id}"/></td>
        <td><input type="text" class="nicheng" name="stdNum" value="${stdNum}"/></td>
    </tr>
    <!-- 第二行 -->
    <tr>
        <td align="center">中文名称</td>
        <td><input type="text" class="nicheng" name="zhname" value="${zhname}" /></td>
    </tr>
    <tr>
        <td align="center">版本</td>
        <td><input type="text" class="nicheng" name="versionn"  value="${versionn}"/></td>
    </tr>
    <tr>
        <td align="center">关键词/字</td>
        <td><input type="text" class="nicheng" name="keyss" value="${keyss}" /></td>
    </tr>
    <tr>
        <td align="center">发布日期(yyyy-MM-dd)</td>
        <td><input type="text" class="nicheng" name="releaseDate" value="${releaseDate}"/></td>
    </tr>
    <tr>
        <td align="center">实施日期(yyyy-MM-dd)</td>
        <td><input type="text" class="nicheng" name="implDate" value="${implDate}"/></td>
    </tr>
    <tr>
        <td align="center">附件</td>
        <td><input type="file" class="nicheng" name="packagePath" value="${packagePath}" /></td>
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
