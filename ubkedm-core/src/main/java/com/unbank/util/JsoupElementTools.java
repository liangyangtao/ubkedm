package com.unbank.util;

import org.jsoup.nodes.Attribute;
import org.jsoup.nodes.Attributes;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class JsoupElementTools {
	/**
	 * 
	 * 返回包含某段文字的的所有节点
	 * 
	 * @param element
	 * @param checkText
	 * @return
	 */
	public static Elements getElementsByText(Element element, String checkText) {
		if (checkText.isEmpty()) {
			return null;
		}
		Elements elements = element.select(":contains(" + checkText + ")");
		return elements;
	}

	/**
	 * 返回包含50字以上的节点
	 * 
	 * @param temp
	 * @return
	 */
	public static Element getIncludeTextNode(Element temp) {
		while (true) {
			temp = temp.parent();
			if (temp == null) {
				break;
			}
			if (temp.text().trim().length() >= 50) {
				break;
			}

		}
		return temp;
	}

	/**
	 * 移除节点中的属性 部分保留（居中，行列、链接）
	 * 
	 * @param element
	 */
	public void removeElementAttr(Element element) {
		if (element == null) {
			return;
		}
		Attributes attributes = element.attributes();
		for (Attribute attribute : attributes) {
			if (attribute.getKey().isEmpty()) {
				continue;
			} else if (attribute.getKey().equals("align") && attribute.getValue().equals("center")) {
				continue;
			} else if (attribute.getKey().equals("style")
					&& (attribute.getValue().toLowerCase().contains("text-align: center"))) {
				continue;
			} else if (attribute.getKey().equals("rowspan") || attribute.getKey().equals("colspan")
					|| attribute.getKey().equals("src") || attribute.getKey().equals("href")) {
				continue;
			} else {
				element.removeAttr(attribute.getKey());
			}
		}
	}

	/**
	 * 将图片中的src 替换成绝对路径 ，移除一些不必要的属性
	 * 
	 * @param contentbody
	 */
	public static void formatImage(Element contentbody) {
		if (contentbody == null) {
			return;
		}
		Elements elements = contentbody.select("img");
		for (Element element : elements) {
			if ("display:none;".equals(element.attr("style"))) {
				element.remove();
				continue;
			}
			String imgSrc = element.absUrl("src");
			element.attr("src", imgSrc);
			Attributes attributes = element.attributes();
			for (Attribute attribute : attributes) {
				if (attribute.getKey().isEmpty()) {
					continue;
				} else if (attribute.getKey().equals("src")) {
					continue;
				} else {
					element.removeAttr(attribute.getKey());
				}
			}
		}

	}

	/**
	 * 
	 * @param bodyElement
	 * @param element
	 * @return
	 */
	// StringBuffer cssPath = new StringBuffer();
	public static StringBuffer checkPathNoIndex(Element document, Element element, StringBuffer cssPath) {

		if (element == null) {
			return null;
		}
		String tagStr = element.tagName();
		// 如果能够找到带有ID属性的父节点就停止查找
		if (element.hasAttr("id")) {
			cssPath.insert(0, tagStr + "#" + element.attr("id"));
		} else if (element.hasAttr("class")) {
			String classStr = element.attr("class").trim().replace(" ", ".");
			if (!"".equals(classStr)) {
				cssPath.insert(0, tagStr + "." + classStr);
			} else {
				cssPath.insert(0, tagStr);
			}
		} else {
			cssPath.insert(0, tagStr);

		}
		if (document.select(cssPath.toString()).size() > 1) {
			if (!"body".equals(tagStr)) {
				cssPath.insert(0, ">");
				cssPath = checkPathNoIndex(document, element.parent(), cssPath);
			}
		}
		return cssPath;
	}

	/**
	 * 
	 * @param bodyElement
	 * @param element
	 * @return
	 */
	// StringBuffer cssPath = new StringBuffer();
	public static StringBuffer checkPath(Element document, Element element, StringBuffer cssPath) {

		if (element == null) {
			return null;
		}
		int index = element.elementSiblingIndex() + 1;
		String tagStr = element.tagName();
		// 如果能够找到带有ID属性的父节点就停止查找
		if (element.hasAttr("id")) {
			cssPath.insert(0, tagStr + "#" + element.attr("id"));
		} else if (element.hasAttr("class")) {
			String classStr = element.attr("class").trim().replace(" ", ".");
			if (!"".equals(classStr)) {
				cssPath.insert(0, tagStr + "." + classStr + ":nth-child(" + index + ")");
			} else {
				cssPath.insert(0, tagStr + ":nth-child(" + index + ")");
			}
		} else {
			cssPath.insert(0, tagStr + ":nth-child(" + index + ")");

		}

		if (document.select(cssPath.toString()).size() > 1) {
			if (!"body".equals(tagStr)) {
				cssPath.insert(0, ">");
				cssPath = checkPath(document, element.parent(), cssPath);
			}
		}
		return cssPath;
	}

	/**
	 * 如果有标点，应该加权
	 * 
	 * @param itext
	 * @return
	 */
	public static int getElemnetTextLength(String itext) {
		int iLength = 0;
		char[] iarray = itext.toCharArray();
		for (char c : iarray) {
			if (c == ',' || c == '，') {
				iLength = iLength + 10;
			} else if (c == '。') {
				iLength = iLength + 30;
			} else {
				iLength = iLength + 1;
			}
		}
		return iLength;
	}

	// 获取内容文字 最多的节点
	public static Element getMaxLengthChild(Element element) {

		if (element == null) {
			return null;
		}
		Element temp = element;
		while (true) {
			Elements childElements = temp.children();
			for (int i = 0; i < childElements.size() - 1; i++) {
				for (int j = i + 1; j < childElements.size(); j++) {
					// 如果包含标题
					int iLength = getElemnetTextLength(childElements.get(i).text());
					int jLength = getElemnetTextLength(childElements.get(j).text());
					if (iLength < jLength) {
						Element tempElemnt = childElements.get(i);
						childElements.set(i, childElements.get(j));
						childElements.set(j, tempElemnt);
					}
				}
			}
			// 找到结果最大的那个
			temp = childElements.first();
			// 如果文本长度已经小于50 则结束
			if (temp != null && temp.text().trim().length() <= 50) {
				temp = getIncludeTextNode(temp);
				break;
			}

			if (temp.children().size() == 0) {
				if (temp.text().trim().length() <= 50) {
					temp = getIncludeTextNode(temp);
				}
				break;
			}
		}
		return temp;
	}

}
