package program.common.util;

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.NetworkInterface;
import java.net.Socket;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;

import program.common.Constants;
import program.common.DataMap;

public class HttpUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(HttpUtil.class);

    public static void createCookie(String setName, String setValue, int maxage, String path, HttpServletResponse response) {
        Cookie cookie = new Cookie(setName, setValue);
        cookie.setMaxAge(maxage);
        cookie.setPath(path);

        response.addCookie(cookie);
    }

    public static void deleteCookie(String getName, Cookie[] cookies, String path, HttpServletResponse response) {

        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals(getName)) {
                    cookies[i].setMaxAge(0);
                    cookies[i].setPath(path);
                    response.addCookie(cookies[i]);
                }
            }
        }
    }

    public static String getValueFromCookie(String getName, HttpServletRequest request) {

        String getValue = "";
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals(getName)) {
                    getValue = cookies[i].getValue();
                    break;
                }
            }
        }
        return getValue;
    }

    public static HashMap<String, String> getRequestMap(HttpServletRequest request) {
        HashMap<String, String> map = new HashMap<String, String>();
        String reqName = "";

        for (Enumeration<String> e = request.getParameterNames(); e.hasMoreElements();) {
            reqName = e.nextElement();
            map.put(reqName, StrTool.sNN(request.getParameter(reqName)).trim());
        }
        map.put("lang", Constants.langCheck(request));
        return map;
    }

    /**************************************************
    * @MethodName : jsonObjToMap
    * @Description: Setting the parameter json value map
    * @param obj
    * @return HashMap<String,String>
    * @Author     : Seung-Jun. Kim
    * @Version    : 2020. 10. 16.
    **************************************************/
    public static HashMap<String, String> jsonObjToMap(JSONObject obj){
        HashMap<String, String> map = new HashMap<String, String>();
        Iterator<?> keys = obj.keySet().iterator();
        while (keys.hasNext()) {
            String key = (String) keys.next();
            map.put(key, (String) obj.get(key));
        }
        return map;
    }

	/**************************************************
	* @MethodName : getRequestDataMap
	* @Description: Setting the parameter value DataMap
	* @param request
	* @return DataMap
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 10. 16.
	**************************************************/
	@SuppressWarnings("unchecked")
    public static DataMap getRequestDataMap(HttpServletRequest request) {
    	DataMap map = new DataMap();
        String reqName = "";
        
        for (Enumeration<String> e = request.getParameterNames(); e.hasMoreElements();) {
            reqName = e.nextElement();
            boolean sw = true;

            if(reqName.equals("START_YMD") || reqName.equals("END_YMD")){
            	String str = StrTool.sNN(request.getParameter(reqName)).trim();
            	if(str.indexOf("/") > -1){
	            	try {
						map.put(reqName, DateUtil.dateParse(str, "yyyy/MM/dd", "yyyyMMdd"));
					} catch (Exception e1) {
						e1.printStackTrace();
					}

	            	sw = false;
            	}
            }
            
            String val = StrTool.sNN(request.getParameter(reqName)).trim();

            if(sw){
            	map.put(reqName, val);
            }
            
            logger.info("reqName : {}, value : {}", reqName, val);
        }
        
        if(StringUtils.isEmpty(map.getString("LANG"))) map.put("LANG", Constants.langCheck(request));
        
        map.put("sessionId", request.getSession().getId());

        return map;
    }

    /**************************************************
    * @MethodName : jsonObjToDataMap
    * @Description: Setting the parameter json value DataMap
    * @param obj
    * @return DataMap
    * @Author     : Seung-Jun. Kim
    * @Version    : 2020. 10. 16.
    **************************************************/
    @SuppressWarnings("unchecked")
	public static DataMap jsonObjToDataMap(JSONObject obj){
    	DataMap map = new DataMap();
        Iterator<?> keys = obj.keySet().iterator();
        while (keys.hasNext()) {
            String key = (String) keys.next();
            map.put(key, (String) obj.get(key));
        }
        return map;
    }

	public static boolean testInet(String url, int port) {
		Socket sock = new Socket();
		InetSocketAddress addr = new InetSocketAddress(url, port);
		try {
			sock.connect(addr,3000);
			return true;
		} catch (IOException e) {
			return false;
		} finally {
			try {sock.close();}
			catch (IOException e) {}
		}
	}
	
	public static String getMacAddress() throws UnknownHostException, SocketException{
		InetAddress ipAddress = InetAddress.getLocalHost();
		NetworkInterface networkInterface = NetworkInterface.getByInetAddress(ipAddress);
		byte[] macAddressBytes = networkInterface.getHardwareAddress();
		StringBuilder macAddressBuilder = new StringBuilder();
		
		for (int macAddressByteIndex = 0; macAddressByteIndex < macAddressBytes.length; macAddressByteIndex++){
		    String macAddressHexByte = String.format("%02X",macAddressBytes[macAddressByteIndex]);
		    macAddressBuilder.append(macAddressHexByte);
		
		    if (macAddressByteIndex != macAddressBytes.length - 1){
		        macAddressBuilder.append(":");
		    }
		}
	
		logger.info("::::::: " + macAddressBuilder.toString());
		return macAddressBuilder.toString();
	}
	
	/**************************************************
	* @MethodName : setMenuInfo
	* @Description: 페이지 메뉴값 설정
	* @param menuId
	* @param menuSubId
	* @param tabMenuId
	* @param model void
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 10. 16.
	**************************************************/
	public static void setMenuInfo(String menuId, String menuSubId, String tabMenuId, Model model){
		model.addAttribute("menuID", StringUtils.isNotEmpty(menuId) ? menuId : "");
		model.addAttribute("menuSubID", StringUtils.isNotEmpty(menuSubId) ? menuSubId : "");
		model.addAttribute("menuTab", StringUtils.isNotEmpty(tabMenuId) ? tabMenuId : "");
	}
	
	/**************************************************
	* @MethodName : getParams
	* @Description: 파라미터 정보 페이지 전달
	* @param paramMap
	* @param model void
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 10. 16.
	**************************************************/
	@SuppressWarnings("unchecked")
	public static void getParams(DataMap paramMap, Model model){
		
		for(Iterator<String> it = paramMap.keySet().iterator();it.hasNext();){
			String key = it.next();
			String value = paramMap.getString(key);
//			logger.info("model param set ::: key : {}, value : {}", key, value);
			if(StringUtils.isNotEmpty(value)) model.addAttribute(key, value);
		}
	}
	
	public static String detectMobileAgent(HttpServletRequest request) {

		String userAgent = request.getHeader("user-agent");
		if (StringUtils.isEmpty(userAgent)) return "pc";

		userAgent = userAgent.toLowerCase();
		if (userAgent.indexOf("java") > -1) {
			return "pc";
		}

		boolean mobileAgent = false;

		String ret = "pc";

		String patternStr = "";

		if (! mobileAgent) {
			//ipad 미포함
			// patternStr = "android|avantgo|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)/|plucker|pocket|psp|symbian|treo|up.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino";
			//ipad 포함
			patternStr = "android|avantgo|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od|ad)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)/|plucker|pocket|psp|symbian|treo|up.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino";
			if (eRegiTest(userAgent, patternStr)) {
				mobileAgent = true;
			}
		}

		if (! mobileAgent) {
			patternStr = "1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s-)|ai(ko|rn)|al(av|ca|co)|"
			+ "amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|"
			+ "br(e|v)w|bumb|bw-(n|u)|c55/|capi|ccwa|cdm-|cell|chtm|cldc|cmd-|co(mp|nd)|craw|da(it|ll|ng)|dbte|"
			+ "dc-s|devi|dica|dmob|do(c|p)o|ds(12|-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|"
			+ "fly(-|_)|g1 u|g560|gene|gf-5|g-mo|go(.w|od)|gr(ad|un)|haie|hcit|hd-(m|p|t)|hei-|hi(pt|ta)|"
			+ "hp( i|ip)|hs-c|ht(c(-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i-(20|go|ma)|i230|iac( |-|/)|ibro|idea|ig01|"
			+ "ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |/)|klon|kpt |kwc-|kyo(c|k)|le(no|xi)|"
			+ "lg( g|/(k|l|u)|50|54|e-|e/|-[a-w])|libw|lynx|m1-w|m3ga|m50/|ma(te|ui|xo)|mc(01|21|ca)|m-cr|"
			+ "me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|"
			+ "n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|"
			+ "pan(a|d|t)|pdxg|pg(13|-([1-8]|c))|phil|pire|pl(ay|uc)|pn-2|po(ck|rt|se)|prox|psio|pt-g|qa-a|qc(07|12|21|32|60|-[2-7]|i-)|"
			+ "qtek|r380|r600|raks|rim9|ro(ve|zo)|s55/|sa(ge|ma|mm|ms|ny|va)|sc(01|h-|oo|p-)|sdk/|se(c(-|0|1)|"
			+ "47|mc|nd|ri)|sgh-|shar|sie(-|m)|sk-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h-|v-|v )|"
			+ "sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl-|tdg-|tel(i|m)|tim-|t-mo|to(pl|sh)|ts(70|m-|m3|m5)|"
			+ "tx-9|up(.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(-| )|"
			+ "webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(-|2|g)|yas-|your|zeto|zte-";

			if (eRegiTest(userAgent.substring(0,4), patternStr)) {
				mobileAgent = true;
			}
		}

		if (mobileAgent) {
			ret = "m";
		}

		// logger.info("BaseController => ret : {}", ret);

		return ret;
	}
	
	 
	private static boolean eRegiTest(String value, String pattern) {
		Pattern p = Pattern.compile(pattern);
		Matcher m = p.matcher(value);
		if (m.find()) {
			return true;
		} else {
			return false;
		}
	}
}