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
<style>
.edui-default .edui-editor {
	border: 0px;
	background-color: white;
	position: relative;
	overflow: visible;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
}
</style>
<!-- basic scripts -->

<!--[if !IE]> -->
<script src="assets/js/jquery-2.1.4.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
<script type="text/javascript">
	if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="assets/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->
<script src="assets/js/jquery-ui.custom.min.js"></script>
<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="assets/js/bootbox.js"></script>
<script src="assets/js/jquery.easypiechart.min.js"></script>
<script src="assets/js/jquery.gritter.min.js"></script>
<script src="assets/js/spin.js"></script>
<script src="assets/js/moment.min.js"></script>
<script src="assets/js/daterangepicker.min.js"></script>
<script src="assets/js/bootstrap-datepicker.min.js"></script>
<script src="assets/js/bootstrap-timepicker.min.js"></script>

<script src="assets/js/locale/zh-cn.js"></script>
<script src="assets/js/bootstrap-datetimepicker.min.js"></script>

<!-- <script src="assets/js/dropzone.min.js"></script> -->
<!-- ace scripts -->
<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>

<script src="assets/ueditor/ueditor.config.js"></script>
<script src="assets/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="assets/ueditor/lang/zh-cn/zh-cn.js"></script>
<!-- inline scripts related to this page -->
<script type="text/javascript">
	function preview() {
		$("#mail_title").text($("#edit_title").val());
		$("#mail_info").html(UE.getEditor('container').getContent());
		$("#my-modal").modal('show');
	}
	function saveEmailInfo() {
		$.ajax({
			type : "POST",
			url : "saveEmailInfo",
			data : {
				title : $("#mail_title").val(),
				content : UE.getEditor('container').getContent(),
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader('X-CSRF-Token', $("input[name=_csrf]").val());
			},
			async : false,
			success : function(data) {

				bootbox.alert({
					buttons : {
						ok : {
							label : '确定',
							className : 'btn-myStyle'
						}
					},
					message : '保存邮件成功！！！',
					callback : function() {
						window.location.reload();
					},
					title : "提示",
				});

			}
		});

	}



	jQuery(function($) {
		var ue = UE.getEditor('container', {
			toolbars : [],
			wordCount : false,
			elementPathEnabled : false,
			initialContent : '请在这里输入内容',
			autoClearinitialContent : true,
			sourceEditorFirst : false
		});
		///////////
		$(document).one('ajaxloadstart.page', function(e) {
			$.gritter.removeAll();
			$('.modal').modal('hide');
		});




	});
</script>