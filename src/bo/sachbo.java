package bo;

import java.util.ArrayList;

import bean.sachbean;
import dao.sachdao;

public class sachbo {
	sachdao sdao = new sachdao();
	ArrayList <sachbean> ds;
	public ArrayList<sachbean> getSach(int start, int num){
		ds = sdao.getSach(start, num);
		return ds;
	}
	public ArrayList<sachbean> getSach(){
		ds = sdao.getSach();
		return ds;
	}
	
	 public ArrayList<sachbean> TimMa(String maloai){
		   ArrayList<sachbean> tam= new ArrayList<sachbean>();
		   for(sachbean s: ds)
			   if(s.getMaloai().equals(maloai))
				   tam.add(s);
		   return tam;
	   }
	   public ArrayList<sachbean> Tim(String key){
		   ArrayList<sachbean> tam= new ArrayList<sachbean>();
		   for(sachbean s: ds)
			   if(s.getTensach().toLowerCase().contains(
			   key.toLowerCase())||
		s.getTacgia().toLowerCase().contains(key.toLowerCase())||
		s.getMaloai().toLowerCase().contains(key.toLowerCase())			   
					   )
				   tam.add(s);
		   return tam;
	   }
	   
	  public ArrayList<sachbean> SeachInPage(int page, String maloai){
		  ArrayList<sachbean> tam = new ArrayList<sachbean>();
		  ArrayList<sachbean> dssach = getSach((page-1)*9, 9);
		  for (sachbean s: dssach) {
			  if(s.getMaloai().equals(maloai))
				   tam.add(s);
		  }
		  return tam;
	  }

}
