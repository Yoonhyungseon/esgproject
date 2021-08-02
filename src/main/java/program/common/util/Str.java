/**
 * Str.java
 */
package program.common.util;

import java.io.UnsupportedEncodingException;
import java.util.StringTokenizer;

/**
 * @author bbrain
 *
 */
public final class Str {

	/**
	 * static final String[] EMPTY_STRING_ARRAY = new String[0];
	 */
	public static final String[] EMPTY_STRING_ARRAY = new String[0];

	public static String onlyNumeric(String str){
		if(isEmpty(str)){
			return "";
		}
		int len = str.length();
		String retstr = "";
		for(int index=0; index<len; index++){
			char ch = str.charAt(index);
			if(ch<'0' || ch>'9'){}
			else{
				retstr += ch;
			}
		}
		return retstr;
	}

	public static boolean isNumeric(String str) {
		try {
			Double.parseDouble(str);
			return true;
		} catch(NumberFormatException e){
			return false;  
		}
	}
	public static String toString(int[] n, String sep){
		StringBuffer sb = new StringBuffer();
		for(int nn : n){
			sb.append(nn).append(sep);
		}
		return sb.toString();
	}
	public static String toStringSum(int[] n, String sep){
		StringBuffer sb = new StringBuffer();
		int s = 0;
		for(int nn : n){
			s += nn;
			sb.append(nn).append(sep);
		}
		return sb.append(s).toString();
	}
	/**
	 * @param stringa
	 * @param strignb
	 * @return the boolean
	 */
	public static boolean equals(String stringa, String strignb){
		return (stringa==null)?(strignb==null):stringa.equals(strignb);
	}
	/**
	 * @param stringa
	 * @param stringb
	 * @return the boolean
	 */
	public static boolean equalsNotNull(String stringa, String stringb){
		return (stringa==null)?false:stringa.equals(stringb);
	}
	/**
	 * null or 빈 문자열이면 true
	 * @param str
	 * @return the boolean
	 */
	public static boolean isEmpty(String str){
		return (str==null || "".equals(str));
	}
	/**
	 * null 이거나 빈 문자열 혹은 공백으로만 된 문자열이면 true
	 * @param str
	 * @return the boolean
	 */
	public static boolean isBlank(String str){
		return (str==null || "".equals(str.trim()));
	}
	/**
	 * white space [ \f\n\r\t\v]
	 * @param string
	 * @return the boolean
	 */
	public static boolean isWhitespace(String string) {
		boolean resultBoolean = true;
		if (string != null){
			for(int i = 0; i < string.length(); i++){
				if(!Character.isWhitespace(string.charAt(i))){
					resultBoolean = false;
					break;
				}
			}
		}
		return resultBoolean;
	}

	/**
	 * @param string
	 * @param defaultValue
	 * @return the string
	 */
	public static String nvl(String string, String defaultValue){
		return (string==null)?defaultValue:string;
	}
	/**
	 * @param string
	 * @param defaultValue
	 * @return the string
	 */
	public static String evl(String string, String defaultValue){
		return (isEmpty(string))?defaultValue:string;
	}

	/**
	 * @param stringa
	 * @param stringb
	 * @return the integer [-1/0/1]
	 */
	public static int strcmp(String stringa, String stringb){
		int resultInt=0;
		if(stringa==null){
			if(stringb==null){
				resultInt = 0;
			}else{
				resultInt = -1;
			}
		}else{
			if(stringb==null){
				resultInt = 1;
			}else{
				resultInt = stringa.compareTo(stringb);
				resultInt = (resultInt<0)?-1:(resultInt>0)?1:0;
			}
		}
		return resultInt;
	}
	/**
	 * @param string
	 * @return the length
	 */
	public static int cstrlen(String string){
		return cstrlen(string, Encoding.UTF_8);
	}
	/**
	 * @param string
	 * @param charset
	 * @return the length
	 */
	public static int cstrlen(String string, String charset){
		int resultInt;
		byte[] sourceBytes = null;
		try {
			sourceBytes = string.getBytes(charset);
			resultInt = sourceBytes.length;
		} catch (UnsupportedEncodingException e) {
			resultInt = -1;
		}
		return resultInt;
	}

	/**
	 * Remove special white space from both ends of this string. 
	 * <p>
	 * All characters that have codes less than or equal to 
	 * <code>'&#92;u0020'</code> (the space character) are considered to be 
	 * white space. 
	 * <p>
	 * java.lang.String의 trim()과 차이점은 일반적인 white space만 짜르는 것이
	 * 아니라 위에서와 같은 특수한 blank도 짤라 준다.<br>
	 * 이 소스는 IBM HOST와 데이타를 주고 받을 때 유용하게 사용했었다.
	 * 일반적으로 많이 쓰이지는 않을 것이다.
	 * @param string 
	 * @return the string
	 */
	public static String trim(String string) {
		try {
			char[] val = string.toCharArray();
			int count = val.length;
			int len = count;
			int st = 0;

			while ((st < len) && ((val[st] <= ' ') || (val[st] == '　') ) ){
				st++;
			}
			while ((st < len) && ((val[len - 1] <= ' ') || (val[len-1] == '　'))){
				len--;
			}

			return ((st > 0) || (len < count)) ? string.substring(st, len) : string;
		}
		catch(Exception e) { return ""; }
	}
	/**
	 * oldString 을 newString으로 대체
	 * @param soruceString
	 * @param oldString
	 * @param newString
	 * @return the string
	 */
	public static String replace(String soruceString, String oldString, String newString) {
		if(isEmpty(soruceString) || isEmpty(oldString)){
			return soruceString;
		}
		int pos = soruceString.lastIndexOf(oldString);
		if(pos < 0){
			return soruceString;
		}
		String replaceString = nvl(newString, "");
		StringBuffer mainSb = new StringBuffer(soruceString);
		for(; pos >= 0; pos = soruceString.lastIndexOf(oldString, pos - 1)){
			mainSb.replace(pos, pos + oldString.length(), replaceString);
		}
		return mainSb.toString();
	}

	/**
	 * 문자열 배열을 다시 [token]으로 합쳐서 반환한다. [explode, split]의 반대 개념.
	 * @param splits
	 * @param token
	 * @return the string
	 */
	public static String implode(String[] splits, String token){
		if(splits==null || splits.length<1){
			return "";
		}
		StringBuffer buffer = new StringBuffer(splits[0]);
		int size = splits.length;
		for (int index=1; index<size; index++) {
			buffer.append(token).append(splits[index]);
		}
		return buffer.toString();
	}
	/**
	 * 입력한 문자열에서 [regex]으로 구분하여 String[]로 반환한다.
	 * String.split(...)
	 * 
	 * @param source
	 * @param regex
	 * @return the String[]
	 */
	public static String[] explode(String source, String regex){
		if(isEmpty(source)){
			return EMPTY_STRING_ARRAY;
		}
		return source.split(regex);
	}
	/**
	 * 입력한 문자열에서 [token]으로 구분하여 String[]로 반환한다.
	 * @param source
	 * @param token
	 * @return the String[]
	 */
	public static String[] split(String source, String token){
		if(isEmpty(source)){
			return EMPTY_STRING_ARRAY;
		}
		if(isEmpty(token) || !source.contains(token)){
			return new String[]{source};
		}
		StringTokenizer st = new StringTokenizer(source, token, false);
		String[] splitStrings = new String[st.countTokens()];
		for (int count=0; st.hasMoreTokens(); count++) {
			splitStrings[count] = st.nextToken();
		}
		return splitStrings;
	}

	/**
	 * 입력한 문자열의 오른쪽에서부터 [size]만큼 반환.
	 * @param str
	 * @param size
	 * @return the string
	 */
	public static String right(String str, int size) {
		if (isEmpty(str)) {
			return "";
		}
		if (str.length() <= size){
			return str;
		}
		return str.substring(str.length()-size);
	}
	/**
	 * 입력한 문자열의 [start]위치 이후를 반환한다. 
	 * @param str
	 * @param start
	 * @return the string
	 */
	public static String mid(String str,int start) {
		if (isEmpty(str)){
			return "";
		}
		int ln = str.length();
		if (ln<start){
			return "";
		}
		return right(str,ln-start);
	}
	/**
	 * 입력한 문자열에서 [start]위치에서부터 [size]만큼 반환한다.
	 * @param str
	 * @param start
	 * @param size
	 * @return the string
	 */
	public static String mid(String str,int start,int size) {
		if (isEmpty(str) || size<1){
			return "";
		}
		int ln = str.length();
		if (ln<start){
			return "";
		}
		String ret = Str.right(str,ln-start);
		return Str.left(ret,size);
	}
	/**
	 * 입력한 문자열에서 왼쪽에서부터 [size]만큼 반환한다.
	 * @param str
	 * @param size
	 * @return the substring(0,size)
	 */
	public static String left(String str, int size){
		String resultString;
		if(isEmpty(str) || size<1){
			resultString = "";
		}else if(str.length()<=size){
			resultString = str;
		}else{
			resultString = str.substring(0, size);
		}
		return resultString;
	}
	/**
	 * 꽁수로 만든 왼쪽에서 몇바이트 가져오는 함수<br>
	 * 바이트 수는 ASCII 이외의 문자를 2바이트로 가정하고 가져옴<br>
	 * 버그 있을 수 있음 (Unicode 문자 쓰다보면..)
	 * @param str 문자들
	 * @param size size in bytes
	 * @param enc 인코딩 종류
	 * @return size의 크기만큼 왼쪽에서 바이트 단위로 짤라온 값
	 */
	public static String left(String str, int size, String enc) {
		int len = 0;
		byte[] src = null;
		String result = null;

		int length = size;
		try {
			src = str.getBytes(enc);
			len = src.length;

			if (len <= length){
				return str;
			}
			while (length > 0) {
				result = new String(src, 0, length, enc);
				if (!"".equals(result)){
					return result;
				}
				length--;
			}
			return "";
		} catch (java.io.UnsupportedEncodingException e) {
			return "";
		}
	}
	/**
	 * @param source
	 * @param size
	 * @return the string
	 */
	public static String cleft(String source,int size){
		return cleft(source, size, Encoding.UTF_8);
	}
	/**
	 * @param source
	 * @param size
	 * @param charset
	 * @return the string
	 */
	public static String cleft(String source, int size, String charset){
		return cmid(source, 0, size, charset);
	}
	/**
	 * @param source
	 * @param size
	 * @return the string
	 */
	public static String cright(String source, int size){
		return cright(source, size, Encoding.UTF_8);
	}
	/**
	 * @param source
	 * @param size
	 * @param charset
	 * @return the string
	 */
	public static String cright(String source, int size, String charset){
		int length = 0;
		byte[] sourceBytes = null;
		int len = size;
		try {
			sourceBytes = source.getBytes(charset);
			length = sourceBytes.length;
			if (len>=length){
				return source;
			}
			int splen = length-len;
			String ret = new String(sourceBytes,0,splen,charset);
			if ("".equals(ret)) {
				splen++;
				len--;
			}
			ret = new String(sourceBytes,splen,len,charset);
			return ret;
		} catch (java.io.UnsupportedEncodingException e) {
			return "";
		}
	}
	/**
	 * @param source
	 * @param start
	 * @return the string
	 */
	public static String cmid(String source, int start){
		return cmid(source, start, 0);
	}
	/**
	 * @param source
	 * @param start
	 * @param size
	 * @return the string
	 */
	public static String cmid(String source,int start,int size){
		return cmid(source, start, size, Encoding.UTF_8);
	}
	/**
	 * @param source
	 * @param start
	 * @param size
	 * @param charset 
	 * @return the string
	 */
	public static String cmid(String source,int start,int size,String charset) {
		int length = 0;
		byte[] sourceBytes = null;
		int len = size;
		int pos = start;
		try {
			sourceBytes = source.getBytes(charset);
			length = sourceBytes.length;
			if (pos>=length){
				return "";
			}
			int splen = length-pos;
			if (len<1 || splen<len){
				len = splen;
			}
			String ret = "";
			if (pos>0) {
				ret = new String(sourceBytes,0,pos,charset);
				if ("".equals(ret)) {
					pos++;
					len--;
				}
			}
			while (len>0) {
				ret = new String(sourceBytes,pos,len,charset);
				if (!"".equals(ret)){
					return ret;
				}
				len--;
			}
		} catch (java.io.UnsupportedEncodingException e) {
		}
		return null;
	}

	/**
	 * 숫자를 문자열로 변환하여 길이가 [size]가 되게 왼쪽에 [0]을 추가한 후 반환한다.
	 * @param number
	 * @param size
	 * @return the string
	 */
	public static <T> String f0(T number, int size){
		return lpad(String.valueOf(number), size, "0");
	}
	/**
	 * 입력한 문자열의 길이가 [size]보다 작으면 오른쪽에 길이가 [size]가 되게 공백[ ]을 추가하여 반환한다.
	 * @param str
	 * @param size
	 * @return the string
	 */
	public static String rpad(String str, int size) {
		return rpad(str, size, " ");
	}
	/**
	 * 입력한 문자열의 길이가 [size]보다 작으면 오른쪽에 길이가 [size]가 되게 특정 문자를 추가하여 반환한다.
	 * @param str
	 * @param size
	 * @param paddedString
	 * @return the string
	 */
	public static String rpad(String str, int size, String paddedString) {
		try {
			int length = str.length();
			if (length >= size){
				return str;
			}
			int chlen  = paddedString.length();
			StringBuffer buf = new StringBuffer(size);
			buf.append(str);
			while (length < size) {
				buf.append(paddedString);
				length += chlen;
			}
			return buf.toString();
		} catch(Exception e) {
			return str;
		}
	}
	/**
	 * 입력한 문자열의 길이가 [size]보다 작으면 왼쪽에 길이가 [size]가 되게 공백[ ]을 추가한 후 반환한다.
	 * @param str
	 * @param size
	 * @return the string
	 */
	public static String lpad(String str, int size) {
		return lpad(str, size, " ");
	}
	/**
	 * 입력한 문자열의 길이가 [size]보다 작으면 왼쪽에 길이가 [size]가 되게 특정 문자를 추가한 후 반환한다.
	 * @param str
	 * @param size
	 * @param paddedString  추가할 string
	 * @return the string
	 */
	public static String lpad(String str, int size, String paddedString) {
		try {
			int length = str.length();
			if (length >= size){
				return str;
			}
			int chlen  = paddedString.length();
			StringBuffer buf = new StringBuffer(size);
			while (length < size) {
				buf.append(paddedString);
				length += chlen;
			}
			buf.append(str);
			return buf.toString();
		} catch(Exception e) {
			return str;
		}
	}

	/**
	 * @param source
	 * @param size
	 * @return the string
	 */
	public static String clip(String source, int size){
		return clip(source, size, "...", Encoding.UTF_8, 0);
	}
	/**
	 * @param source
	 * @param size
	 * @param tail
	 * @param relevel
	 * @return the string
	 */
	public static String clip(String source, int size, String tail, int relevel){
		return clip(source, size, tail, Encoding.UTF_8, relevel);
	}
	/**
	 * @param source
	 * @param size
	 * @param tail
	 * @param charset
	 * @param relevel
	 * @return the string
	 */
	public static String clip(String source, int size, String tail, String charset, int relevel){
		if(isEmpty(source)){
			return "";
		}
		int length = source.length();
		int blanklength = (relevel==0)?0:(relevel+1)*2;
		int count = 0;
		int maxsize = size-blanklength;
		int index;
		for(index=0;index<length;index++){
			if(count++>maxsize){
				break;
			}
			char c = source.charAt(index);
			if(c>'\177'){
				count++;
			}
		}
		if(length<=index){
			return source;
		}
		if(isEmpty(tail)){
			return source.substring(0, index);
		}
		return (new StringBuffer(source.substring(0, index))).append(tail).toString();
	}
}
