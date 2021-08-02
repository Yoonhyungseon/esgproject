package program.common;

import java.util.HashMap;

import program.common.util.CamelUtil;

/**************************************************
* @FileName   : CamelMap.java
* @Description: 
* @Author     : Seung-Jun. Kim
* @Version    : 2020. 10. 16.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/
@SuppressWarnings("rawtypes")
public class CamelMap extends HashMap {

	static final long serialVersionUID = -3144044422514529794L;

	/**
     * key 에 대하여 Camel Case 변환하여 super.put
     * (ListOrderedMap) 을 호출한다.
     * @param key
     *        - '_' 가 포함된 변수명
     * @param value
     *        - 명시된 key 에 대한 값 (변경 없음)
     * @return previous value associated with specified
     *         key, or null if there was no mapping for
     *         key
     */
    @SuppressWarnings("unchecked")
	public Object put(Object key, Object value) {
        return super.put(CamelUtil.convert2CamelCase((String) key), value);
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
