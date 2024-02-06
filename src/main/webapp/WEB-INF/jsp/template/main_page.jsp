<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>

<head> 
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>
    rule-engine-adm
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
<link type="text/css" href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
	<!-- scripts -->
    <%@include file="../include/scripts.jsp" %>

	<!-- Custom JavaScript -->
	<script type="text/javascript">
		$(function() {
	
			// 聲明：控件。
			var $form = $("<form action='#'></form>");
			var $changePassword = $("#change-password");
			var $logout = $("#logout");
            var allow_language = "${languages}";
            var txt1 = '<div class="dropdown-divider"></div>';
            var txt2 = $("<li></li>").text("").addClass("fa fa-check");
            var text_cn = $('#local_cn');
            text_cn.text("简体中文");
			
			// 事件(1): 點擊[修改密碼]。
			$changePassword.on("click", function(event) {
				$form.attr("action", "./../index/password");
				$form.attr("method", "get");
				$form.submit();
			});
			
			// 事件(2): 點擊[管理員登出]。
			$logout.on("click", function(event) {
				$form.attr("action", "./../index/logout");
				$form.attr("method", "post");
				$form.submit();
			});
			
			// 初始程序。
			$("body").append($form);
	        
	        // 關閉 autocomplete
	        $("input").each(function(){
	            $(this).attr("autocomplete", "off");
	        });
	        
	        // 數字欄位輸入檢核
	        $("[data-type='numeric']").keyup(function(){
	            if (isNaN($(this).val())) {
	                $(this).val("");
	            }
	        });
	        
	        // 刪除確認
	        $("[id^='btnDelete_']").click(function(){
	            if (!confirm('<spring:message text="" code="ui.confirm.delete"/>')) {
	                return false;
	            }
	        });
	        
	     	// 關閉確認
	        $("[id^='btnClose_']").click(function(){
	            if (!confirm('<spring:message text="" code="ui.confirm.close"/>')) {
	                return false;
	            }
	        });
	        
	        <%--// 存檔確認--%>
	        <%--$("[id='btnSave']").click(function(){--%>
	        <%--    if (!confirm('<spring:message text="" code="ui.confirm.save"/>')) {--%>
	        <%--        return false;--%>
	        <%--    }--%>
	        <%--});--%>
	      	
	     	// 啟用確認
	        $("[id^='btnEnable_']").click(function(){
	            if (!confirm('<spring:message text="" code="ui.confirm.enable"/>')) {
	                return false;
	            }
	        });
	     	
	     	// 停用確認
	        $("[id^='btnDisable_']").click(function(){
	            if (!confirm('<spring:message text="" code="ui.confirm.disable"/>')) {
	                return false;
	            }
	        });
	     	
	     	// 註銷確認
	        $("[id^='btnCancel_']").click(function(){
	            if (!confirm('<spring:message text="" code="ui.confirm.cancel"/>')) {
	                return false;
	            }
	        });

            // 如果沒有開放語系預設為全開放
            if(allow_language === "" || allow_language == null){
                $('#local_en').addClass("show-up");
                $('#local_en').after(txt1);
                $('#local_tw').addClass("show-up");
                $('#local_tw').after(txt1);
                $('#local_cn').addClass("show-up");
            }
            // 驗證語系
            if(allow_language.indexOf("en_US") == 0){
                $('#local_en').addClass("show-up");
                $('#local_en').after(txt1);
            }

            if(allow_language.indexOf("zh_TW") > 0){
                $('#local_tw').addClass("show-up");
                $('#local_tw').after(txt1);
            }

            if(allow_language.indexOf("zh_CN") > 0){
                $('#local_cn').addClass("show-up");
            }
            
            $('#local_en').click(function(){
            	$('#local_en').attr('href',"<c:out value="${pageContext.request.contextPath}"/>/index/main?lang=en_US");
            });
            
			$('#local_tw').click(function(){
				$('#local_tw').attr('href',"<c:out value="${pageContext.request.contextPath}"/>/index/main?lang=zh_TW");                   	
            });
			
			$('#local_cn').click(function(){
				$('#local_cn').attr('href',"<c:out value="${pageContext.request.contextPath}"/>/index/main?lang=zh_CN");                 	
            });

		});
	</script>

	<!-- Style -->
	<style type="text/css">
		.hidden{ 
		    display: none;
		}
		@media (max-width: 691px) {
	       	.dropdown-local {
	       		right: auto;
	       		left: 0;
	       	}
      	    }
       
        @media (min-width: 692px) {
           .dropdown-local {
             right: 0;
             left: auto;
           }
       } 
       .show-up {
       		display: block !important;
       }
	</style>

</head>
<body>

    <nav class="navbar navbar-dark navbar-theme-primary px-4 col-12 d-md-none">
        <a class="navbar-brand mr-lg-5" href="/">
            <img class="navbar-brand-dark"  src="${pageContext.request.contextPath}/img/brand/light.svg" alt="Volt logo" /> 
            <img class="navbar-brand-light" src="${pageContext.request.contextPath}/img/brand/dark.svg"  alt="Volt logo" />
        </a>
        <div class="d-flex align-items-center">
            <button class="navbar-toggler d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </nav>

    <!-- sidebar -->
<%--     <script type="text/javascript" src="${pageContext.request.contextPath}/js/sidebar.js"></script> --%>
	
	<nav id="sidebarMenu" class="sidebar d-md-block bg-primary text-white collapse" data-simplebar>
        <div class="sidebar-inner px-4 pt-3">
            <div class="user-card d-flex d-md-none align-items-center justify-content-between justify-content-md-center pb-4">
            <div class="collapse-close d-md-none">
                <a href="#sidebarMenu" class="fas fa-times" data-toggle="collapse"
                    data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="true"
                    aria-label="Toggle navigation"></a>
            </div>
            </div>
            <ul class="nav flex-column pt-3 pt-md-0">
            
			<admin:MenuTag grantedAccessIdList="${grantedAccessIdList}" locale="${locale}"/>
			
            </ul>
        </div>
    </nav>


    <main class="content">

        <!-- navigation -->
        <%@include file="../include/navigation.jsp" %>

        <div class="preloader bg-soft flex-column justify-content-center align-items-center">
            <img class="loader-element animate__animated animate__jackInTheBox" src="${pageContext.request.contextPath}/img/brand/light.svg" height="60" alt="Volt logo">
        </div>

        <!-- 功能實作區 -->
        <sitemesh:write property='div.sitemesh-header'/>
        
		<sitemesh:write property='div.sitemesh-content'/>


        <!-- footer -->
<%--         <%@include file="../include/footer.jsp" %> --%>

    </main>
	
	<!-- Custom Page JavaScript -->
    <sitemesh:write property='div.sitemesh-script'/>

    <script>
        $(function(){
            $(".btn").each(function(){
                $(this).attr("data-loading-text", "<i class='fa fa-spinner fa-spin '></i> " + $(this).html());
            });

            $("[data-loading-text]").click(function(event){

                if (event.isPropagationStopped() ) {
                    return false;
                }
                if($(this).attr("id") =="save"){
                    return false;
                }
                if($(this).attr("id") =="btnDelete"){
                    return false;
                }
                if ($(this).attr("id") == 'btnReset') {
                    return true;
                }
                if ($(this).attr("id") == 'btnDownload') {
                    return true;
                }
                if ($(this).attr("id") == 'btnShowJson') {
                    return true;
                }
                if ($(this).attr("id") == 'btnShowDiv') {
                    return true;
                }
                if ($(this).attr("ignore-spin") == 'Y') {
                    return true;
                }
                //配置下载模板按钮不出现loading
                if ($(this).attr("id") == 'downloadExcelTemplate') {
                    return true;
                }
                //配置下载按钮不出现loading
                if ($(this).attr("id") == 'batchDownload') {
                    return true;
                }
                if($(this).attr("id") == 'hashContent'){
                    return true;
                }
                if($(this).attr("id") == 'export'){
                    return true;
                }
                if($(this).attr("data-toggle") == "dropdown"){
                    return true;
                }
                if($(this).attr("id") == 'hmacContent'){
                    return true;
                }
                if ($(this).attr("id") == 'sidebar-toggle'){
                    return true;
                }
                //dataObject处理修改按钮不点击后直接加载loading
                if ($(this).attr("not_loading") == 'true'){
                    return true;
                }
                if ($(this).attr("id") == 'formReset'){
                    return true;
                }

                $(this).button('loading');
            });

            //新增placeholder动态语系
            let placeholderDom = $(".renderPlaceholder");
            for (let dom of placeholderDom) {
                let placeholderVal = $(dom).attr("placeholder");
                let prefix = <spring:message text="ex: " code="ui.rule-engine.search.placeholder.prefix"/>;
                if (placeholderVal.indexOf("ex: ") > -1) {
                    placeholderVal = placeholderVal.split("ex: ")[1];
                    $(dom).attr("placeholder",prefix + placeholderVal);
                }
            }
        })
    </script>
</body>
</html>
