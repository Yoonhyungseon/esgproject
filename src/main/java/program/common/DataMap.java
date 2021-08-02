package program.common;

import java.util.HashMap;

import org.apache.commons.lang.StringUtils;

/**************************************************
* @FileName   : DataMap.java
* @Description: Frequently used Map setting
* @Author     : Seung-Jun. Kim
* @Version    : 2020. 10. 16.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/
@SuppressWarnings("rawtypes")
public class DataMap extends HashMap implements Comparable<Object>{
	
	private static final long serialVersionUID = 1036355938050927689L;
	public static final String sort = "sort"; // 정렬용
	
	public int compareTo(Object o) {
		String one = this.getString(sort);
		String two = ((DataMap)o).getString(sort);
		
		if(StringUtils.isNumeric(one)){		
			return Integer.parseInt(one) - Integer.parseInt(two);
		}else{
			return one.compareTo(two);
		}
	}	
	
	public String getString(Object key){		
		if(this.get(key) == null){
			return "";
		}else{
			return String.valueOf(this.get(key));
		}
	}
	
	public int getInt(Object key){		
		return Integer.parseInt(this.getString(key));
	}
}
