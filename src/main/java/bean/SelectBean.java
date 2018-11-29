package bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import util.DBConn;

public class SelectBean {
	
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	/**
	 * 
	 * @param sql
	 * @param args
	 * @return ArrayList
	 * @获取多条信息
	 */
	public ArrayList select(String sql,String[] args){
		ArrayList al = new ArrayList();
		conn = DBConn.getConn();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				ArrayList alRow = new ArrayList();
				for(int i = 0;i < args.length;i++){
					alRow.add(rs.getString(args[i]));
				}
				al.add(alRow);
			}
		} catch (SQLException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		} finally{
			DBConn.close(conn,st,rs);
		}
		return al;
	}

	/**
	 * 
	 * @param sql
	 * @param args
	 * @return ArrayList
	 * @获取一条信息
	 */
	public ArrayList select(String[] args,String sql){
		ArrayList al = new ArrayList();
		conn = DBConn.getConn();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			rs.next();
			for(int i = 0;i < args.length;i++){
				al.add(rs.getString(args[i]));
			}
		} catch (SQLException e) {
			// TODO 自动生成 catch 块
		} finally{
			DBConn.close(conn,st,rs);
		}
		return al;
	}
}
