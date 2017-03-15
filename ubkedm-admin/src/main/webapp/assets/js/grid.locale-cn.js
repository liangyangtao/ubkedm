!function(a) {
	"use strict";
	"function" == typeof define && define.amd ? define([ "jquery", "../grid.base" ], a) : a(jQuery)
}(function(a) {
	a.jgrid = a.jgrid || {}, a.jgrid.hasOwnProperty("regional") || (a.jgrid.regional = []), a.jgrid.regional.en = {
		defaults : {
			recordtext : "当前是 {0} - {1} 共 {2} 条记录",
			emptyrecords : "没有数据",
			loadtext : "加载中...",
			savetext : "保存...",
			pgtext : "当前第{0}页 共 {1} 页",
			pgfirst : "首页",
			pglast : "末页",
			pgnext : "下一页",
			pgprev : "前一页",
			pgrecs : "Records per Page",
			showhide : "Toggle Expand Collapse Grid",
			pagerCaption : "Grid::Page Settings",
			pageText : "页数:",
			recordPage : "Records per Page",
			nomorerecs : "没有更多数据了...",
			scrollPullup : "Pull up to load more...",
			scrollPulldown : "Pull down to refresh...",
			scrollRefresh : "Release to refresh..."
		},
		search : {
			caption : "搜索...",
			Find : "查找",
			Reset : "重置",
			odata : [ {
				oper : "eq",
				text : "等于"
			}, {
				oper : "ne",
				text : "不等于"
			}, {
				oper : "lt",
				text : "小于"
			}, {
				oper : "le",
				text : "小于等于"
			}, {
				oper : "gt",
				text : "大于"
			}, {
				oper : "ge",
				text : "大于等于"
			}, {
				oper : "bw",
				text : "开始于"
			}, {
				oper : "bn",
				text : "不开始于"
			}, {
				oper : "in",
				text : "is in"
			}, {
				oper : "ni",
				text : "not in"
			}, {
				oper : "ew",
				text : "以结尾"
			}, {
				oper : "en",
				text : "不以结尾"
			}, {
				oper : "cn",
				text : "包含"
			}, {
				oper : "nc",
				text : "不包含"
			}, {
				oper : "nu",
				text : "是空的"
			}, {
				oper : "nn",
				text : "不是空的"
			} ],
			groupOps : [ {
				op : "AND",
				text : "所有"
			}, {
				op : "OR",
				text : "任意一个"
			} ],
			operandTitle : "选择一个你要的操作",
			resetTitle : "重置搜索条件"
		},
		edit : {
			addCaption : "添加一条记录",
			editCaption : "编辑一条记录",
			bSubmit : "提交",
			bCancel : "取消",
			bClose : "关闭",
			saveData : "数据已经改变! 保存?",
			bYes : "是",
			bNo : "否",
			bExit : "取消",
			msg : {
				required : "Field is required",
				number : "请输入数字",
				minValue : "value must be greater than or equal to ",
				maxValue : "value must be less than or equal to",
				email : "不是一个可用的邮箱",
				integer : "请输入数字",
				date : "请输入时间",
				url : "不是有效的URL.必须以 ('http://' 或 'https://')开头",
				nodefined : " 没有被定义!",
				novalue : " return value is required!",
				customarray : "Custom function should return array!",
				customfcheck : "Custom function should be present in case of custom checking!"
			}
		},
		view : {
			caption : "查询记录",
			bClose : "关闭"
		},
		del : {
			caption : "删除",
			msg : "确定删除选中的记录么?",
			bSubmit : "删除",
			bCancel : "取消"
		},
		nav : {
			edittext : "",
			edittitle : "编辑选中的记录",
			addtext : "",
			addtitle : "添加新的记录",
			deltext : "",
			deltitle : "删除选中的记录",
			searchtext : "",
			searchtitle : "查找符合条件的记录",
			refreshtext : "",
			refreshtitle : "刷新表格",
			alertcap : "敬告",
			alerttext : "请至少选择一条记录",
			viewtext : "",
			viewtitle : "查看选择的记录",
			savetext : "",
			savetitle : "现在保存",
			canceltext : "",
			canceltitle : "取消编辑",
			selectcaption : "执行中..."
		},
		col : {
			caption : "选择列",
			bSubmit : "提交",
			bCancel : "取消"
		},
		errors : {
			errcap : "错误",
			nourl : "No url is set",
			norecords : "No records to process",
			model : "Length of colNames <> colModel!"
		},
		formatter : {
			integer : {
				thousandsSeparator : ",",
				defaultValue : "0"
			},
			number : {
				decimalSeparator : ".",
				thousandsSeparator : ",",
				decimalPlaces : 2,
				defaultValue : "0.00"
			},
			currency : {
				decimalSeparator : ".",
				thousandsSeparator : ",",
				decimalPlaces : 2,
				prefix : "",
				suffix : "",
				defaultValue : "0.00"
			},
			date : {
				dayNames : [ "Sun", "Mon", "Tue", "Wed", "Thr", "Fri", "Sat", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" ],
				monthNames : [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ],
				AmPm : [ "am", "pm", "AM", "PM" ],
				S : function(a) {
					return 11 > a || a > 13 ? [ "st", "nd", "rd", "th" ][Math.min((a - 1) % 10, 3)] : "th"
				},
				srcformat : "Y-m-d",
				newformat : "n/j/Y",
				parseRe : /[#%\\\/:_;.,\t\s-]/,
				masks : {
					ISO8601Long : "Y-m-d H:i:s",
					ISO8601Short : "Y-m-d",
					ShortDate : "n/j/Y",
					LongDate : "l, F d, Y",
					FullDateTime : "l, F d, Y g:i:s A",
					MonthDay : "F d",
					ShortTime : "g:i A",
					LongTime : "g:i:s A",
					SortableDateTime : "Y-m-d\\TH:i:s",
					UniversalSortableDateTime : "Y-m-d H:i:sO",
					YearMonth : "F, Y"
				},
				reformatAfterEdit : !1,
				userLocalTime : !1
			},
			baseLinkUrl : "",
			showAction : "",
			target : "",
			checkbox : {
				disabled : !0
			},
			idName : "id"
		}
	}
});