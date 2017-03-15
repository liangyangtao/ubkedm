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
				<li class="active">素材列表</li>
			</ul>
			<!-- /.breadcrumb -->

			<div class="nav-search" id="nav-search"></div>
			<!-- /.nav-search -->
		</div>

		<div class="page-content">
			<%-- 	<jsp:include page="settingbox.jsp"></jsp:include> --%>

			<div class="page-header">
				<h1>
					素材管理 <small> <i class="ace-icon fa fa-angle-double-right"></i>
						素材列表
					</small> <span class="block pull-right"> <span
						class="btn-toolbar inline middle no-margin"> <span
							data-toggle="buttons" class="btn-group no-margin"> <a
								href="#" class="btn btn-sm btn-yellow " id="nomal_email"> <i
									class="ace-icon fa fa-envelope "></i>正常素材
							</a> <a href="#" class="btn btn-sm btn-yellow " id="lose_email">
									<i class="ace-icon fa fa-envelope "></i>过期素材
							</a>
						</span>
					</span>
					</span>
				</h1>

			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<jsp:include page="alertbox.jsp"></jsp:include>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<table id="grid-table"></table>

					<div id="grid-pager"></div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.page-content -->
	</div>
</div>
<!-- /.main-content -->