<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>

<head> 
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>
    Veri-id ADM
</title>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="">
<meta name="description" content="">

<!-- Favicon -->
<link rel="apple-touch-icon" sizes="120x120" href="${pageContext.request.contextPath}/img/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/img/favicon/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/img/favicon/site.webmanifest">
<link rel="mask-icon" href="${pageContext.request.contextPath}/img/favicon/safari-pinned-tab.svg" color="#ffffff">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="theme-color" content="#ffffff">

<link type="text/css" href="${pageContext.request.contextPath}/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/vendor/notyf/notyf.min.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/vendor/fullcalendar/main.min.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/vendor/dropzone/dist/min/dropzone.min.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/vendor/choices.js/public/assets/styles/choices.min.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/vendor/leaflet/dist/leaflet.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/css/volt.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/webjars/datatables/1.10.12/css/jquery.dataTables.min.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/css/hiTrustPay.css" rel="stylesheet">

	<!-- scripts -->
    <%@include file="../include/scripts.jsp" %>

	<!-- Custom JavaScript -->
	<script type="text/javascript">
		$(function() {
	        
	        // 關閉 autocomplete
	        $("input").each(function(){
	            $(this).attr("autocomplete", "off");
	        });
	
			// 聲明：控件。
			var $account = $("#account");
			var $password = $("#password");
			var $locale = $("#locale");
			var $random8digits = $("#random8digits");
			var $encrypt = $("#encrypt");
			var $remember = $("#remember");
			// 聲明: 常數。
			var STORAGE_LOGIN = "acs@admin";
			// 聲明: 實例。
			var loginItem = null;		// 放置: 本地儲存的實例。
			var loginValue = null;		// 放置: 儲存值(JSON)。
			// 聲明: local 變數。
			var hint = "";
			
			// 事件(1)：點擊[登錄]。
			$("#btnLogin").click(function() {			
				// 3. 提交表單。
				$("#form1").attr("action", "./login");
				$("#form1").submit();
			});

	</script>
	
	<!-- Style -->
	<style type="text/css">
		.btn-light{
		border: none;
		background-color: white;
		color: black;
		width: 100%;
		}
		
		.hidden{ 
		    display: none;
		}
		.btn-primary:
	</style>

</head>
<body>
    
        <div class="preloader bg-soft flex-column justify-content-center align-items-center">
            <img class="loader-element animate__animated animate__jackInTheBox" src="${pageContext.request.contextPath}/img/brand/light.svg" height="60" alt="Volt logo">
        </div>

        <!-- 功能實作區 -->
        <section class="d-flex align-items-center my-5 mt-lg-6 mb-lg-5">
	         <div class="container">
	               <div class="row justify-content-center form-bg-image" data-background-lg="${pageContext.request.contextPath}/img/illustrations/signin.svg">
	                  <div class="col-12 d-flex align-items-center justify-content-center">
	                     <div class="bg-white shadow-soft border rounded border-light p-4 p-lg-5 w-100 fmxw-500">
	                           <div class="text-center text-md-center mb-4 mt-md-0">
	                              <h1 class="mb-0 h3"><spring:message text="用戶登錄" code="ui.login.admin-header" /></h1>
	                           </div>
	                           
	                           <form:form id="form1" action="#" modelAttribute="form">
	                           <!-- 錯誤訊息區 -->
								<c:if test="${not empty errors}">
									<div class="row">
										<div class="col-md-12">
											<div class="alert alert-danger">
												<p class="fas fa-exclamation-triangle" style="color:red;">
													<c:out value="${errors}" />
												</p>
											</div>
										</div>
									</div>
								</c:if>
								<!-- 成功訊息區 -->
								<c:if test="${not empty successMsg}">
									<div class="row">
										<div class="col-md-12">
											<div class="alert alert-success">
												<p class="fas fa-exclamation-triangle" style="color:green;">
													<c:out value="${successMsg}"/>
												</p>
											</div>
										</div>
									</div>
								</c:if>  
							   
							   <!-- 用戶輸入區 -->	
	                           <div class="mt-4">
	                              <div class="form-group">
	                              	 <!-- 收單機構代號 -->
	                              	 <!-- 登錄帳號 -->
	                                 <spring:bind path="account">
	                                 <div class="form-group mb-4 ${status.error ? 'has-error' : ''}">
	                                    <label for="account"><spring:message text="登錄帳號" code="ui.login.account" /></label>
	                                    <div class="input-group">
	                                       <span class="input-group-text" id="basic-addon1"><span class="fas fa-user"></span></span>
	                                       <form:input path="account" class="form-control" autofocus="false" autocomplete="false" id="account" maxlength="20" />
	                                    </div>
	                                    <form:errors path="account" class="text-danger" />  
	                                 </div>
	                                 </spring:bind>
	                                 <!-- 登錄密碼 -->
	                                 <spring:bind path="password">
	                                 <div class="form-group mb-4 ${status.error ? 'has-error' : ''}">
	                                    <label for="password"><spring:message text="登錄密碼" code="ui.login.password" /></label>
	                                    <div class="input-group">
	                                       <span class="input-group-text" id="basic-addon2"><span class="fas fa-unlock-alt"></span></span>
	                                       <form:password path="password" class="form-control" id="password" maxlength="12" />
	                                    </div>
	                                    <form:errors path="password" class="text-danger" />  
	                                 </div>
	                                 </spring:bind>
	                                 <!-- 顯示語言 -->
	                                 <spring:bind path="locale">
	                                 <div class="form-group  ${status.error ? 'has-error' : ''}">
	                                    <label for="locale"><spring:message text="顯示語言" code="ui.login.locale" /></label>
	                                    <form:select path="locale" class="form-select mb-4" id="locale" >
	                                       	<form:option value="zh-TW">
												<spring:message text="繁體中文" code="ui.login.locale.1.zh-TW" />
											</form:option>
											<form:option value="zh-CN">
												<spring:message text="简体中文" code="ui.login.locale.2.zh-CN" />
											</form:option>
											<form:option value="en-US">
												<spring:message text="English" code="ui.login.locale.3.en-US" />
											</form:option>
	                                    </form:select>
	                                 </div>
	                                 </spring:bind>
	                                  <a class="btn btn-light btn-primary"  href="./register"><spring:message text="註冊"></spring:message></a>
	                              </div>
	                             
								  <!-- 確認按鍵 -->
	                              <a id="btnLogin" class="btn btn-block btn-primary"><spring:message text="確定" code="ui.login.submit" /></a>	                              							  
	                              
	                           </div>
	                           </form:form>
	                     </div>
	                  </div>
	               </div>
	         </div>
	    </section>
		
		<div style="text-align: center;"><spring:message text="技術提供：" code="ui.main.technology-provides" /><br><img src="${pageContext.request.contextPath}/img/hitrust_logo.svg" alt="" width="20%"></div>

        <!-- footer -->
        <%@include file="../include/footer.jsp" %>

</body>
</html>
