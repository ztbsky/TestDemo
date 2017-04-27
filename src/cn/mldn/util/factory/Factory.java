package cn.mldn.util.factory;

import cn.mldn.service.proxy.ServiceProxy;
import cn.mldn.util.message.MessageUtils;

public class Factory {
	
	private static final MessageUtils daoMU=new MessageUtils("cn.mldn.util.config.dao");
	private static final MessageUtils serviceMU=new MessageUtils("cn.mldn.util.config.service");
	
	@SuppressWarnings("unchecked")
	public static <T> T getDAOInstance(String className){
		T t =null;
		try {
			t =(T) Class.forName(daoMU.getValue(className)).newInstance();
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return t;
	}
	
	@SuppressWarnings("unchecked")
	public static <T> T getServiceInstance(String className){
		T t =null;
		
		try {
			t =(T) new ServiceProxy().bind(Class.forName(serviceMU.getValue(className)).newInstance());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	
	
	
}
