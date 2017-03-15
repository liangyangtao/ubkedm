package com.unbank.web.model;

import java.io.Serializable;
import java.util.Date;

/***
 * 查询model
 * 
 * @ClassName: SearchModel
 * @Description: TODO
 * @author: liangyangtao
 */
public class SearchModel implements Serializable {
	private static final long serialVersionUID = 7902035888382606204L;

	private Integer rank;

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

}
