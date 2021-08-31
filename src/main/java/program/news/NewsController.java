package program.news;

import java.io.IOException;
import java.text.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import program.common.CamelMap;
import program.common.DataMap;
import program.common.util.HttpUtil;
import program.textboard.TextBoardController;


/**************************************************
* @FileName : NewsController.java
* @Description: 뉴스 컨트롤러
* @Author : Hyung-Seon. Yoon
* @Version : 2021. 7. 5.
* @Copyright : ⓒADUP. All Right Reserved
**************************************************/
@Controller
@RequestMapping(value = {"news"})
public class NewsController {
	
//	@Autowired
//	private TextBoardService textBoardService;
	private static final Logger logger = LoggerFactory.getLogger(TextBoardController.class);
	
	/**************************************************
	* @MethodName : newsList
	* @Description: 뉴스 리스트
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 5.
	**************************************************/
	@RequestMapping(value = {"/newsList"})
	public String newsList(Model model) {
		return "contents/news/newsList";
	}
	
	/**************************************************
	* @MethodName : newsView
	* @Description: 뉴스 리스트 상세
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/newsView"})
	public String newsView(HttpServletRequest request, Model model) {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		System.out.print(paramMap);
		HttpUtil.getParams(paramMap, model);
		
		return "contents/news/newsView";
	}
	
	/**************************************************
	* @MethodName : getNewsList
	* @Description : 뉴스 크롤링
	* @param request
	* @param model
	* @return ModelAndView
	* @Author : Na-Young. Woo
	* @Version : 2021. 8. 30.
	**************************************************/
	@ResponseBody
	@RequestMapping(value = { "/getNewsList" }, method = { RequestMethod.GET, RequestMethod.POST })
	public JSONObject getNewsList(HttpServletRequest request, Model model) {
		logger.debug("NewsController : getNewsList - start");
		
		JSONObject result = new JSONObject();
		JSONArray arr = new JSONArray();

//		String url = "https://search.naver.com/search.naver?where=news&sm=tab_jum&query=esg";
		String url = "https://search.naver.com/search.naver?where=news&query=esg&sm=tab_opt&sort=0&photo=0&field=0&pd=0&ds=&de=&docid=&related=0&mynews=1&office_type=1&office_section_code=1&news_office_checked=1469&nso=&is_sug_officeid=0";
		Document doc = null;

		try {
			
			doc = Jsoup.connect(url).get();

			Elements title = doc.select(".news_tit");
			Elements content = doc.select(".api_txt_lines");
			Elements thumb = doc.select(".api_get");
			Elements newspaper = doc.select("a.info.press");
			
			for (int i = 0; i < 9; i++) {
				Element title_el = title.get(i);
				Element content_el = content.get(i);
				String thumb_el = thumb.get(i).attr("src");
				String link_url = title.get(i).attr("href");
				Element newspaper_el = newspaper.get(i);
				
				JSONObject obj = new JSONObject();
				
				obj.put("title", title_el.text());
				obj.put("content", content_el.text().substring(0, 68) + "...");
				obj.put("thumb", thumb_el);
				obj.put("url", link_url);
				obj.put("newspaper", newspaper_el.text());
				
				arr.add(obj);
			}
			result.put("result", "success");
			result.put("news", arr);
		} catch (Exception e) {
			logger.debug("뉴스 리스트 조회 오류", e);
			result.put("result", "fail");
			e.printStackTrace();
		}

		logger.debug("NewsController : getNewsList - end");
		return result;
	}
	
	/**************************************************
	* @MethodName : getNewsInfo
	* @Description : 뉴스 상세 크롤링
	* @param request
	* @param model
	* @return JSONObject
	* @Author : Na-Young. Woo
	* @Version : 2021. 8. 31.
	**************************************************/
	@ResponseBody
	@RequestMapping(value = { "/getNewsInfo" }, method = { RequestMethod.GET, RequestMethod.POST })
	public JSONObject getNewsInfo(HttpServletRequest request, Model model) {
		logger.debug("NewsController : getNewsInfo - start");
		
		JSONObject result = new JSONObject();
		JSONArray arr = new JSONArray();
		
		DataMap paramMap = HttpUtil.getRequestDataMap(request);

		String url = paramMap.getString("url");
		Document doc = null;

		try {
			
			doc = Jsoup.connect(url).get();
			JSONObject obj = new JSONObject();

			Element title = doc.select(".title").first();
			Element date = doc.select("dd").first();
			Element reporter = doc.select(".writer").first();
			String thumb = doc.select("img").first().attr("src");
			
			obj.put("title", title.text());
			obj.put("date", date.text());
			if(reporter != null) obj.put("reporter", reporter.text());
			obj.put("thumb", thumb);
			
			Elements content = doc.select(".editor-p");
			System.out.print(content.size());
			
			for (int i = 0; i < content.size(); i++) {
				Element content_el = content.get(i);
								
				arr.add(content_el.text());
				
			}			
			obj.put("content", arr);
			
			result.put("result", "success");
			result.put("news", obj);
		} catch (Exception e) {
			logger.debug("뉴스 정보 조회 오류", e);
			result.put("result", "fail");
			e.printStackTrace();
		}

		logger.debug("NewsController : getNewsInfo - end");
		return result;
	}

}
	
	