<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<div class="footer">
	<div class="footer-inner">
		<div class="footer-content">
			<span class="bigger-120"> <span class="blue bolder">银联信</span>
				万象采集系统 &copy; 2013-2020
			</span> &nbsp; &nbsp; <span class="action-buttons"> <a href="#">
					<i class="ace-icon fa fa-weibo orange bigger-150"></i>
			</a> <a href="#"> <i
					class="ace-icon fa fa-weixin  orange bigger-150"></i>
			</a> <a href="#"> <i
					class="ace-icon fa fa-rss-square orange bigger-150"></i>
			</a>
			</span>
		</div>
	</div>
</div>
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>