package program.common.util;

import java.util.HashMap;

import program.common.DataMap;

public class RestMessageUtil {
	
	public static final String AUTH_KEY = "KT MEC KIOSK SERVICE";
	public static final HashMap<String, String> ERRCD = new HashMap<String, String>() {
        {
        	put("0", "Success"); 
            
        	put("1", "Parameter missing");
        	put("999", "System error occoured.");
        	
        }
    };
    
    public static DataMap getResultDataMap(String errorCode) {
    	DataMap d = new DataMap();
    	d.put("status", errorCode);
    	d.put("message", ERRCD.get(errorCode));
    	return d;
    }
    
    public static DataMap getResultDataMap(String errorCode, String path) {
    	DataMap d = new DataMap();
    	d.put("status", errorCode);
    	d.put("message", ERRCD.get(errorCode));
    	d.put("path", path);
    	return d;
    }
}
