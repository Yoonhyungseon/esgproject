package program.common.util;


/***************************************************
 * @FileName   : StringUtil.java
 * @Description: String Util
 * @Author     : joon
 * @Version    : 2014. 11. 18.
 * @Copyright  : ⓒ ADUP. All Right Reserved
 ***************************************************/
/**************************************************
 * @FileName : StringUtil.java
 * @Description:
 * @Author : joon
 * @Version : 2017. 5. 7.
 * @Copyright : ⓒADUP. All Right Reserved
 **************************************************/
public class StringUtil {

	/***************************************************
	 * @MethodName : isNumber
	 * @Description: Check whether the number of characters one
	 * @param : char c
	 * @return : boolean
	 * @Author : joon
	 * @Version : 2014. 11. 18.
	 ***************************************************/
	public static boolean isNumber(char c) {
		if (c < '0' || c > '9')
			return false;
		return true;
	}

	/***************************************************
	 * @MethodName : isNumber
	 * @Description: Check whether a string is numeric
	 * @param : String str
	 * @return : boolean
	 * @Author : joon
	 * @Version : 2014. 11. 18.
	 ***************************************************/
	public static boolean isNumber(String str) {
		if (str == null)
			return false;

		str = str.trim();
		int len = str.length();
		if (len == 0)
			return false;

		for (int i = 0; i < len; i++) {
			if (!isNumber(str.charAt(i)))
				return false;
		}
		return true;
	}

	/***************************************************
	 * @MethodName : isNull
	 * @Description: Check that the Null value
	 * @param : String str
	 * @return : boolean
	 * @Author : joon
	 * @Version : 2014. 11. 18.
	 ***************************************************/
	public static boolean isNull(String str) {
		return str == null || "null".equalsIgnoreCase(str);
	}
	public static boolean isEmpty(String str){
		return (str==null || "".equals(str.trim()));
	}

	public static String evl(String str, String value){
		return isEmpty(str)?value:str.trim();
	}

	/***************************************************
	 * @MethodName : isNotNull
	 * @Description: Check Null values ​​or not
	 * @param : String str
	 * @return : boolean
	 * @Author : joon
	 * @Version : 2014. 11. 18.
	 ***************************************************/
	public static boolean isNotNull(String str) {
		return !isNull(str);
	}

	/***************************************************
	 * @MethodName : parseBoolean
	 * @Description: Check if the boolean
	 * @param : String str
	 * @return : boolean
	 * @Author : joon
	 * @Version : 2014. 11. 18.
	 ***************************************************/
	public static boolean parseBoolean(String str) {;
		return "true".equalsIgnoreCase(str);
	}

	/***************************************************
	 * @MethodName : equals
	 * @Description: Compare whether the same value
	 * @param : String str1, String str2
	 * @return : boolean
	 * @Author : joon
	 * @Version : 2014. 11. 18.
	 ***************************************************/
	public static boolean equals(String str1, String str2) {
		if(isNull(str1)){
			return isNull(str2);
		}
		return str1.equals(str2);
	}

	/***************************************************
	 * @MethodName : equalsIgnoreCase
	 * @Description: Compare whether the same value
	 * @param : String str1, String str2
	 * @return : boolean
	 * @Author : joon
	 * @Version : 2014. 11. 18.
	 ***************************************************/
	public static boolean equalsIgnoreCase(String str1, String str2) {
		if(isNull(str1)){
			return isNull(str2);
		}
		return str1.equalsIgnoreCase(str2);
	}

	/***************************************************
	 * @MethodName : nvl
	 * @Description: Check if a null value and replace it with another value or
	 *               blank
	 * @param : String str
	 * @return : String
	 * @Author : joon
	 * @Version : 2014. 11. 18.
	 ***************************************************/
	public static String nvl(String str) {
		if (isNull(str)){
			str = "";
		}
		return str;
	}

	/***************************************************
	 * @MethodName : nvl
	 * @Description: Check if a null value and replace it with another value or
	 *               blank
	 * @param : String str, String chstr
	 * @return : String
	 * @Author : joon
	 * @Version : 2014. 11. 18.
	 ***************************************************/
	public static String nvl(String str, String chstr) {
		if (isNull(str)){
			return chstr;
		}
		return str;
	}

	/***************************************************
	 * @MethodName : nvlLong
	 * @Description: Check if a null value and replace it with another value or
	 *               blank
	 * @param : String str
	 * @return : long
	 * @Author : joon
	 * @Version : 2014. 11. 18.
	 ***************************************************/
	public static long strToLong(String str) {
		return strToLong(str, 0);
	}

	/***************************************************
	 * @MethodName : nvlLong
	 * @Description: Check if a null value and replace it with another value or
	 *               blank
	 * @param : String str, long value
	 * @return : long
	 * @Author : joon
	 * @Version : 2014. 11. 18.
	 ***************************************************/
	public static long strToLong(String str, long value) {
		long result = 0L;
		try {
			result = Long.parseLong(str);
		} catch (Exception e) {
			result = value;
		}
		return result;
	}

	/***************************************************
	 * @MethodName : nvlInt
	 * @Description: Check if a null value and replace it with another value or
	 *               blank
	 * @param : String str
	 * @return : int
	 * @Author : joon
	 * @Version : 2014. 11. 18.
	 ***************************************************/
	public static int strToInt(String str) {
		long result = strToLong(str);
		return (int) result;
	}

	/***************************************************
	 * @MethodName : nvlInt
	 * @Description: Check if a null value and replace it with another value or
	 *               blank
	 * @param : String str, int value
	 * @return : int
	 * @Author : joon
	 * @Version : 2014. 11. 18.
	 ***************************************************/
	public static int strToInt(String str, int value) {
		long result = strToLong(str, value);
		return (int) result;
	}

	/***************************************************
	 * @MethodName : nvlDouble
	 * @Description: Check if a null value and replace it with another value or
	 *               blank
	 * @param : String str
	 * @return : double
	 * @Author : joon
	 * @Version : 2014. 11. 18.
	 ***************************************************/
	public static double strToDouble(String str) {
		return strToDouble(str, 0);
	}

	/***************************************************
	 * @MethodName : nvlDouble
	 * @Description: Check if a null value and replace it with another value or
	 *               blank
	 * @param : String str, double dInitVal
	 * @return : double
	 * @Author : joon
	 * @Version : 2014. 11. 18.
	 ***************************************************/
	public static double strToDouble(String str, double value) {
		double result = 0;
		try {
			result = Double.parseDouble(str);
		} catch (Exception e) {
			result = value;
		}
		return result;
	}

	/***************************************************
	 * @MethodName : lpad
	 * @Description: lpad
	 * @param : String str, int len, String addStr
	 * @return : String
	 * @Author : joon
	 * @Version : 2014. 11. 18.
	 ***************************************************/
	public static String lpad(String str, int len, String addStr) {
		StringBuffer result = new StringBuffer();
		int templen = len - str.length();
		for (int i = 0; i < templen; i++) {
			result.append(addStr);
		}
		result.append(str);
		return result.toString();
	}
	public static String lpad(int dd, int size) {
		return null;
	}

	/***************************************************
	 * @MethodName : stripTags
	 * @Description: HTML 태그 삭제
	 * @param : String text
	 * @return : String
	 * @Author : joon
	 * @Version : 2014. 11. 18.
	 ***************************************************/
	public static String stripTags(String text) {
		if (text != null) {
			return text.replaceAll("\\<.*?>", "").trim();
		}
		return "";
	}

	public static String escape(String instr) {
		if(instr==null){
			return "";
		}
		String str = instr.trim();
		if ("".equals(str)) {
			return "";
		}
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("\"", "&quot;");
		str = str.replaceAll("\'", "&#039;"); //=&#x27;
		return str;
	}

	public static int nvlInt(String year) {
		// TODO Auto-generated method stub
		return 0;
	}
}
