package program.common.util;

import program.common.DataMap;

public class Paging {
	
	@SuppressWarnings("unchecked")
	public static DataMap initDataMapPage(int rowMax, int pageCount, int rowCount, int nowPage){
		// 첫 로딩시 초기화
		
		DataMap pageMap = new DataMap();
		pageMap.put("pageCount", pageCount);
		pageMap.put("rowCount", rowCount);		
		pageMap.put("nowPage", nowPage);
		
		pageMap.put("rowMax", rowMax);
		
		// 쿼리 조회 범위 설정
		pageMap.put("startRowNum", (nowPage - 1) * rowCount + 1);
		pageMap.put("endRowNum", pageMap.getInt("startRowNum") + rowCount);
		pageMap.put("scopeRow", (nowPage - 1) * rowCount);
		
		int maxPage = (rowMax / rowCount + (int)(Math.ceil(rowMax % rowCount / (double)rowCount)));
		int startPage = (1 + (pageCount * (nowPage / pageCount - ((nowPage % pageCount == 0) ? 1 : 0))));
		int endPage = (startPage + pageCount - 1);
		if(endPage > maxPage) endPage = maxPage;
		
		pageMap.put("maxPage", maxPage);
		pageMap.put("startPage", startPage);
		pageMap.put("endPage", endPage);
		pageMap.put("nav", makePageHTML(pageCount, rowCount, rowMax, nowPage));
		
		return pageMap;
	}
	
	/************************************************** 
	 * @MethodName : pageStartNum
	 * @Description: 페이지 시작 계산
	 * @param rowCount
	 * @param curPage
	 * @return int
	 * @Author     : joon
	 * @Version    : 2015. 4. 24.
	**************************************************/
	public static int pageStartNum(int rowCount, int curPage){
		return (curPage - 1) * rowCount;
	}
	
	public static String makePageHTML(int pageCount, int rowCount, int rowMax, int nowPage){
		StringBuilder sb = new StringBuilder();
		int pCount = pageCount;
		int rCount = rowCount;
		int rMax = rowMax;
		int nPage = nowPage;
				
		if(pCount > 0 && rCount > 0 && rMax > 0 && nPage > 0){
			// 총 페이지 수
			int maxPage = rMax / rCount + (int)(Math.ceil(rMax % rCount / (double)rCount));
			int startPage = 1;
			int endPage = pCount;
			
			startPage = 1 + (pCount * (nPage / pCount - ((nPage % pCount == 0) ? 1 : 0)));
			endPage = startPage + pCount - 1;
			
			if(endPage > maxPage) endPage = maxPage;
			
			sb.append("<ul class=\"pagination\">\n");
			
			// 1. start page
			sb.append(getAHref(1, "first", nowPage));
		
			// 2. -10 page
			if(startPage - 1 > 1){
				sb.append(getAHref(startPage-1, "prev", nowPage));
			}

			// 3. 1...10
			for(int i = startPage; i <= endPage; i++){
				sb.append(getAHref(i, String.valueOf(i), nowPage));
			}

			// 4. +10 page
			if(endPage + 1 <= maxPage){
				sb.append(getAHref(endPage + 1, "next", nowPage));
			}
			// 5. last page
			sb.append(getAHref(maxPage, "last", nowPage));
			sb.append("</ul>\n");
		}
		return sb.toString();
	}
	
	/**
	 * make <a href>
	 * @param nPage
	 * @param title
	 * @return
	 */
	public static String getAHref(int nPage, String title, int nowPage){
		String css = "";
		String npage = nowPage + "";
		
		if(npage.equals(title)){
			css = "active";
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("<li class=\"").append(css).append("\">\n");
		
		if ("first".equals(title)){
			sb.append("<a href=\"javascript:void(0);\" onClick='goPage(").append(nPage).append(")' ").append(" >");
			sb.append("<img src=\"/adminLayer/images/common/pre_btn_x2.png\">");
			sb.append("</a>\n");
		} else if ("prev".equals(title)){
			sb.append("<a href=\"javascript:void(0);\" onClick='goPage(").append(nPage).append(")' ").append(" >");
			sb.append("<img src=\"/adminLayer/images/common/pre_btn.png\">");
			sb.append("</a>\n");
		} else if ("next".equals(title)){
			sb.append("<a href=\"javascript:void(0);\" onClick='goPage(").append(nPage).append(")' ").append(" >");
			sb.append("<img src=\"/adminLayer/images/common/next_btn.png\">");
			sb.append("</a>\n");
		} else if ("last".equals(title)){
			sb.append("<a href=\"javascript:void(0);\" onClick='goPage(").append(nPage).append(")' ").append(" >");
			sb.append("<img src=\"/adminLayer/images/common/next_btn_x2.png\">");
			sb.append("</a>\n");
		} else {
			sb.append("<a href='#none' onClick='goPage(").append(nPage).append(")' ").append(" >");
			sb.append(title);
			sb.append("</a>\n");
		}
		sb.append("</li>\n");
		
		return sb.toString();
	}
}
