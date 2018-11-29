package bean;

import java.util.ArrayList;

public class AdminListBean {
	SelectBean sb = new SelectBean();
	
	public ArrayList getAdminList(){
		String sql = "select * from admin";
		String args[] = {"id","name","pwd","status"};
		ArrayList al = sb.select(sql, args);
		return al;
	}
}
