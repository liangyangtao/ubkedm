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
						<div class="col-sm-12">
							<div class="tabbable">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active"><a data-toggle="tab" href="#addSender">
											单个添加 </a></li>

									<li><a data-toggle="tab" href="#addSenders"> 批量添加 </a></li>
								</ul>
								<div class="tab-content">
									<div id="addSender" class="tab-pane fade in active">
										<div class="row">
											<div class="col-sm-4">
												<div class="widget-box">
													<div class="widget-header">
														<h4 class="widget-title">添加发件人</h4>
														<span class="widget-toolbar"> <a href="#"
															data-action="collapse"> <i
																class="ace-icon fa fa-chevron-up"></i>
														</a>
														</span>
													</div>

													<div class="widget-body">
														<div class="widget-main">
															<form>
																<label>用户名称</label>
																<div class="row">
																	<div class="col-xs-8 col-sm-11">
																		<input class="form-control" type="text" />
																	</div>
																</div>
																<div class="space space-8"></div>
																<label>用户密码</label>

																<div class="row">
																	<div class="col-xs-8 col-sm-11">
																		<input class="form-control" type="text" />
																	</div>
																</div>
																<div class=" form-actions center">
																	<button class="btn btn-info" type="button">
																		<i class="ace-icon fa fa-check bigger-110"></i> 保存
																	</button>
																	<button class="btn" type="reset">
																		<i class="ace-icon fa fa-undo bigger-110"></i> 重置
																	</button>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div id="addSenders" class="tab-pane fade">
										<div class="row">
											<div class="col-sm-4">
												<div class="widget-box">
													<div class="widget-header">
														<h4 class="widget-title">请上传有邮件列表的文件</h4>

														<div class="widget-toolbar">
															<a href="#" data-action="collapse"> <i
																class="ace-icon fa fa-chevron-up"></i>
															</a>
															<!-- <a href="#" data-action="close"> <i
																class="ace-icon fa fa-times"></i>
															</a> -->
														</div>
													</div>

													<div class="widget-body">
														<div class="widget-main">
															<!-- 		<div class="form-group">
																<div class="col-xs-12">
																	<label class="ace-file-input"><input
																		id="id-input-file-2" type="file"><span
																		class="ace-file-container" data-title="选择"><span
																			class="ace-file-name" data-title=""><i
																				class=" ace-icon fa fa-upload"></i></span></span><a class="remove"
																		href="#"><i class=" ace-icon fa fa-times"></i></a></label>
																</div>
															</div> -->

															<div class="form-group">
																<div class="col-xs-12">
																	<label class="ace-file-input ace-file-multiple"><input
																		multiple="" id="id-input-file-3" type="file"><span
																		class="ace-file-container" data-title="拖拽或点击此处选择文件"><span
																			class="ace-file-name" data-title=""><i
																				class=" ace-icon ace-icon fa fa-cloud-upload"></i></span></span><a
																		class="remove" href="#"><i
																			class=" ace-icon fa fa-times"></i></a></label>
																</div>
															</div>

															<label> <span class="lbl">只支持excel</span>
															</label>
														</div>
													</div>
												</div>
											</div>

										</div>

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