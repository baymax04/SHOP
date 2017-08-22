package Notice;

import java.util.List;
import com.opensymphony.xwork2.ActionSupport;
import util.PageSplit;
import Notice.Manager;
import Notice.Service;

public class NoticeAction extends ActionSupport {
	Manager man;
	List<Manager> res;
	PageSplit ps;

	public PageSplit getPs() {
		return ps;
	}

	public void setPs(PageSplit ps) {
		this.ps = ps;
	}

	public List<Manager> getRes() {
		return res;
	}

	public void setRes(List<Manager> res) {
		this.res = res;
	}

	public Manager getMan() {
		return man;
	}

	public void setMan(Manager man) {
		this.man = man;
	}

	/**
	 * 查询特定公告
	 * 
	 * @return
	 */
	public String noticeview() {

		Service s = new Service();
		this.man = s.view(man.getId()).get(0);
		return "noticeview";

	}

	/**
	 * 一览页面，分页
	 * 
	 * @return
	 */
	public String noticelist() {
		//新建service对象
		Service s = new Service();
		if (ps == null) {
			ps = new PageSplit();
		}
		ps.setTotalCnt(s.count());
		ps.setP_size("5");
		ps.build();
		res = s.list(ps.getStart(), ps.getEnd());
		if (res != null && res.size() != 0) {

			return "noticelist";
		} else {
			return "no success";
		}
	}

}
