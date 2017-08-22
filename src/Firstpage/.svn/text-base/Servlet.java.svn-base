package Firstpage;

import java.util.List;

import util.PageSplit;

public class Servlet {
	private List<Bean> res;
	private Bean bean;
	private PageSplit pages;

 


private   int current ;
    
    
	public PageSplit getPages() {
		return pages;
	}

	public Bean getBean() {
		return bean;
	}

	public void setBean(Bean bean) {
		this.bean = bean;
	}

	public void setPages(PageSplit pages) {
		this.pages = pages;
	}

	public List<Bean> getRes() {
		return res;
	}

	public void setRes(List<Bean> res) {
		this.res = res;
	}

	public int getCurrent() {
		return current;
	}

	public void setCurrent(int current) {
		this.current = current;
	}
	
	
	public String list() {
		  Service service = new Service();
		int count = service.count();
		current = (pages == null) ? current : pages.getPage();
		pages = new PageSplit(String.valueOf(current), "9", "asc", count);
		this.res =  service .list(pages.getStart(), pages.getEnd());
		pages.setList(res);

		return "success";
	}


	  public String list2(){
		  Service service = new Service();
		  String id = bean.getId();
		  this.res=service.goodsinfo(bean);
		
		return "success2";
	}
	
	
}
