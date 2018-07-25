
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>

    <style>
        body {
            background-color: #f5f5f5;
        }

        #page {
            margin: 10px;
            width: 100%;
            height: 100%;
        }

        #banner {
            text-align: center;
            margin: 30px auto;
            font-size: 40px;
            color: green;
        }

        #content {
            margin: 0 auto;
            width: 500px;
            height: 1000px;
        }

        h4 {
            margin: 7px;
        }

        .big {
            margin: 5px;
            padding: 8px;
            width: 480px;
            height: 22px;
        }

        .small {
            margin: 5px;
            padding: 8px;
            height: 22px;
            width: 145px;
        }

        #Bmonth {
            height: 40px;
            width: 138px;
        }

        .gender {
            display: inline-block;
            text-align: center;
            line-height: 50px;
            width: 245px;
            height: 50px;
            background-color: white;
        }

        #address {
            height: 40px;
            width: 500px;
            padding: 5px;
            margin-left: 5px;
        }

        #tel {
            margin: 5px;
            padding: 8px;
            height: 22px;
            width: 320px;
        }

        .certify {
            border: none;
            background-color: #039803;
            width: 143px;
            height: 45px;
            margin-top: 5px;
            padding-bottom: 5px;
            color: white;
        }

        .last {
            background: #f5f5f5;
            border: 1px solid lightgray;
        }

        .final {
            margin-left: 8px;
            margin-top: 25px;
            padding: 8px;
            width: 495px;
            height: 70px;
            font-size: 25px;
        }

        input[type=radio] {
            display: none;
            width: 245px;
            height: 50px;
        }

        #msg {
            display: inline-block;
            background-color: #039803;
            width: 143px;
            height: 20px;
            padding: 10px 0px;
            text-align: center;
            color: white;
        }

        .spanLabel {
            width: 245px;
            height: 50px;
        }
        
        .photo{
			margin-left: 8px;
        }

    </style>

    <script>
        $(document).ready(function() {
            var regExpId = /^[a-z0-9_]\w{5,20}$/;
            var re = /^[0-9]+$/; //숫자만들어가게 하기
            var regByear = /^[0-9]{4}$/;
            var regBday = /^[0-9]{2}$/;
            var regName=/[\u3131-\u314e|\u314f-\u3163|\uac00-\ud7a3]/g;
           // var regName=/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2}$/;
            

            //아이디 유효성검사
            $('#id').focusout(function() {
                var val = $(this).val();
                if (val == "") {
                    $('#remove1').remove();
                    $('<span id="remove1"  style="color:red">필수입력 정보입니다.</span>').appendTo('.idLabel');
                } else if (regExpId.test(val) === false) {
                    $('#remove1').remove();
                    $('<span id="remove1"  style="color:red">5~20자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>').appendTo('.idLabel');
                } else {
                    $('#remove1').remove();
                    $('<span id="remove1"  style="color:green">정말 멋있는 아이디네요!</span>').appendTo('.idLabel');
                }
            });

            //패스워드 유효성검사
            $('#pw').focusout(function() {
                var val = $(this).val();
                if (val == "") {
                    $('#remove2').remove();
                    $('<span id="remove2" style="color:red">필수 정보입니다</span>').appendTo('.pwLabel');
                } else if (regExpId.test(val) === false) {
                    $('#remove2').remove();
                    $('<span id="remove2" style="color:red">5~20자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>').appendTo('.pwLabel');
                } else {
                    $('#remove2').remove();
                }

            });

            //패스워드 확인
            $('#pw2').focusout(function() {
                var val = $(this).val();
                if (val == "") {
                    $('#remove3').remove();
                    $('<span id="remove3" style="color:red">필수 정보입니다</span>').appendTo('.pw2Label');
                } else if (!val == $('#pw').val()) {
                    $('#remove3').remove();
                    $('<span id="remove3" style="color:red">일치하지않습니다.</span>').appendTo('.pw2Label');
                }

            });

            //이름 유효성검사
            $('#name').focusout(function() {
            	
                var val = $(this).val();
                if (val == "") {
                    $('#remove4').remove();
                    $('<span id="remove4" style="color:red">필수 정보입니다</span>').appendTo('.nameLabel');
                } else if (regName.test(val)===false) {
                    $('#remove4').remove();
                    $('<span id="remove4" style="color:red">한글을 사용하세요.</span>').appendTo('.nameLabel');
                } else {
                    $('#remove4').remove();
                }
               
            });

            //전화번호 유효성검사
            $('#tel').focusout(function() {
                var val = $(this).val();
                if (val == "") {
                    $('#remove5').remove();
                    $('<span id="remove5" style="color:red">필수 정보입니다</span>').appendTo('.telSpan');
                } else if (re.test(val) === false) {
                    $('#remove5').remove();
                    $('<span id="remove5" style="color:red">숫자만 입력가능합니다</span>').appendTo('.telSpan');
                } else {
                    $('#remove5').remove();
                }
            });

            //생년월일 유효성검사
            $('#Byear').focusout(function() {
                var val = $(this).val();
                var valday = $('#Bday').val();
                if (val == "") {
                    $('#remove6').remove();
                    $('<span id="remove6" style="color:red">년,일을 정확히 입력해주세요.</span>').appendTo('.bdaySpan');
                } else if (regByear.test(val) === false) {
                    $('#remove6').remove();
                    $('<span id="remove6" style="color:red">네자리숫자만 입력가능합니다</span>').appendTo('.bdaySpan');
                } else {
                    $('#remove6').remove();
                }
            });
            $('#Bday').focusout(function() {
                var val = $(this).val();
                var valday = $('#Bday').val();
                if (val == "") {
                    $('#remove6').remove();
                    $('<span id="remove6" style="color:red">년,일을 정확히 입력해주세요.</span>').appendTo('.bdaySpan');
                } else if (regBday.test(val) === false) {
                    $('#remove6').remove();
                    $('<span id="remove6" style="color:red">두자리숫자만 입력가능합니다</span>').appendTo('.bdaySpan');
                } else {
                    $('#remove6').remove();
                }
            });

            //젠더 선택 테두리만들기
            $('input[type=radio]').change(function() {
                $('input[type=radio]').each(function() {
                    if ($(this).prop('checked')) {
                        $(this).parent().css('border', '1px solid green');
                    } else {
                        $(this).parent().css('border', 'none');
                    }
                });
            });

            $('#msg').click(function() {
                alert('인증번호가 발송되었습니다');
            });

        });

        function finalChk() {

            if ($('#id').val() == "" || $('#pw').val() == "" || $('#name').val() == "" || $('#tel').val() == "" ||
                $('#Byear').val() == "" || $('#Bday').val() == "") {
                alert("입력되지 않은 정보가 있습니다");
                return false;
            }
        }

    </script>
</head>

<body>
    <form action="NaverRegisterAction.jsp" onsubmit="return finalChk()" method="post" enctype="multipart/form-data">
        <div id="page">
            <h1 id="banner">NAVER</h1>
            <div id="content">

                <h4>아이디</h4>
                <span id="chkId">
                <input type="text" class="big" id="id" name="id">
            <label for="id" class="idLabel"></label></span>
                <h4>비밀번호</h4>
                <span>
            <input type="password" class="big" id="pw" name="pw">
            <label for="pw" class="pwLabel"></label></span>
                <h4>비밀번호확인</h4>
                <span>
            <input type="password" class="big" id="pw2">
            <label for="pw2" class="pw2Label"></label></span>
                <h4>이름</h4>
                <span>
            <input type="text" class="big" id="name" name="name">
            <label for="name" class="nameLabel"></label></span>
                <h4>생년월일</h4>
                <span class="bdaySpan">
            <input type="text" class="small" placeholder="년(4자)" id="Byear" name="year">
            <label for="Bday" ></label>
                    
                <select id="Bmonth" name="month">
            <option value="">월</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            </select>
                    
                <input type="text" class="small" placeholder="일" id="Bday" name="day">
                    </span>
                <h4>성별</h4>
                <div class="gender"><input type="radio" id="male" name="gender" value="M"><span class="spanLabel"><label for="male">남성</label></span></div>
                <div class="gender"><input type="radio" id="female" name="gender" value="F"><span class="spanLabel"><label for="female">여성</label></span></div>
                <h4>본인 확인 이메일</h4>
                <span>
            <input type="text" class="big" id="selfCheck" name="email" placeholder="선택 입력">
                </span>
                <h4>휴대전화</h4>
                <select id="address" name="loc">
            <option value="+82">대한민국 +82</option>
                <option></option>
                <option></option>
                <option></option>
                <option></option>
                <option></option>
            </select>
                <span class="telSpan">
                <input id="tel" type="number" placeholder="전화번호 입력" name="phone">
                <label for="tel" class="telLabel"></label>                
                <div id="msg">인증번호받기</div>
                </span>
                <input class="big last" type="text" placeholder="인증번호 입력하세요">
                <div class="photo">사진 업로드</div>
                <input type="file" name="photo" id="photo" class="photo"/>
                <button class="certify final">가입하기</button>

            </div>



        </div>
    </form>
</body>

</html>
