package program.common;

import javax.servlet.http.HttpServletRequest;

import program.common.util.HttpUtil;

import org.apache.commons.lang.StringUtils;

/**************************************************
* @FileName   : Constants.java
* @Description: 
* @Author     : Seung-Jun. Kim
* @Version    : 2020. 10. 16.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/
public class Constants {
    
	public static String langCheck(HttpServletRequest request){
		String LANG = (String)request.getParameter("LANG");
		if(StringUtils.isEmpty(LANG)) LANG = HttpUtil.getValueFromCookie("selectLocale", request);
		if(StringUtils.isEmpty(LANG)) LANG = "ko";

		return LANG;
	}	
}
