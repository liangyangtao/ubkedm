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
				<li><a href="sender">任务管理</a></li>

			</ul>
			<!-- /.breadcrumb -->
		</div>

		<div class="page-content">
			<%-- 	<jsp:include page="settingbox.jsp"></jsp:include> --%>
			<div class="page-header">
				<h1>
					任务管理 <small> <i class="ace-icon fa fa-angle-double-right"></i>
						添加新任务
					</small>
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<div class="row">
						<div class="col-sm-12">
							<div class="row">
								<div class="col-sm-4">
									<div class="widget-box">
										<div class="widget-header">
											<h4 class="widget-title">添加新任务</h4>
											<span class="widget-toolbar"> <a href="#"
												data-action="collapse"> <i
													class="ace-icon fa fa-chevron-up"></i>
											</a>
											</span>
										</div>

										<div class="widget-body">
											<div class="widget-main">
												<form>
													<label>任务名称</label>
													<div class="row">
														<div class="col-xs-8 col-sm-11">
															<input id="jobName" class="form-control" type="text" />
														</div>
													</div>
													<div class="space space-8"></div>
													<label>选择发送的邮件素材</label>
													<div class="row">
														<div class="col-xs-8 col-sm-11">
															<button id="choiceMail" type="button"
																class="btn btn-lg  fa  fa-plus btn-success">选择</button>
														</div>
														<div class="col-xs-8 col-sm-11" id="choiceInfo">
															<h3 id="choiceMailId"></h3>
															<h2 id="choiceMailTitle"></h2>
														</div>
													</div>
													<!--/ .row  -->
													<div class="space space-8"></div>
													<label>要发的邮件个数</label>
													<div class="row">
														<div class="col-xs-8 col-sm-11">
															<input id="mailNum"
																onkeyup="value=value.replace(/[^\d]/g,'')" value="1000" />
														</div>
													</div>
													<div class="space space-8"></div>
													<label>任务执行时间间隔</label>
													<div class="row">
														<div class="col-xs-8 col-sm-11">
															<!-- <div class="input-daterange input-group">
																<input type="text" class="input-sm form-control"
																	id="startJobTime" /> <span class="input-group-addon">至
																</span> <input type="text" class="input-sm form-control"
																	id="endJobTime" />
															</div> -->
															<input id="timeNum"
																onkeyup="value=value.replace(/[^\d]/g,'')"  value ="1000"/>
															<div class="radio">
																<label> <input name="timeType" checked="checked"
																	type="radio" class="ace" value="s" /> <span class="lbl">
																		秒</span>
																</label> <label> <input name="timeType" type="radio"
																	class="ace" value="min" /> <span class="lbl"> 分</span>
																</label><label> <input name="timeType" type="radio"
																	class="ace" value="h" /> <span class="lbl"> 时</span>
																</label> <label> <input name="timeType" type="radio"
																	class="ace" value="d" /> <span class="lbl"> 日</span>
																</label> <label> <input name="timeType" type="radio"
																	class="ace" value="mon" /> <span class="lbl"> 月</span>
																</label><label> <input name="timeType" type="radio"
																	class="ace" value="y" /> <span class="lbl"> 年</span>
																</label>
															</div>
														</div>
													</div>

													<div class="space space-8"></div>
													<div class=" form-actions center">
														<button class="btn btn-info" type="button" id="saveJobBtn">
															<i class="ace-icon fa fa-check bigger-110"></i> 保存
														</button>
														<button class="btn" type="reset">
															<i class="ace-icon fa fa-undo bigger-110"></i> 重置
														</button>
													</div>
													<div id="my-modal" class="modal">
														<div class="modal-dialog" style="width:1024px">
															<div class="modal-content">
																<div class="modal-header">
																	<h3 class="smaller lighter blue no-margin">请选择要发送的邮件内容</h3>
																</div>

																<div class="modal-body">
																	<table id="grid-table"></table>
																	<div id="grid-pager"></div>
																</div>
																<input type="hidden" name="${_csrf.parameterName}"
																	value="${_csrf.token}" />
																<div class="modal-footer">
																	<button class="btn btn-sm btn-success pull-right"
																		data-dismiss="modal">
																		<i class="ace-icon fa fa-times"></i> 确定
																	</button>
																</div>
															</div>
															<!-- /.modal-content -->
														</div>
														<!-- /.modal-dialog -->
													</div>
													<!-- /#my-modal  -->
												</form>
											</div>
											<!-- /. widget-main  -->
										</div>
										<!-- /.widget-body  -->
									</div>
									<!-- / .widget-box -->
								</div>
								<!-- /.col-sm-4  -->
							</div>
							<!--  /.row -->
						</div>
						<!-- / .col-sm-12  -->
					</div>
					<!--  / .row -->
				</div>
				<!--  -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.page-content -->
</div>
<!-- /.main-content -->