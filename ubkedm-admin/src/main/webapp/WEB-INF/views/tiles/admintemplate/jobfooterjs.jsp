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
<script src="assets/js/bootstrap-datepicker.min.js"></script>
<script src="assets/js/jquery.jqGrid.min.js"></script>
<script src="assets/js/grid.locale-cn.js"></script>

<!-- ace scripts -->
<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">



	jQuery(function($) {
		var grid_selector = "#grid-table";
		var pager_selector = "#grid-pager";

		var parent_column = $(grid_selector).closest('[class*="col-"]');
		//resize to fit page size
		$(window).on('resize.jqGrid', function() {
			$(grid_selector).jqGrid('setGridWidth', parent_column.width());
		});
		//resize on sidebar collapse/expand
		$(document).on('settings.ace.jqGrid', function(ev, event_name, collapsed) {
			if (event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed') {
				//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
				setTimeout(function() {
					$(grid_selector).jqGrid('setGridWidth', parent_column.width());
				}, 20);
			}
		});
		function customFmatter(cellvalue, options, rowObject) {
			if (rowObject.end == 0) {
				return "<span class='label label-lg label-success arrowed-right'>进行中</span>";
			} else {
				return "<span class='label label-xlg label-pink arrowed-in-right'>完成</span>";
			}
		}

		function myacFmatter(cellvalue, options, rowObject) {
		
		
			var off = '<button class="btn btn-mini btn-danger "    data-original-title="停止" onclick="stopJob(' + rowObject.id + ')" ><i class="ace-icon fa fa fa-power-off"></i></button>';
			var edit = '<button class="btn btn-mini btn-warning "   data-original-title="编辑"   onclick="editJob(' + rowObject.id + ')" ><i class="ace-icon fa  fa-pencil-square-o"></i></button>';
			
			if (rowObject.end == 0) {
				return off;
			} else {
				return off + edit;
			}
		}

		jQuery(grid_selector).jqGrid({
			url : 'emailJoblist',
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
			colNames : [ '编号', '标题', '状态', "操作" ],
			colModel : [
				{
					name : 'id',
					index : 'id',
					width : 30,
					sorttype : "int"
				},
				{
					name : 'jobName',
					index : 'jobName',
					width : 80
				},
				{
					name : 'end',
					index : 'end',
					width : 80,
					formatter : customFmatter
				},

				{
					name : 'myac',
					index : '',
					width : 150,
					fixed : true,
					sortable : false,
					resize : false,
					formatter : myacFmatter
				}
			],
			viewrecords : true,
			rowNum : 10,
			rowList : [ 10 ],
			pager : pager_selector,
			altRows : true,
			//toppager: true,
			multiselect : true,
			//multikey: "ctrlKey",
			multiboxonly : true,
			loadComplete : function() {
				var table = this;
				setTimeout(function() {
					updatePagerIcons(table);
					enableTooltips(table);
				}, 0);
			},
			editurl : "emailJoblist",
			caption : "任务列表"
		//,autowidth: true,
		});
		$(window).triggerHandler('resize.jqGrid'); //trigger window resize to make the grid get the correct size
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







		//it causes some flicker when reloading or navigating grid
		//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
		//or go back to default browser checkbox styles for the grid


		//unlike navButtons icons, action icons in rows seem to be hard-coded
		//you can change them like this in here if you want

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

		//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');

		$(document).one('ajaxloadstart.page', function(e) {
			$.jgrid.gridDestroy(grid_selector);
			$('.ui-jqdialog').remove();
		});

		$("#nomal_job").click(function() {
			$(grid_selector).jqGrid('setGridParam', {
				postData : {
					'rank' : 0
				}
			}).trigger("reloadGrid");

		});

		$("#finish_job").click(function() {
			$(grid_selector).jqGrid('setGridParam', {
				postData : {
					'rank' : 1
				}
			}).trigger("reloadGrid");

		});


	});
</script>