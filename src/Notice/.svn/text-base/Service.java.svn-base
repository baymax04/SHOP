package Notice;

import java.util.ArrayList;
import java.util.List;
import util.Connect;
import Notice.Manager;

public class Service {

	/**
	 * 一览分页
	 * 
	 * @param start
	 * @param end
	 * @return
	 */
	public List<Manager> list(int start, int end) {
		Connect conn = Connect.getInstance();
		String sql1 = "select  t.id,t.title,t.createdate,t.enddate,t.content from(select t1.*,rownum cnt from tb_notice_1026g6 t1) t where t.cnt>? and t.cnt<=?";
		List<Object> param1 = new ArrayList<Object>();
		param1.add(start);
		param1.add(end);
		List<Manager> res = (List) conn.queryForArrObject(sql1, param1,
				Manager.class);
		return res;
	}

	/**
	 * 数据个数
	 * 
	 * @return
	 */
	public int count() {
		Connect conn = Connect.getInstance();
		String sql = "select count(1) from tb_notice_1026g6";
		List<Object> param = new ArrayList<Object>();
		int cnt = conn.count(sql, param);
		return cnt;
	}

	/**
	 * 查询公告信息
	 * 
	 * @param id
	 * @return
	 */
	public List<Manager> view(String id) {
		Connect conn = Connect.getInstance();
		String sql = "select t.title,t.createdate,t.enddate,t.content from tb_notice_1026g6 t where id=?";
		List<Object> param = new ArrayList<Object>();
		param.add(id);
		List<Manager> res = (List) conn.queryForArrObject(sql, param,
				Manager.class);
		return res;
	}

}
