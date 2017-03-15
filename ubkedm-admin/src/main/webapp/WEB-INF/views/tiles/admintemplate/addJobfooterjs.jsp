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
<script src="assets/js/jquery.jqGrid.min.js"></script>
<script src="assets/js/grid.locale-cn.js"></script>
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

<!-- inline scripts related to this page -->
<script type="text/javascript">

	jQuery(function($) {

		$('.input-daterange input').datetimepicker({
			format : 'YYYY-MM-DD HH:mm:ss'
		});

		///////////
		$(document).one('ajaxloadstart.page', function(e) {
			$.gritter.removeAll();
			$('.modal').modal('hide');
		});

		var grid_selector = "#grid-table";
		var pager_selector = "#grid-pager";

		$(window).on('resize.jqGrid', function() {
			$(grid_selector).jqGrid('setGridWidth', 800);
		});
		//resize on sidebar collapse/expand
		$(document).on('settings.ace.jqGrid', function(ev, event_name, collapsed) {
			if (event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed') {
				setTimeout(function() {
					$(grid_selector).jqGrid('setGridWidth', 800);
				}, 20);
			}
		});



		/* 素材表格  */
		jQuery(grid_selector).jqGrid({
			url : 'emailInfolist',
			datatype : "json",
			postData : {
				'rank' : 0
			},
			mtype : 'POST',
			height : 'auto',
			ajaxGridOptions : {
				beforeSend : function(xhr) {
					xhr.setRequestHeader('X-CSRF-Token', $("input[name=_csrf]").val());
				},
			},
			colNames : [ '编号', '标题' ],
			colModel : [
				{
					name : 'id',
					index : 'id',
					width : 30,
					sorttype : "int"
				},
				{
					name : 'title',
					index : 'title',
					width : 80
				}
			],
			viewrecords : true,
			rowNum : 10,
			rowList : [ 10 ],
			pager : pager_selector,
			altRows : true,
			//toppager: true,
			multiselect : false,
			//multikey: "ctrlKey",
			multiboxonly : true,
			loadComplete : function() {
				var table = this;
				setTimeout(function() {
					updatePagerIcons(table);
					enableTooltips(table);
				}, 0);
			},
			editurl : "emailInfolist",
			caption : "素材列表",
			autowidth : true,
		});
		$(window).triggerHandler('resize.jqGrid');
		//trigger window resize to make the grid get the correct size
		//navButtons
		jQuery(grid_selector).jqGrid('navGrid', pager_selector,
			{ //navbar options
				edit : false,
				editicon : 'ace-icon fa fa-pencil blue',
				add : false,
				addicon : 'ace-icon fa fa-plus-circle purple',
				del : false,
				delicon : 'ace-icon fa fa-trash-o red',
				search : false,
				searchicon : 'ace-icon fa fa-search orange',
				refresh : true,
				refreshicon : 'ace-icon fa fa-refresh green',
				view : false,
				viewicon : 'ace-icon fa fa-search-plus grey',
			},
			{
				//view record form
				recreateForm : true,
				beforeShowForm : function(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
				}
			}
		)


		//replace icons with FontAwesome icons like above
		function updatePagerIcons(table) {
			var replacement = {
				'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
				'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
				'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
				'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
			};
			$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function() {
				var icon = $(this);
				var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

				if ($class in replacement) icon.attr('class', 'ui-icon ' + replacement[$class]);
			})
		}

		function enableTooltips(table) {
			$('.navtable .ui-pg-button').tooltip({
				container : 'body'
			});
			$(table).find('.ui-pg-div').tooltip({
				container : 'body'
			});
		}

		/*  显示素材列表 */
		$("#choiceMail").click(function() {
			$("#my-modal").modal('show');
		}
		);

		/* 选择素材 ，没选默认第一个  */
		$('#my-modal').on('hide.bs.modal', function() {
			var rowId = $(grid_selector).jqGrid('getGridParam', 'selrow');
			if (rowId == null) {
				rowId = 1;
			}
			var rowData = $(grid_selector).jqGrid('getRowData', rowId);
			$("#choiceMailTitle").html(rowData.title);
			$("#choiceMailId").html(rowData.id);
			$("#choiceMailId").hide();
			$("#choiceMail").text("重选");
			return;
		});
		/* 保存任务  */
		$("#saveJobBtn").click(function() {
			var jobName = $("#jobName").val();
			var mailId = $("#choiceMailId").text();
			var mailNum = $("#mailNum").val();
			/* var startJobTime = $("#startJobTime").text();
			var endJobTime = $("#endJobTime").text(); */
			var timeNum = $("#timeNum").val();
			var timeType = $("input[name='timeType']:checked").val();

			$.ajax({
				type : "POST",
				url : "saveEmailJob",
				data : {
					jobName : jobName,
					mailId : mailId,
					mailNum : mailNum,
					timeNum :timeNum,
					timeType : timeType
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





		});


	});
</script>