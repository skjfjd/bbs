<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>

<form name="frmForm" id="_frmForm" method="post" action="bbswriteAf.do">

<table class="list_table" style="width: 85%;">

<colgroup>
    <col style="width: 200px;"/>
    <col style="width: auto;"/>
</colgroup>

<tbody>
    <tr class="id">
        <th>아이디</th>
        <td style="text-align: left">
            <input type="text" name="id" readonly="readonly" value="${login.id}" size="60">
        </td>
    </tr>

    <tr>
        <th>제목</th>
        <td style="text-align: left">
            <input type="text" name="title" id="_title" size="60">
        </td>
    </tr>

    <tr>
        <th>내용</th>
        <td style="text-align: left">
            <textarea rows="18" cols="59" name="content" id="_content" style="resize: none" id="_content"></textarea>
        </td>
    </tr>

    <tr>
        <td colspan="2" style="height: 50px; text-align: center;">
            <span>
                <a href="#none" id="_btnWrite" title="글쓰기">
                    <img src="./image/bwrite.png" alt="로그인">
                </a>
            </span>
        </td>
    </tr>

</tbody>
</table>
</form>

<script type="text/javascript">
    $("#_btnWrite").click(function (){

        if ($("#_title").val()) {
            $("#_content").val("");
            alert("내용을 입력해주세요");
        } else if ($("#_content").val()){
            $("#_title").val("");
            alert("제목을 입력해주세요");
        } else if ($("#_title").val("") && $("#_content").val("")) {
            alert("제목과 내용을 입력해주세요");
        } else {
            if ($("#_title").val() && $("#_content").val()) {
                alert("글작성완료");
                $("#_frmForm").attr({"target":"_self" , "action":"bbswriteAf.do"}).submit();
            }

        }

    });
</script>