<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../include/common.jsp" %>
		
	<div id="sitemesh-content">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center py-4">
            <div class="d-block mb-4 mb-md-0">
                <nav aria-label="breadcrumb" class="d-none d-md-inline-block">
                    <ol class="breadcrumb breadcrumb-dark breadcrumb-transparent">
                        <li class="breadcrumb-item"><a href="#"><span class="fas fa-home"></span></a></li>
                        <li class="breadcrumb-item"><a href="#"><spring:message text="系統管理" code="ui.menu.system" /></a></li>
                        <li class="breadcrumb-item active" aria-current="page"><spring:message text="登入紀錄查詢" code="ui.menu.login-log" /></li>
                    </ol>
                </nav>
                <h2 class="h4"><spring:message text="登入紀錄查詢" code="ui.menu.login-log" /></h2>
                <!-- <p class="mb-0">請輸入你想要的查詢條件</p> -->
            </div>
        </div>

		<!-- 成功訊息區 -->
		<c:if test="${not empty successMsg}">
			<div class="row">
				<div class="col-md-12">
					<div class="alert alert-success">
						<h3 class="d-block h5 mb-0"><c:out value="${successMsg}" /></h3>
					</div>
				</div>
			</div>
		</c:if>

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

		<form:form id="form1" action="#" method="POST" modelAttribute="loginLogCriteriaForm">
        <div class="card border-light shadow-sm p-3 pb-4 mb-4">
            <div class="card-header border-light mx-lg-4 p-0 py-3 py-lg-4 mb-4 mb-md-0">
                <h3 class="d-block h5 mb-0"><spring:message text="查詢條件" code="ui.search-criteria" /></h3> 
            </div>
            <div class="card-body p-0 p-md-4">
            	
				<!-- 查詢條件 -->
                <div class="row justify-content-left">
                    <c:if test="${instituteType eq '0'}">
                        <div class="col-12 col-lg-3">
                            <spring:bind path="criteriaInstituteId">
                            <div class="form-group mb-4 ${status.error ? 'has-error' : ''}">
                                <label for="instituteId"><spring:message text="使用機構" code="ui.login-log.criteria-institute-id" /></label>
                                <form:select path="criteriaInstituteId" id="criteriaInstituteId" class="form-select" aria-label="select example">
                                    <form:option value="">
                                        <spring:message text="請選擇" code="ui.option-select" />
                                        <!--請選擇-->
                                    </form:option>
                                    <c:forEach items="${instituteConfigModel}" var="instituteConfig">
                                        <form:option value="${instituteConfig.instituteId}"><c:out value="${instituteConfig.instituteId}-${instituteConfig.instituteName}" /></form:option>
                                    </c:forEach>
                                </form:select>
                                <form:errors path="criteriaInstituteId" />
                            </div>
                            </spring:bind>
                        </div>
                    </c:if>
                    <div class="col-12 col-lg-3">
                        <spring:bind path="criteriaStartDate">
                        <div class="form-group mb-4">
                            <label for="cds"><spring:message text="查詢日期起日" code="ui.login-log.criteria-start-datetime" /></label>
                            <div class="input-group date" id="start_date">
                                <span class="input-group-text"><span class="far fa-calendar-alt"></span></span>
                                <form:input path="criteriaStartDate" class="form-control" id="cds" />
                            </div>
                            <form:errors path="criteriaStartDate" />
                        </div>
                        </spring:bind>
                    </div>
                    <div class="col-12 col-lg-3">
                        <spring:bind path="criteriaEndDate">
                        <div class="form-group mb-4">
                            <label for="cde"><spring:message text="查詢日期迄日" code="ui.login-log.criteria-end-datetime" /></label>
                            <div class="input-group date" id="end_date">
                                <span class="input-group-text"><span class="far fa-calendar-alt"></span></span>
                                <form:input path="criteriaEndDate" class="form-control" id="cde" />
                            </div>
                            <form:errors path="criteriaEndDate" />
                        </div>
                        </spring:bind>
                    </div>
                    <c:if test="${institute.instituteType eq '0'}">
                    <div class="col-12 col-lg-3">
                        <spring:bind path="criteriaInstituteId">
                        <div class="form-group mb-4 ${status.error ? 'has-error' : ''}">
                            <label for="criteriaInstituteId"><spring:message text="使用機構" code="ui.operation-log.institute" /></label>
                            <form:select class="form-select" path="criteriaInstituteId" id="criteriaInstituteId" aria-label="select example">
                                <form:option value="">
									<spring:message text="請選擇" code="ui.option-select"/>
								</form:option>
								<form:options items="${instituteConfigModel}" 
										itemValue="instituteId" itemLabel="instituteName" />
                            </form:select>
                            <form:errors path="criteriaInstituteId" />
                        </div>
                        </spring:bind>
                    </div>
                    </c:if>
                    <div class="col-12 col-lg-3">
                        <spring:bind path="criteriaAccount">
                        <div class="form-group mb-4 ${status.error ? 'has-error' : ''}">
                            <label for="criteriaAccount"><spring:message text="使用者代號" code="ui.login-log.account" /></label>
                            <form:input path="criteriaAccount" class="form-control" id="criteriaAccount" aria-describedby="criteriaAccount" maxlength="100" />
							<form:errors path="criteriaAccount" />
                        </div>
                        </spring:bind>
                    </div>

                </div>
            </div>
        </div>
        
        <div class="table-settings mb-4">
            <div class="row justify-content-right">
                <div class="col-12 col-lg-12 ">
                    <div class="btn-group float-right">
                        <a href="#" id="btnQuery" class="btn btn-sm btn-outline-primary"><spring:message text="查詢" code="btn.query" /></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="card card-body border-light shadow-sm table-wrapper table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <c:if test="${instituteType eq '0'}">
                            <th><spring:message text="使用機構" code="ui.login-log.institute" /></th>
                        </c:if>
                        <th><spring:message text="使用者代號" code="ui.login-log.account" /></th>                     
                        <th><spring:message text="登入時間" code="ui.login-log.issuer-datetime" /></th>
                        <th><spring:message text="令牌有效時間" code="ui.login-log.expired-datetime" /></th>
                        <th><spring:message text="最後活動時間" code="ui.login-log.last-activity-datetime" /></th>
                        <th><spring:message text="令牌簽發單位" code="ui.login-log.issuer" /></th>
                        <th><spring:message text="令牌唯一碼" code="ui.login-log.token-uuid" /></th>
                        <th><spring:message text="執行功能" code="ui.operation" /></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${queryResult.content}" var="entity">
                    <tr>
                        <c:if test="${instituteType eq '0'}">
                            <td><span class="font-weight-normal"><c:out value="${entity.instituteId}" /></span></td>
                        </c:if>
                        <td>
                            <span class="font-weight-normal"><c:out value="${entity.account}"/></span>
                        </td>
                        <td>
                            <span class="font-weight-normal"><admin:LocalDateTimeTagHandler pattern="yyyy-MM-dd HH:mm:ss" dateTime="${entity.issuerDateTime}"/></span>
                        </td>
                        <td>
                            <span class="font-weight-normal"><admin:LocalDateTimeTagHandler pattern="yyyy-MM-dd HH:mm:ss" dateTime="${entity.expirationDateTime}"/></span>
                        </td>
                        <td>
                            <span class="font-weight-normal"><admin:LocalDateTimeTagHandler pattern="yyyy-MM-dd HH:mm:ss" dateTime="${entity.lastActivityDateTime}"/></span>
                        </td>
                        <td>
                            <span class="font-weight-normal"><c:out value="${entity.issuer}"/></span>
                        </td>
                        <td>
                            <span class="font-weight-normal"><c:out value="${entity.tokenUUID}"/></span>
                        </td>
                        <td>
                            <div class="btn-group">
                                <button class="btn btn-link text-dark dropdown-toggle dropdown-toggle-split m-0 p-0" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="icon icon-sm">
                                        <span class="fas fa-ellipsis-h icon-dark"></span>
                                    </span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="./detail?tokenUUID=${entity.tokenUUID}" id="detail"><span class="fas fa-file-alt mr-2"></span><spring:message text="明細" code="btn.detail" /></a>
                                </div>
                            </div>
                        </td>
                    </tr>
					</c:forEach>
                </tbody>
            </table>
            <!-- /#page-wrapper -->
			<!-- paginator -->
			<c:if test="${not empty queryResult.content}">
				<admin:PaginatorTagHandler formId="form1" pagingUri="./query" page="${queryResult}" />
			</c:if>
        </div>
        </form:form>
	</div>
	
	<!-- Custom Page JavaScript -->
	<div id="sitemesh-script">
		<script type="text/javascript">
			$(document).ready(function() {
				$("#btnQuery").click(function() {
					$("#form1").attr("action", "./query");
					$('#form1').submit();
				});
				
				const startDate = document.querySelector('input[id="cds"]');
	            const datepicker1 = new Datepicker(startDate, {
	                  // options here
	            	  format: 'yyyy-mm-dd',
	            	  maxDate: new Date()
	            });
	            const endDate = document.querySelector('input[id="cde"]');
	            const datepicker2 = new Datepicker(endDate, {
	                  // options here
	            	  format: 'yyyy-mm-dd',
	            	  maxDate: new Date()
	            });
	            
			});
		</script>
	</div>