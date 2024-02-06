<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../include/common.jsp"%>
<!DOCTYPE html>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Veri-id ADM</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="">
<meta name="description" content="">

<!-- Favicon -->
<link rel="apple-touch-icon" sizes="120x120"
	href="${pageContext.request.contextPath}/img/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/img/favicon/favicon-16x16.png">
<link rel="manifest"
	href="${pageContext.request.contextPath}/img/favicon/site.webmanifest">
<link rel="mask-icon"
	href="${pageContext.request.contextPath}/img/favicon/safari-pinned-tab.svg"
	color="#ffffff">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="theme-color" content="#ffffff">

<link type="text/css"
	href="${pageContext.request.contextPath}/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/vendor/sweetalert2/dist/sweetalert2.min.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/vendor/notyf/notyf.min.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/vendor/fullcalendar/main.min.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/vendor/dropzone/dist/min/dropzone.min.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/vendor/choices.js/public/assets/styles/choices.min.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/vendor/leaflet/dist/leaflet.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/css/volt.css" rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/webjars/datatables/1.10.12/css/jquery.dataTables.min.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/css/hiTrustPay.css"
	rel="stylesheet">

<!-- scripts -->
<%@include file="../include/scripts.jsp"%>

<!-- Custom JavaScript -->
<script type="text/javascript">
	$(function() {

		// 聲明：控件。
		var $form = $("<form action='#'></form>");
		var $changePassword = $("#change-password");
		var $logout = $("#logout");

		// 事件(1): 點擊[修改密碼]。
		// 		$changePassword.on("click", function(event) {
		// 			$form.attr("action", "./../index/edit_password");
		// 			$form.attr("method", "get");
		// 			$form.submit();
		// 		});

		// 事件(2): 點擊[管理員登出]。
		$logout.on("click", function(event) {
			$form.attr("action", "./../index/logout");
			$form.attr("method", "post");
			$form.submit();
		});

		// 初始程序。
		$("body").append($form);

		//--------------------------------------------
		// 聲明：控件。
		var $form1 = $("#form1");
		var $account = $("#account");
		var $random8digits = $("#random8digits");
		var $oldPassword = $("#old-password");
		var $newPassword = $("#new-password");
		var $confirmPassword = $("#confirm-password");
		var $encryptPassword = $("#encryptPassword");
		var $encryptNewPassword = $("#encryptNewPassword");
		// 前台訊息
		var $error = $("#error");
		var $errorFormatStyle = $("#error-format-style");
		var $errorOldEqNew = $("#error-old-equals-new");
		var $errorNewNotEqConfirm = $("#error-new-not-equals-confirm");

		// 事件(1): 點擊[提交]
		$("#btnSubmit").click(function() {
			if (validate() == true) {
				$form1.attr("action", "./register");
				$form1.attr("method", "post");
				$form1.submit();
			}
		});

		// 方法(1): 前台驗證。
		function validate() {

			var regExp = new RegExp("^[A-Za-z0-9]{6,12}$");

			// 去除空白字符。
			$oldPassword.val(String($oldPassword.val()).trim());
			$newPassword.val(String($newPassword.val()).trim());
			$confirmPassword.val(String($confirmPassword.val()).trim());

			// 除了舊密碼空白之外，要做驗證。
			if ($oldPassword.val().length != 0) {

				// 驗證1：新密碼格式
				if (regExp.test($newPassword.val()) == false) {
					$error.removeClass("hidden");
					$error.find("span").addClass("hidden");
					$errorFormatStyle.removeClass("hidden");
					$newPassword.focus();
					return false;
				}

				// 驗證2: 舊密碼 == 新密碼
				if ($oldPassword.val() == $newPassword.val()) {
					$error.removeClass("hidden");
					$error.find("span").addClass("hidden");
					$errorOldEqNew.removeClass("hidden");
					$newPassword.focus();
					return false;
				}

				// 驗證3: 新密碼 != 驗證密碼
				if ($newPassword.val() != $confirmPassword.val()) {
					$error.removeClass("hidden");
					$error.find("span").addClass("hidden");
					$errorNewNotEqConfirm.removeClass("hidden");
					$confirmPassword.focus();
					return false;
				}
			} else {
				$error.addClass("hidden");
			}

			return true;
		}

	});
</script>

<!-- Style -->
<style type="text/css">
.hidden {
	display: none;
}
</style>

</head>
<body>

	<div
		class="preloader bg-soft flex-column justify-content-center align-items-center">
		<img class="loader-element animate__animated animate__jackInTheBox"
			src="${pageContext.request.contextPath}/img/brand/light.svg"
			height="60" alt="Volt logo">
	</div>

	<!-- 功能實作區 -->
	<section class="d-flex align-items-center my-5 mt-lg-6 mb-lg-5">
		<div class="container">
			<div class="row justify-content-center form-bg-image">
				<div class="col-12 d-flex align-items-center justify-content-center">
					<div
						class="bg-white shadow-soft border rounded border-light p-4 p-lg-5 w-100 fmxw-500">
						<div class="text-center text-md-center mb-4 mt-md-0">
							<h3 class="mb-0 h3">
								<spring:message text="註冊新會員"
									code="ui.change-password.first-login" />
							</h3>
						</div>

						<form:form id="form1" action="#" modelAttribute="member">
							<!-- 錯誤訊息區 -->
							<c:if test="${not empty errors}">
								<div class="row">
									<div class="col-md-12">
										<div class="alert alert-danger">
											<p class="fas fa-exclamation-triangle" style="color: red;">
												<c:out value="${errors}" />
											</p>
										</div>
									</div>
								</div>
							</c:if>
							<div class="row hidden" id="error">
								<div class="col-md-12 alert alert-danger">
									<p class="fas fa-exclamation-triangle" style="color: red;">
										<span id="error-format-style"> <spring:message text=""
												code="warn.change-password.format-style" /> <!-- 密碼請輸入 6 到 12 位英數字！ -->
										</span> <span id="error-old-equals-new"> <spring:message
												text="" code="warn.change-password.old-equals-new" /> <!-- 原始密碼與新密碼相同！ -->
										</span> <span id="error-new-not-equals-confirm"> <spring:message
												text="" code="warn.change-password.new-not-equals-confirm" />
											<!-- 新密碼與確認密碼不相同！ -->
										</span>
									</p>
								</div>
							</div>

							<!-- 用戶輸入區 -->
							<div class="mt-4">
								<div class="form-group">
									<!-- 登錄帳號 -->
									<spring:bind path="account">
										<div
											class="form-group mb-4 ${status.error ? 'has-error' : ''}">
											<label for="account"><spring:message text="登錄帳號"
													code="ui.login.account" /></label>
											<div class="input-group">
												<span class="input-group-text" id="basic-addon0"><span
													class="fas fa-user"></span></span>
												<form:input path="account" class="form-control" id="account"
													maxlength="20" />
											</div>
											<form:errors path="account" class="text-danger" />
										</div>
									</spring:bind>
									<!-- 原始密碼 -->
									<spring:bind path="password">
										<div
											class="form-group mb-4 ${status.error ? 'has-error' : ''}">
											<label for="old-password"><spring:message text="原始密碼"
													code="ui.change-password.old-password" />${req}</label>
											<div class="input-group">
												<span class="input-group-text" id="basic-addon2"><span
													class="fas fa-unlock-alt"></span></span>
												<form:password path="password" class="form-control"
													id="old-password" maxlength="12" />
											</div>
											<form:errors path="password" class="text-danger" />
										</div>
									</spring:bind>
									<spring:bind path="phone">
										<div
											class="form-group mb-4 ${status.error ? 'has-error' : ''}">
											<label for="phone"><spring:message text="電話"
													code="ui.login.account" /></label>
											<div class="input-group">
												<span class="input-group-text" id="basic-addon0"><span
													class="fas fa-user"></span></span>
												<form:input path="phone" class="form-control" id="phone"
													maxlength="20" />
											</div>
											<form:errors path="phone" class="text-danger" />
										</div>
									</spring:bind>
									<spring:bind path="email">
										<div
											class="form-group mb-4 ${status.error ? 'has-error' : ''}">
											<label for="account"><spring:message text="E-mail"
													code="ui.login.account" /></label>
											<div class="input-group">
												<span class="input-group-text" id="basic-addon0"><span
													class="fas fa-user"></span></span>
												<form:input path="email" class="form-control" id="email"
													maxlength="20" />
											</div>
											<form:errors path="email" class="text-danger" />
										</div>
									</spring:bind>
									<spring:bind path="address">
										<div
											class="form-group mb-4 ${status.error ? 'has-error' : ''}">
											<label for="address"><spring:message text="地址"
													code="ui.login.account" /></label>
											<div class="input-group">
												<span class="input-group-text" id="basic-addon0"><span
													class="fas fa-user"></span></span>
												<form:input path="address" class="form-control" id="address"
													maxlength="20" />
											</div>
											<form:errors path="address" class="text-danger" />
										</div>
									</spring:bind>

									<spring:bind path="creditCard">
										<div
											class="form-group mb-4 ${status.error ? 'has-error' : ''}">
											<label for="creditCard"><spring:message text="卡號"
													code="ui.login.account" /></label>
											<div class="input-group">
												<span class="input-group-text" id="basic-addon0"><span
													class="fas fa-user"></span></span>
												<form:input path="creditCard" class="form-control" id="creditCard"
													maxlength="20" />
											</div>
											<form:errors path="creditCard" class="text-danger" />
										</div>
									</spring:bind>
									<!-- 新密碼 -->
									<div class="form-group mb-4">
										<label for="new-password"><spring:message text="新密碼"
												code="ui.change-password.new-password" />${req}</label>
										<div class="input-group">
											<span class="input-group-text" id="basic-addon3"><span
												class="fas fa-unlock-alt"></span></span> <input type="password"
												class="form-control" id="new-password" maxlength="12" />
										</div>
									</div>
									<!-- 再次確認 -->
									<div class="form-group mb-4">
										<label for="confirm-password"><spring:message
												text="再次確認" code="ui.change-password.confirm-password" />${req}</label>
										<div class="input-group">
											<span class="input-group-text" id="basic-addon4"><span
												class="fas fa-unlock-alt"></span></span> <input type="password"
												class="form-control" id="confirm-password" maxlength="12" />
										</div>
									</div>

								</div>
								<!-- 確認按鍵 -->
								<a id="btnSubmit" class="btn btn-block btn-primary"><spring:message
										text="確定" code="ui.login.submit" /></a>

							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>
