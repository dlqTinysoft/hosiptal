package bean;

import java.util.ArrayList;

public class AllBean {
	SelectBean sb = new SelectBean();
	ArrayList al = null;
	
	public ArrayList getUsers(String status){
		String sql = "select * from users where status='"+status+"' order by id desc";
		String args[] = {"id","name","pwd","realname","office","status"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getUsersOne(String id){
		String sql = "select * from users where id="+id;
		String args[] = {"id","name","pwd","realname","office","status"};
		al = sb.select(args, sql);
		return al;
	}
	
	public ArrayList getOffice(){
		String sql = "select * from office order by id desc";
		String args[] = {"id","name"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getMedicine(){
		String sql = "select * from medicine order by id desc";
		String args[] = {"id","name","spec","factory","price","stock","sums","caption","flag"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getMedicineAdmin(){
		String sql = "select * from medicine where flag=0 order by id desc";
		String args[] = {"id","name","spec","factory","price","stock","sums","caption","flag"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getMedicineSearch(String name){
		String sql = "select * from medicine where name like '%"+name+"%' and flag=0 order by id desc";
		String args[] = {"id","name","spec","factory","price","stock","sums","caption","flag"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getMedicine(String id){
		String sql = "select * from medicine where id="+id;
		String args[] = {"id","name","spec","factory","price","stock","sums","caption","flag"};
		al = sb.select(args, sql);
		return al;
	}
	
	public ArrayList getRegisterPrice(){
		String sql = "select * from register_price";
		String args[] = {"id","name","price"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getRegisterPrice(String name){
		String sql = "select * from register_price where name='"+name+"'";
		String args[] = {"id","name","price"};
		al = sb.select(args, sql);
		return al;
	}
	
	public ArrayList getInvalid(String pathographyid){
		String sql = "select * from invalid where pathographyid='"+pathographyid+"'";
		String args[] = {"id","pathographyid","name","sex","age","address","office","type","price","userid","times","flag"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getInvalid(String office,String date){
		String sql = "select * from invalid where office='"+office+"' and datediff(day,times,'"+date+"')=0 order by id desc";
		String args[] = {"id","pathographyid","name","sex","age","address","office","type","price","userid","times","flag"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getInvalid(){
		String sql = "select * from invalid order by id desc";
		String args[] = {"id","pathographyid","name","sex","age","address","office","type","price","userid","times","flag"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getInvalidAdmin(String id){
		String sql = "select * from invalid where id="+id;
		String args[] = {"id","pathographyid","name","sex","age","address","office","type","price","userid","times","flag"};
		al = sb.select(args, sql);
		return al;
	}
	
	public ArrayList getInvalidAdmin(){
		String sql = "select * from invalid where flag=0 order by id desc";
		String args[] = {"id","pathographyid","name","sex","age","address","office","type","price","userid","times","flag"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getCases(){
		String sql = "select * from cases order by id desc";
		String args[] = {"id","pathographyid","history","allergy","symptom","analyze","userid"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getCasesOne(String id){
		String sql = "select * from cases where id="+id;
		String args[] = {"id","pathographyid","history","allergy","symptom","analyze","userid"};
		al = sb.select(args, sql);
		return al;
	}
	
	public ArrayList getCases(String pathographyid){
		String sql = "select * from cases where pathographyid='"+pathographyid+"' order by id desc";
		String args[] = {"id","pathographyid","history","allergy","symptom","analyze","userid"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getPrescription(){
		String sql = "select * from prescription order by id desc";
		String args[] = {"id","pathographyid","medicineid","sums","times","times1","userid"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getPrescriptionOne(String id){
		String sql = "select * from prescription where id="+id;
		String args[] = {"id","pathographyid","medicineid","sums","times","times1","userid"};
		al = sb.select(args, sql);
		return al;
	}
	
	public ArrayList getPrescription(String pathographyid,String date){
		String sql = "select * from prescription where pathographyid='"+pathographyid+"' and times='"+date+"' order by id desc";
		String args[] = {"id","pathographyid","medicineid","sums","times","times1","userid"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getPrescription(String date){
		String sql = "select medicineid,sum(sums) as sums from prescription where times='"+date+"' group by medicineid order by sums desc";
		String args[] = {"medicineid","sums"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getEntry(){
		String sql = "select * from entry order by id desc";
		String args[] = {"id","medicineid","sums","times"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getMax(){
		String sql = "select max(pathographyid) as maxs from invalid";
		String args[] = {"maxs"};
		al = sb.select(args,sql);
		return al;
	}
	
}
