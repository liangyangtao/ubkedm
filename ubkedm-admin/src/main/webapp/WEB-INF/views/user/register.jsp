<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:include page="userheader.jsp"></jsp:include>

<body class="login-layout light-login">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h1>
								<i class="ace-icon fa fa-leaf green"></i> <span class="red">万象</span>
								<span class="white" id="id-text2">采集系统</span>
							</h1>
							<h4 class="blue" id="id-company-text">&copy; unbank.info</h4>
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="signup-box"
								class="signup-box widget-box no-border visible">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header green lighter bigger">
											<i class="ace-icon fa fa-users blue"></i> 注册新用户
										</h4>

										<div class="space-6"></div>
										<form:form method="POST" modelAttribute="user">
											<%-- <form:input type="hidden" path="userId" id="id" /> --%>
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <form:input
															path="userEmail" type="email" class="form-control"
															placeholder="邮箱 用于找回密码"  required="required"/> <i class="ace-icon fa fa-envelope"></i>
												</span>
													<form:errors path="userEmail" class="help-inline"/>
												</label> 
												 <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <form:input
															path="ssoid" type="text" class="form-control"
															placeholder="登陆名，请记牢" required="required"/> <i class="ace-icon fa fa-user"></i>
												</span>
													<form:errors path="ssoid" class="help-inline"/>
												</label>
											    <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <form:input
															path="userPwd" type="password" class="form-control"
															placeholder="密码"  required="required"/> <i class="ace-icon fa fa-lock"></i>
												</span>
													<form:errors path="userPwd" class="help-inline"/>
												</label>
												 <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
															id="rePwd" type="password" class="form-control"
															placeholder="再次输入密码" required="required" /> <i
														class="ace-icon fa fa-retweet"></i>
												</span>
												</label> <label class="block"> <input type="checkbox" checked="checked"
													class="ace" /> <span class="lbl"> 我同意 <a href="#">用户协议</a>
												</span>
												</label>

												<div class="space-24"></div>

												<div class="clearfix">
													<button type="reset" class="width-30 pull-left btn btn-sm">
														<i class="ace-icon fa fa-refresh"></i> <span
															class="bigger-110">重置</span>
													</button>

													<button type="submit"
														class="width-65 pull-right btn btn-sm btn-success">
														<span class="bigger-110">注册</span> <i
															class="ace-icon fa fa-arrow-right icon-on-right"></i>
													</button>
												</div>
											</fieldset>
										</form:form>
									</div>
									<div class="toolbar center">
										<a href="<%=path%>/login" data-target="#login-box"
											class="back-to-login-link"> <i
											class="ace-icon fa fa-arrow-left"></i> 返回登陆
										</a>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.signup-box -->
						</div>
						<!-- /.position-relative -->

						<div class="navbar-fixed-top align-right">
							<br /> &nbsp; <a id="btn-login-dark" href="#">深色</a> &nbsp; <span
								class="blue">/</span> &nbsp; <a id="btn-login-blur" href="#">暗色</a>
							&nbsp; <span class="blue">/</span> &nbsp; <a id="btn-login-light"
								href="#">亮色</a> &nbsp; &nbsp; &nbsp;
						</div>
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<jsp:include page="userfooter.jsp"></jsp:include>
</body>
</html>