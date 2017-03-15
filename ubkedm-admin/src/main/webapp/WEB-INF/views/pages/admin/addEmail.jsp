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
				<li><a href="sender">素材管理</a></li>

			</ul>
			<!-- /.breadcrumb -->
		</div>

		<div class="page-content">
			<%-- 	<jsp:include page="settingbox.jsp"></jsp:include> --%>
			<div class="page-header">
				<h1>
					素材管理 <small> <i class="ace-icon fa fa-angle-double-right"></i>
						添加素材
					</small>
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<div class="row">
						<div class="col-sm-12">
							<div class="row">
								<div class="col-sm-6">
									<h3 class="header blue lighter smaller">
										<input
											style='font-size: 22px;height: 46px;line-height: 46px;width: 100%;background-color: transparent;border: 0;outline: 0;margin: 4px 0;'
											placeholder='请在这里输入标题' id ="edit_title" />
									</h3>
									<script id="container" style="height:300px">
									</script>
								</div>
								<div class="col-sm-6"></div>
							</div>
							<div class="row">
								<div class=" form-actions center">
									<button class="btn btn-info" onclick="preview()">
										<i class="ace-icon  bigger-110"></i> 预览
									</button>
									<button class="btn btn-info" type="button"
										onclick="saveEmailInfo()">
										<i class="ace-icon  bigger-110"></i> 保存
									</button>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</div>
								<div id="my-modal" class="modal">
									<div class="modal-dialog" style="width:1100px">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h3 class="smaller lighter blue no-margin" id="mail_title"></h3>
											</div>

											<div class="modal-body" id="mail_info"></div>

											<div class="modal-footer">
												<button class="btn btn-sm btn-danger pull-right"
													data-dismiss="modal">
													<i class="ace-icon fa fa-times"></i> 关闭
												</button>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
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
<!-- /.main-content -->