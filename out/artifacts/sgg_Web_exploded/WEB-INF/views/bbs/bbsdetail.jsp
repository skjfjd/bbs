<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>

<form name="frmForm" id="_frmForm" method="post" action="bbsupdate.do">

<input type="hidden" name="seq" value="${bbs.seq}">

<table class="list_table" style="width: 85%;">

<colgroup>
    <col style="width: 200px;">
    <col style="width: auto;">
</colgroup>


    <tbody>
    <tr class="id">
        <th>아이디</th>
        <td style="text-align: left">${bbs.id}</td>
    </tr>

    <tr>
        <th>제목</th>
        <td style="text-align: left">${bbs.title}</td>
    </tr>

    <tr>
        <th>작성일</th>
        <td style="text-align: left">${bbs.wdate}</td>
    </tr>

    <tr>
        <th>내용</th>
        <td style="text-align: left"><textarea rows="10" cols="50"
        name="content" id="_content" style="resize: none;">${bbs.content}</textarea></td>
    </tr>

    <tr>
        <td colspan="2" style="height: 50px; text-align: center;">
            <span>
                <c:if test="${bbs.id eq login.id}">
                    <a href="#none" id="_btnUpdate" title="글수정하기"><img src="./image/bupdate.png" alt="수정하기"> </a>
                    <a href="#none" id="_btnDel" title="삭제하기"> <img src="./image/del.png"> </a>
                </c:if>
                <a href="#none" id="_btnReply" title="답글달기"> <img src="./image/breply.png" alt="답글하기"> </a>
            </span>

        </td>
    </tr>
    </tbody>
</table>
</form>

<script type="text/javascript">

    $("#_btnUpdate").click(function (){
        alert("글수정하기");
        $("#_frmForm").attr({"target": "_self", "action": "bbsupdate.do"}).submit();  // 업데이트도 시퀀스와 dto
    });

    $("#_btnReply").click(function (){
        alert("답글달기");
        $("#_frmForm").attr({"target": "_self", "action": "answer.do"}).submit();   // 답글은  시퀀스와 dto
    });

    $("#_btnDel").click(function (){
        alert("글이 삭제되었습니다.");
        $("#_frmForm").attr({"target": "_self", "action": "bbsdelete.do"}).submit();  // 삭제는 시퀀스
    });

</script>
