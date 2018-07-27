<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <jsp:useBean id="member" scope="session" class="member.MemberInfo" />
<!DOCTYPE html>
<html>

<head>
    <title>블로그 예제</title>
    <link href="https://fonts.googleapis.com/css?family=Markazi+Text|Nanum+Gothic" rel="stylesheet">
    <style>
        ul {
            display: inline;
        }

        li {
            list-style: none;
        }

        body {
            background: lightgray;
            font-family: 'Markazi Text', serif;
            font-family: 'Nanum Gothic', sans-serif;
        }

        a{
            margin-right: 20px;
            text-decoration: none;
            color: black;            
            padding-left: 10px;
        }

        #page {
            background: white;
            width: 1500px;
            margin: 20px auto;
            height: 2000px;
            position: relative;
        }

        #content {
            width: 1500px;
        }

        #leftone img {
            border: 0px;
            width: 700px;
            float: right;
            border-radius: 40%;
            margin: 0 10px;
        }

        p {
            padding: 30px;
            margin: 20px;
        }

        #leftone2 img {
            border: 0px;
            width: 700px;
            float: left;
            border-radius: 40%;
            margin: 0 10px;
        }

        .leftone {
            width: 1200px;
            float: left;
            margin-left: 50px;
            border-bottom: 1px solid lightgray;
            padding: 20px;
            display: inline-block;
        }

        #rightone {
            width: 200px;
            float: right;
            margin-top: -500px;
        }

        #rightone h3 {
            margin-bottom: 0px;
        }

        #header1 {
            width: 1500px;
            height: 500px;
            line-height: 200px;
            padding-left: 50px;
            font-size: 50px;
            color: wheat;
            font-weight: bold;
            text-align: left;
            background-image: url(/imgs/bg3.jpg);
            background-size: 1500px;
            background-repeat: no-repeat;
        }

        #header2 {
            margin-top: -70px;
            margin-left: 100px;
        }

        #nav {
            overflow: hidden;
            border: 1px solid lightgray;
        }

        .nav {
            float: left;
            padding: 30px;
            padding-top: 15px;
            padding-bottom: 15px;
        }

        #leftNav {
            float: right;
            padding: 30px;
            padding-top: 15px;
            padding-bottom: 15px;
        }

        #footer {
            position: absolute;
            bottom: 0px;
            padding: 30px;
        }
    </style>
</head>

<body>
<%@ include file="Menus.jsp" %>
    <div id="page">
        <div>

            <h1 id="header1">LIVING & FOOD</h1>
            <h3 id="header2">FOOD BLOG</h3>
        </div>

        <div id="nav">
            <div class="nav">Korean food</div>
            <div class="nav">Wedding Ceremony</div>
            <div class="nav">Finger Food</div>
            <div id="leftNav">
                <div><input type="text" placeholder="검색" /></div>
            </div>
        </div>



        <div id="content">
            <div id="leftone" class="leftone">
                <h1>Finger Food Example Preview</h1>
                <h3>2018년 06월 28일</h3>
                <img src="imgs/bg2%20(2).jpg" />
                <p>The Catering was founded in blabla by Mr. Smith in lorem ipsum dolor sit amet, consectetur adipiscing elit consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute iruredolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.We only use seasonal ingredients. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod temporincididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
            </div>

            <div id="leftone2" class="leftone">
                <h1>Korean Food Example Preview</h1>
                <h3>2018년 06월 31일</h3>
                <img src="imgs/bg4.jpg" />
                <p>The Catering was founded in blabla by Mr. Smith in lorem ipsum dolor sit amet, consectetur adipiscing elit consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute iruredolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.We only use seasonal ingredients. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod temporincididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
            </div>
            <div id="rightone">
                <h3>카테고리</h3>
                <ul>
                    <li>데이터</li>
                    <li>데이터</li>
                    <li>데이터</li>
                    <li>데이터</li>
                    <li>데이터</li>
                    <li>데이터</li>
                </ul>

                <h3>최근글</h3>
                <ul>
                    <li>데이터</li>
                    <li>데이터</li>
                    <li>데이터</li>
                    <li>데이터</li>
                    <li>데이터</li>
                    <li>데이터</li>

                </ul>
            </div>
        </div>

        <div id="footer">
            <h2>How to Contact us</h2>
            <p>We offer full-service catering for any event, large or small. We understand your needs and we will cater the food to satisfy the biggerst criteria of them all, both look and taste. Do not hesitate to contact us.</p>

            <h4>Catering Service, 42nd Living St, 43043 New York, NY</h4>
            <p>
                You can also contact us by phone 00553123-2323 or email catering@catering.com, or you can send us a message here:
            </p>
        </div>
    </div>
</body>

</html>
