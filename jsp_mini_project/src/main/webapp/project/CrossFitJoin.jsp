<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CrossFit Kirby 회원가입</title>
<link rel="icon" href="../images/Crossfit.png" title="파비콘">
<link rel="stylesheet" href="../css/CrossFitJoin.css">
<style>
/* 모달 스타일 추가 */
.modal {
	display: none; /* 초기에는 숨김 */
	position: fixed;
	z-index: 1;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%); /* 페이지 중앙으로 이동 */
	width: 80%; /* 모달 창 너비 조절 */
	max-width: 400px; /* 최대 너비 설정 */
	background-color: #fefefe;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.modal-content {
	position: relative;
}

.close 0 {
	position: absolute;
	top: 10px;
	right: 10px;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
}

/* 슬라이드 쇼 스타일 수정 */
.slideshow-container {
	position: relative;
	max-width: 1000px;
	margin: auto;
	overflow: hidden;
}

.mySlides {
	display: none;
	width: 100%;
}


</style>
</head>
<body>
	<div>
		<form action="CrossFitJoinSave.jsp" name="join">
			<div>
				<span class="txt_input">아이디 : </span> <input type="text"
					name="userId" required> <input type="button" value="중복확인"
					onclick="fnIdCheck(true)">
			</div>
			<div>
				<span class="txt_input">비밀번호 : </span> <input type="password"
					name="pwd" required>
			</div>
			<div>
				<span class="txt_input">비번확인 : </span> <input type="password"
					name="pwd1" required> <input type="button" value="중복확인"
					onclick="fnPwdCheck()">
			</div>
			<div>
				<span class="txt_input">이름 : </span><input type="text" name="name"
					required>
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
				<label><span class="select_input">성 별 :</span></label> <label><input
					type="radio" name="gender" value="남성" checked>남성</label> <label><input
					type="radio" name="gender" value="여성">여성 </label>
			</div>
			<div>
				<span class="txt_input">생년월일 : </span> <input type="text"
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
				<span class="txt_input">주소 :</span><input type="text" name="address"
					placeholder="지역">
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
				<span class="txt_input">회원등급 :</span> <select name="membership">
					<option value="일반회원">일반회원</option>
					<option value="코치님">코치님</option>
					<option value="대표님">대표님</option>
				</select>
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
				<input type="submit" value="가입하기" onclick="return validateForm()">
				<input type="reset" value="초기화">
				<input type="button" value="되돌아가기" onclick="history.back()">
			</div>
		</form>
	</div>
	<!-- 모달 창 -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<p id="modalMessage"></p>
		</div>
	</div>
</body>

</html>
<script>
	var regex = /^[a-zA-Z0-9!@#$%^&*()_+{}\[\]:;<>,.?~\\-]{4,12}$/;
	var koreanOnly = /^[가-힣]+$/;
	var join = document.join;
	var idCheckPopup;

	/* 폼 제출 전에 유효성 검사 */
	function validateForm() {
		// 중복 확인과 비밀번호 확인 결과를 변수에 저장
		var isIdValid = fnIdCheck(false);
		var isPwdValid = fnPwdCheck();
		
		// 중복 확인과 비밀번호 확인 결과에 따라 처리
		if (!isIdValid || !isPwdValid) {
			// 문제가 있으면 모달 창을 열어 메시지를 표시하고 폼 제출을 막음
			openModal("입력한 정보를 다시 확인해주세요.");
			return false;
		}

		// 추가적인 유효성 검사 로직을 여기에 추가할 수 있습니다.
		// 모든 검사를 통과하면 true를 반환하여 폼을 제출
		return true;
	}

	/* 아이디 중복확인 */
	function fnIdCheck(flg) {
		var id = join.userId.value;

		if (id == "" || id == undefined || id == null) {
			// 모달 창을 열어 메시지를 표시
			openModal("아이디를 입력해 주세요.");
			return false;
		} else if (!regex.test(id)) {
			// 모달 창을 열어 메시지를 표시
			openModal("아이디를 숫자, 영어, 특수문자만 입력 가능하며, 4자에서 12자 이하로 입력해 주세요.");
			return false;
		}
		// 중복 확인 팝업 창이 이미 열려있는 경우 닫기
		if (idCheckPopup && !idCheckPopup.closed) {
			idCheckPopup.close();
		}
		if (flg) {
			idCheckPopup = window.open("CrossFitJoinIdCheck.jsp?userId=" + id,
					"중복확인", "width=500,height=500");
		}
		// 중복 확인 팝업 창 열기

		// 팝업 창이 로드되면 스크롤 조정
		idCheckPopup.onload = function() {
			var windowHeight = window.innerHeight
					|| document.documentElement.clientHeight
					|| document.body.clientHeight;
			var formHeight = join.offsetHeight;
			var scrollToY = formHeight > windowHeight ? formHeight / 2 : 0;
			idCheckPopup.scrollTo(0, scrollToY);
		};

		return true;
	}

	/* 비밀번호 중복확인 */
	function fnPwdCheck() {
		var pwd = join.pwd.value;
		var pwd1 = join.pwd1.value;

		if (pwd == "" || pwd == undefined || pwd == null) {
			// 모달 창을 열어 메시지를 표시
			openModal("비밀번호를 입력해 주세요.");
			return false;
		} else if (!regex.test(pwd)) {
			// 모달 창을 열어 메시지를 표시
			openModal("비밀번호를 숫자, 영어, 특수문자만 입력 가능하며, 4자에서 12자 이하로 입력해 주세요.");
			return false;
		}
		if (pwd1 == "" || pwd1 == undefined || pwd1 == null) {
			// 모달 창을 열어 메시지를 표시
			openModal("비밀확인를 입력해 주세요.");
			return false;
		} else if (!regex.test(pwd1)) {
			// 모달 창을 열어 메시지를 표시
			openModal("비밀확인를 숫자, 영어, 특수문자만 입력 가능하며, 4자에서 12자 이하로 입력해 주세요.");
			return false;
		}

		// 두 비밀번호가 일치하는지 확인
		if (pwd !== pwd1) {
			// 모달 창을 열어 메시지를 표시
			openModal("비밀번호와 비밀번호 확인이 일치하지 않습니다. 다시 입력해주세요.");
			join.pwd1.value = "";
			join.pwd1.focus();
			return false;
		} else {
			// 일치할 경우와 불일치할 경우 모두 사용자에게 알림
			// 성공 메시지를 모달 창을 열어 표시
			openModal("비밀번호 확인이 일치합니다.", true);
			return true;
		}
	}

	/* 모달 창 열기 */
	function openModal(message, isSuccessMessage) {
		var modal = document.getElementById("myModal");
		var modalMessage = document.getElementById("modalMessage");

		// 메시지 설정
		modalMessage.innerText = message;

		// 성공 메시지인 경우 스타일 추가
		if (isSuccessMessage) {
			modalMessage.style.color = "green";
		} else {
			modalMessage.style.color = "red";
		}

		// 모달 창 열기
		modal.style.display = "block";
	}

	/* 모달 창 닫기 */
	function closeModal() {
		var modal = document.getElementById("myModal");
		// 모달 창 닫기
		modal.style.display = "none";
	}
	function fnback() {
		
	}
</script>