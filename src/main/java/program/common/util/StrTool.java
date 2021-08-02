package program.common.util;

import java.util.HashMap;

/**************************************************
* @FileName   : StrTool.java
* @Description: Null -related utilities
* @Author     : Seung-Jun. Kim
* @Version    : 2020. 10. 16.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/
public class StrTool {

	/**************************************************
	* @MethodName : sNN
	* @Description: Converts a String Null by whitespace
	* @param arg
	* @return String
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 10. 16.
	**************************************************/
	public static String sNN(String arg) {
		if( arg == null || arg.length() < 1 )
			return "";
		return arg;
	}

	/**************************************************
	* @MethodName : sNN
	* @Description: Converts a String Null by whitespace
	* @param obj
	* @return String
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 10. 16.
	**************************************************/
	@SuppressWarnings("rawtypes")
	public static String sNN(HashMap obj) {
		if( obj == null || obj.toString().length() < 1 )
			return "";
		return obj.toString();
	}

	/**************************************************
	* @MethodName : sNN
	* @Description: Converts a String Null by whitespace
	* @param obj
	* @return String
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 10. 16.
	**************************************************/
	public static String sNN(Object obj) {
		if( obj == null || obj.toString().length() < 1 )
			return "";
		return obj.toString();
	}

	/**************************************************
	* @MethodName : strToInt
	* @Description: Converts a String Null by 0
	* @param s
	* @return int
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 10. 16.
	**************************************************/
	public static int strToInt(String s){
        if (s == null || s.equals(""))  return 0;
		else return Integer.parseInt(s);
	}

    /**************************************************
    * @MethodName : intNoNull
    * @Description: Converts a String Null by 0
    * @param p
    * @return int
    * @Author     : Seung-Jun. Kim
    * @Version    : 2020. 10. 16.
    **************************************************/
    public static int intNoNull(String p) {
        int result = 0;
        if (p != null) {
            try {  result = Integer.parseInt(p);  } catch (NumberFormatException e) {  }
        }
        return result;
    }

    /**************************************************
    * @MethodName : intNoNull
    * @Description: Converts a String Null by 0
    * @param p
    * @return int
    * @Author     : Seung-Jun. Kim
    * @Version    : 2020. 10. 16.
    **************************************************/
    public static int intNoNull(Object p) {
        int result = 0;
        if (p != null) {
            try {  result = Integer.parseInt(sNN(p));  } catch (NumberFormatException e) {  }
        }
        return result;
    }

} // End of this class.
