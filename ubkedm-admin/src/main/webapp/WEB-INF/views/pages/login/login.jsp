<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<div class="position-relative">
	<div id="login-box" class="login-box visible widget-box no-border">
		<div class="widget-body">
			<div class="widget-main">
				<h4 class="header blue lighter bigger">
					<i class="ace-icon fa fa-coffee green"></i> 请输入用户名和密码
				</h4>

				<div class="space-6"></div>

				<c:url var="loginUrl" value="/login" />
				<form action="${loginUrl}" method="post" class="form-horizontal">
					<c:if test="${param.error != null}">
						<div class="alert alert-danger">
							<p>请输入正确的用户名和密码</p>
						</div>
					</c:if>
					<c:if test="${param.logout != null}">
						<div class="alert alert-success">
							<p>成功退出</p>
						</div>
					</c:if>
					<fieldset>
						<label class="block clearfix"> <span
							class="block input-icon input-icon-right"> <input
								type="text" class="form-control" placeholder="Username"
								name="ssoid" /> <i class="ace-icon fa fa-user"></i>
						</span>
						</label> <label class="block clearfix"> <span
							class="block input-icon input-icon-right"> <input
								type="password" class="form-control" placeholder="Password"
								name="userPwd" /> <i class="ace-icon fa fa-lock"></i>
						</span>
						</label>

						<div class="space"></div>

						<div class="clearfix">
							<label class="inline"> <input type="checkbox" class="ace"
								name="remember-me" /> <span class="lbl"> Remember Me</span>
							</label> <input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<button type="submit"
								class="width-35 pull-right btn btn-sm btn-primary">
								<i class="ace-icon fa fa-key"></i> <span class="bigger-110">Login</span>
							</button>
						</div>

						<div class="space-4"></div>
					</fieldset>
				</form>

				<!-- <div class="social-or-login center">
											<span class="bigger-110">第三方登陆</span>
										</div> -->

				<div class="space-6"></div>

				<!-- <div class="social-login center">
											<a class="btn btn-primary"> <i
												class="ace-icon fa fa-facebook"></i>
											</a> <a class="btn btn-info"> <i
												class="ace-icon fa fa-twitter"></i>
											</a> <a class="btn btn-danger"> <i
												class="ace-icon fa fa-google-plus"></i>
											</a>
										</div> -->
			</div>
			<!-- /.widget-main -->

			<div class="toolbar clearfix">
				<div>
					<a href="<%=path%>/forgetpw.jsp" data-target="#forgot-box"
						class="forgot-password-link"> <i
						class="ace-icon fa fa-arrow-left"></i> 忘记密码？
					</a>
				</div>

				<div>
					<a href="<%=path%>/newuser" data-target="#signup-box"
						class="user-signup-link"> 注册 <i
						class="ace-icon fa fa-arrow-right"></i>
					</a>
				</div>
			</div>
		</div>
		<!-- /.widget-body -->
	</div>
	<!-- /.login-box -->
</div>
<!-- /.position-relative -->