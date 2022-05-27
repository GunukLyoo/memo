package memo;

import java.io.*;

public class textFile {
	private String title;
	private String memo;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public boolean saveFile(){
		try {
			String name = System.getProperty("user.name");
		    System.out.println(name);
		    
		    String path = "C:\\Users\\" + name + "\\Documents\\text\\";
		    System.out.println(path);
		    
		    File dir = new File(path);
		    
		    if(dir.exists()) {
		    	
		    }else {
		    	dir.mkdir();
		    }
			OutputStream output = new FileOutputStream(path + title + ".txt");
			byte[] by = memo.getBytes();
			output.write(by);
			output.close();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
}
