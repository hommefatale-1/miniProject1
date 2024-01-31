<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CrossFit join</title>
    <link rel="icon" href="../images/Crossfit.png" title="파비콘">
    <link rel="stylesheet" href="../css/CrossfitJoin.css">
</head>
<body>
	<div >
		<form action="CrossFitJoinSave.html" name="join">
			<div>
				<span class="txt_input">아이디 : </span><input type="text"
					name="userId"> <input type="button" value="중복확인"
					onclick="idCheck()">
			</div>
			<div>
				<span class="txt_input">비밀번호 : </span><input type="text" name="pwd">
			</div>
			<div>
				<span class="txt_input">비번확인 : </span><input type="password"
					name="pwd1">
			</div>
			<div>
				<span class="txt_input">이름 : </span><input type="text" name="name">
			</div>
			<div>
				<span class="select_input">연락처 :</span> <select name="phone1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="019">019</option>
				</select> - <input type="text" maxlength="4" size="4" name="phone2">
				- <input type="text" maxlength="4" size="4" name="phone3">
			</div>
			<div>
				<label><span class="select_input">성 별 :</span> </label> <label><input
					type="radio" name="gender" value="남성" checked>남성</label> <label><input
					type="radio" name="gender" value="여성">여성 </label>
			</div>
			<div>
				<span class="txt_input">생년월일 : </span> <input type="number"
					maxlength="4" size="4" name="birth_Year" placeholder="태어난년도">
				<select name="birth_Month">
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select> <select name="birth_Day">
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select>
			</div>
			<div>
				<span class="txt_input">등록날 :</span><input type="date"
					name="registration">
			</div>
			<div>
				<span class="txt_input">기간시작 :</span><input type="date" name="start">
			</div>
			<div>
				<span class="txt_input">기간끝 :</span><input type="date" name="end">
			</div>
			<div>
				<span class="select_input">취 미 :</span><input type="text"
					name="hobby">

			</div>
			<div>
				<textarea name="comment" rows="20" cols="50"
					placeholder="가입인사를 입력해주세요."></textarea>
			</div>
			<div>
				<input type="submit" value="가입하기"> <input type="reset"
					value="초기화">
			</div>
		</form>
	</div>
</body>

</html>
<script>
	var join = document.join;
	function idCheck() {
		var id = join.userId.value;
		if (id == "" || id == undefined || id == "NULL") {
			alert("아이디를 입력해 주세요.");
			return;
		}
		var pop = window.open("user_idCheck.jsp?userId=" + join.userId.value,
				"중복확인", "width=300,height=300");
	}
	window.onload = function() {
		var windowHeight = window.innerHeight
				|| document.documentElement.clientHeight
				|| document.body.clientHeight;
		var formHeight = document.forms["join"].offsetHeight;
		var scrollToY = formHeight > windowHeight ? formHeight / 2 : 0;
		window.scrollTo(0, scrollToY);
	};
</script>