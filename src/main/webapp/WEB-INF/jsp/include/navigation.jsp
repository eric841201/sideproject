	<%@page contentType="text/html" pageEncoding="UTF-8"%>
	<style>
	  #sidebar-toggle {
	    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0); /* 初始陰影效果透明 */
	  }
	
	  #sidebar-toggle:hover {
	    transform: scale(1.1); 
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* 添加陰影效果，讓按鈕看起來浮起來 */
	  }
	</style>
	<nav class="navbar navbar-top navbar-expand navbar-dashboard navbar-dark pl-0 pr-2 pb-0">
      <div class="container-fluid px-0">
      <div class="d-flex justify-content-between w-100" id="navbarSupportedContent">
          <div class="d-flex align-items-center">
          <button id="sidebar-toggle" class="sidebar-toggle mr-3 btn btn-icon-only btn-lg btn-circle d-none d-md-inline-block">
			  <span class="fas fa-bars"></span>
		  </button>

          </div>
          <!-- Navbar links -->
          <ul class="navbar-nav align-items-center">
           <li class="">
            <a class="nav-link text-dark mr-lg-3 " data-unread-notifications="true" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <span class="icon icon-sm">
                  <span class="fa fa-globe"></span>                            
              </span>
            </a>
          	<div class="dropdown-menu dashboard-dropdown dropdown-menu-right mt-2">
              	<a href="#" lang="en_US" id="local_en" class="dropdown-item font-weight-bold">English</a>
              	<a href="#" lang="zh_TW" id="local_tw" class="dropdown-item font-weight-bold">繁體中文</a>
              	<a href="#" lang="zh-CN" id="local_cn" class="dropdown-item font-weight-bold">簡體中文</a>
            </div>
          </li>
<!--           <li class="nav-item dropdown"> -->
<!--               <a class="nav-link text-dark mr-lg-3 icon-notifications" data-unread-notifications="true" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!--               <span class="icon icon-sm"> -->
<!--                   <span class="fas fa-bell bell-shake"></span> -->
<!--                   <span class="icon-badge rounded-circle unread-notifications"></span> -->
<!--               </span> -->
<!--               </a> -->
<!--               <div class="dropdown-menu dashboard-dropdown dropdown-menu-lg dropdown-menu-center mt-2 py-0"> -->
<!--               <div class="list-group list-group-flush"> -->
<!--                   <a href="#" class="text-center text-primary font-weight-bold border-bottom border-light py-3">Notifications</a> -->
<!--                   <a href="/calendar.html" class="list-group-item list-group-item-action border-bottom border-light"> -->
<!--                   <div class="row align-items-center"> -->
<!--                       <div class="col-auto"> -->
<!--                           Avatar -->
<%--                           <img alt="Image placeholder" src="${pageContext.request.contextPath}/img/team/profile-picture-1.jpg" class="user-avatar lg-avatar rounded-circle"> --%>
<!--                       </div> -->
<!--                       <div class="col pl-0 ml--2"> -->
<!--                           <div class="d-flex justify-content-between align-items-center"> -->
<!--                               <div> -->
<!--                               <h4 class="h6 mb-0 text-small">Jose Leos</h4> -->
<!--                               </div> -->
<!--                               <div class="text-right"> -->
<!--                               <small class="text-danger">a few moments ago</small> -->
<!--                               </div> -->
<!--                           </div> -->
<!--                           <p class="font-small mt-1 mb-0">Added you to an event "Project stand-up" tomorrow at 12:30 AM.</p> -->
<!--                       </div> -->
<!--                   </div> -->
<!--                   </a> -->
<!--                   <a href="/tasks.html" class="list-group-item list-group-item-action border-bottom border-light"> -->
<!--                   <div class="row align-items-center"> -->
<!--                       <div class="col-auto"> -->
<!--                           Avatar -->
<%--                           <img alt="Image placeholder" src="${pageContext.request.contextPath}/img/team/profile-picture-2.jpg" class="user-avatar lg-avatar rounded-circle"> --%>
<!--                       </div> -->
<!--                       <div class="col pl-0 ml--2"> -->
<!--                           <div class="d-flex justify-content-between align-items-center"> -->
<!--                               <div> -->
<!--                               <h4 class="h6 mb-0 text-small">Neil Sims</h4> -->
<!--                               </div> -->
<!--                               <div class="text-right"> -->
<!--                               <small class="text-danger">2 hrs ago</small> -->
<!--                               </div> -->
<!--                           </div> -->
<!--                           <p class="font-small mt-1 mb-0">You've been assigned a task for "Awesome new project".</p> -->
<!--                       </div> -->
<!--                   </div> -->
<!--                   </a> -->
<!--                   <a href="/tasks.html" class="list-group-item list-group-item-action border-bottom border-light"> -->
<!--                   <div class="row align-items-center"> -->
<!--                       <div class="col-auto"> -->
<!--                           Avatar -->
<%--                           <img alt="Image placeholder" src="${pageContext.request.contextPath}/img/team/profile-picture-3.jpg" class="user-avatar lg-avatar rounded-circle"> --%>
<!--                       </div> -->
<!--                       <div class="col pl-0 ml--2"> -->
<!--                           <div class="d-flex justify-content-between align-items-center"> -->
<!--                               <div> -->
<!--                               <h4 class="h6 mb-0 text-small">Roberta Casas</h4> -->
<!--                               </div> -->
<!--                               <div class="text-right"> -->
<!--                               <small>5 hrs ago</small> -->
<!--                               </div> -->
<!--                           </div> -->
<!--                           <p class="font-small mt-1 mb-0">Tagged you in a document called "First quarter financial plans",</p> -->
<!--                       </div> -->
<!--                   </div> -->
<!--                   </a> -->
<!--                   <a href="/single-message.html" class="list-group-item list-group-item-action border-bottom border-light"> -->
<!--                   <div class="row align-items-center"> -->
<!--                       <div class="col-auto"> -->
<!--                           Avatar -->
<%--                           <img alt="Image placeholder" src="${pageContext.request.contextPath}/img/team/profile-picture-4.jpg" class="user-avatar lg-avatar rounded-circle"> --%>
<!--                       </div> -->
<!--                       <div class="col pl-0 ml--2"> -->
<!--                           <div class="d-flex justify-content-between align-items-center"> -->
<!--                               <div> -->
<!--                               <h4 class="h6 mb-0 text-small">Joseph Garth</h4> -->
<!--                               </div> -->
<!--                               <div class="text-right"> -->
<!--                               <small>1 d ago</small> -->
<!--                               </div> -->
<!--                           </div> -->
<!--                           <p class="font-small mt-1 mb-0">New message: "Hey, what's up? All set for the presentation?"</p> -->
<!--                       </div> -->
<!--                   </div> -->
<!--                   </a> -->
<!--                   <a href="/single-message.html" class="list-group-item list-group-item-action border-bottom border-light"> -->
<!--                   <div class="row align-items-center"> -->
<!--                       <div class="col-auto"> -->
<!--                           Avatar -->
<%--                           <img alt="Image placeholder" src="${pageContext.request.contextPath}/img/team/profile-picture-5.jpg" class="user-avatar lg-avatar rounded-circle"> --%>
<!--                       </div> -->
<!--                       <div class="col pl-0 ml--2"> -->
<!--                           <div class="d-flex justify-content-between align-items-center"> -->
<!--                               <div> -->
<!--                               <h4 class="h6 mb-0 text-small">Bonnie Green</h4> -->
<!--                               </div> -->
<!--                               <div class="text-right"> -->
<!--                               <small>2 hrs ago</small> -->
<!--                               </div> -->
<!--                           </div> -->
<!--                           <p class="font-small mt-1 mb-0">New message: "We need to improve the UI/UX for the landing page."</p> -->
<!--                       </div> -->
<!--                   </div> -->
<!--                   </a> -->
<!--                   <a href="#" class="dropdown-item text-center text-primary font-weight-bold py-3">View all</a> -->
<!--               </div> -->
<!--               </div> -->
<!--           </li> -->
          <li class="">
              <a class="nav-link pt-1 px-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="media d-flex align-items-center">
		          <span class="icon icon-sm">
		              <span style="font-size: 1.4rem;" class="fa fa-user-circle text-dark"></span>
		          </span>
                  <div class="media-body ml-2 text-dark align-items-center d-none d-lg-block">
                  <span class="mb-0 font-small font-weight-bold">
                   
                  </span>
                  </div>
              </div>
              </a>
              <div class="dropdown-menu dashboard-dropdown dropdown-menu-right mt-2">
<!--               <a class="dropdown-item font-weight-bold" href="#" id="change-password"><span class="fas fa-user-shield"></span><spring:message text="變更密碼" code="ui.main-menu.change-password" /></a> -->
<!--               <div role="separator" class="dropdown-divider"></div> -->
              <a class="dropdown-item font-weight-bold" href="#" id="logout">
                <span class="fas fa-sign-out-alt text-danger"></span><spring:message text="登出" code="ui.main-menu.logout" /></a>
              </div>
          </li>
          </ul>
      </div>
      </div>
  </nav>
