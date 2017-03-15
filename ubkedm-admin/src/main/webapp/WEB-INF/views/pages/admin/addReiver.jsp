<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">首页</a>
				</li>
				<li><a href="sender">发件人管理</a></li>

			</ul>
			<!-- /.breadcrumb -->
		</div>

		<div class="page-content">
			<%-- 	<jsp:include page="settingbox.jsp"></jsp:include> --%>
			<div class="page-header">
				<h1>
					发件人管理 <small> <i class="ace-icon fa fa-angle-double-right"></i>
						添加发件人
					</small>
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<div class="row">
						<div class="col-sm-6">
							<div class="tabbable">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active"><a data-toggle="tab" href="#addSender">
											<i class="green ace-icon fa fa-home bigger-120"></i> 单个添加
									</a></li>

									<li><a data-toggle="tab" href="#addSenders"> 批量添加 </a></li>
								</ul>
								<div class="tab-content">
									<div id="addSender" class="tab-pane fade in active">
										<p>单个添加</p>
									</div>
									<div id="addSenders" class="tab-pane fade">
										<p>批量添加</p>
											<div>
									<form action="./dummy.html" class="dropzone well" id="dropzone">
										<div class="fallback">
											<input name="file" type="file" multiple="" />
										</div>
									</form>
								</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.page-content -->
	</div>
</div>
<!-- /.main-content -->