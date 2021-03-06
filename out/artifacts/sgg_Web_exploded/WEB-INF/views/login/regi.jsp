<%--
  Created by IntelliJ IDEA.
  User: songjinha
  Date: 2021/07/06
  Time: 10:41 ์คํ
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>

    <!-- cookie -->
    <script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript"></script>

    <style type="text/css">
        #login_wrap {
            margin: 10px;
        }
        #login_wrap th {
            font-weight: bold;
        }
        #main_wrap {
            width: 800px;
            margin-left: auto;
            margin-right: auto; padding: 0px;
        }
        #content_wrap {
            width: 100%;
            height: 500px;
            background-image: url("../image/backa.jpg");
            background-repeat: no-repeat;
            background-position: top center;
        }

        .login_title_warp {
            width: 500px;
            color: #ffffff;
            text-align: center;
            background-color: #3e5fba;
            border: solid 1px #efefef;
            font-width: bold;
            height: 60px;
        }

        /* table์ํ */
        .content_table { width:98%; border-bottom:1px solid #EFEFEF; border-right:1px solid #EFEFEF; border-collapse:collapse; margin-left:auto; margin-right:auto;  clear:both; }
        .content_table td, .content_table th { text-align:center; border-top:1px solid #EFEFEF; border-left:1px solid #EFEFEF; padding:0.3em; }
        .content_table th { background-color:#4D6BB3; color:#FFFFFF; line-height: 1.7em; font-weight:normal;}
        .content_table td { padding-left:5px; text-align:left; line-height: 1.7em; }
        .content_table td.contents { width:100%; height:400px; overflow:auto; }
        .content_table th, .content_table td { vertical-align:middle; }

        .content_table select { height:19px; border:#CCCCCC solid 1px; vertical-align:middle; line-height: 1.8em; padding-left:0px; }
        .content_table select option { margin-right:10px; }

    </style>


</head>
<body>

<div id="main_wrap">
    <div id="middle_wrap">
        <div id="content_wrap">

            <div style="width: 502px; height: 166px; margin-left: auto; margin-right: auto;
                        position: relative; top: 100px;">

                <div class="login_title_warp">
                    <div style="margin-top: 15px">
                        <h2>ํ์๊ฐ์</h2>
                    </div>
                </div>

                <div id="login_wrap">
                    <form action="" method="post" id="_frmForm" name="frmForm">

                        <table class="content_table" style="width: 75%">
                            <colgroup>
                                <col style="width: 30%">
                                <col style="width: 70%">
                            </colgroup>

                            <tr>
                                <th>์์ด๋ ์ฒดํฌ</th>
                                <td>
                                    <input type="text" name="sid" id="_id" size="30">
                                    <a href="#none" id="_btnGetId" title="id์ฒดํฌ">
                                        <img alt="" src="./image/idcheck.png">
                                    </a>
                                    <div id="_rgetid"></div>
                                </td>
                            </tr>

                            <tr>
                                <th>์์ด๋</th>
                                <td>
                                    <input type="text" name="id" id="_userid" size="30" readonly="readonly">
                                </td>
                            </tr>

                            <tr>
                                <th>ํจ์ค์๋</th>
                                <td>
                                    <input type="text" name="pwd" id="_pwd" size="30">
                                </td>
                            </tr>

                            <tr>
                                <th>์ด๋ฆ</th>
                                <td>
                                    <input type="text" name="name" id="_name" size="30">
                                </td>
                            </tr>

                            <tr>
                                <th>์ด๋ฉ์ผ</th>
                                <td>
                                    <input type="text"  name="email" id="_email" size="30">
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2" style="height: 50px; text-align: center;">

                                    <a href="#none" id="_btnRegi" title="ํ์๊ฐ์">
                                        <img alt="" src="./image/regi.jpg">
                                    </a>

                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
$("#_btnRegi").click(function (){
    //๋น์นธ ์ฒดํฌ
    if ($("#_userid").val().trim() == "") {
        alert("id ๋ฅผ ์๋?ฅํด์ฃผ์ธ์");
        $("#_id").focus();
    }else{
        $("#_frmForm").attr("action", "regiAf.do").submit();
    }
});

$("#_btnGetId").click(function (){

    if ($("#_id").val().trim() == "") {
        // alert("id๋ฅผ ์๋?ฅํด์ฃผ์ธ์");
        $("#_id").val("");
        $("#_id").focus();
        $("#_userid").val("");
        $("#_rgetid").html("์์ด๋๋ฅผ ์๋?ฅํด ์ฃผ์ญ์์ค");
    }
    else{

        $.ajax({
            url:"getId.do",
            type:"post",
            data:{id:$("#_id").val()},
            success:function ( msg){
                if (msg == 'YES'){
                    // alert ("์ด ID ๋ฅผ ์ฌ์ฉํ? ์ ์์ต๋๋ค");
                    $("#_rgetid").html("์ฌ์ฉํ? ์ ์๋ ID ์๋๋ค.");
                    $("#_rgetid").css("background-color" , "#ff0000");
                    $("#_id").val();
                    $("#_userid").val();
                }
                else {
                    $("#_rgetid").html("์ด ID๋ ์ฌ์ฉํ? ์ ์์ต๋๋ค");
                    $("#_rgetid").css("background-color" , "#0000ff");
                    $("#_userid").val($("#_id").val().trim());
                }
            }
        });
    }
});
</script>
</body>
</html>
