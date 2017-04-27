package cn.mldn.util.message;

import java.util.ResourceBundle;

public class MessageUtils {
	
	private ResourceBundle resource;
	
	public MessageUtils(String baseName) {
		this.resource=ResourceBundle.getBundle(baseName);
	}
	
	public String getValue(String key){
		return this.resource.getString(key);
	}
	
	
}
