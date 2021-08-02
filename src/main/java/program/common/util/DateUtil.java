package program.common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import program.common.DataMap;

public class DateUtil {

	public static String getSimpleDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		return format.format(new Date());
	}

	public static String getSimpleDate(String dateFormat) {
		SimpleDateFormat format = new SimpleDateFormat(dateFormat);
		return format.format(new Date());
	}

	/**
	 * Date pattern change
	 * @param ymd - Enter dates
	 * @param pattern - Current patterns
	 * @param returnPattern - Changing patterns
	 * @return
	 * @throws Exception
	 */
	public static String dateParse(String ymd, String pattern, String returnPattern) throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date date = sdf.parse(ymd);

		sdf = new SimpleDateFormat(returnPattern);
		return sdf.format(date);
	}

	/**
	 * Date difference calculation
	 * @param begin - Started
	 * @param end - End
	 * @return
	 * @throws Exception
	 */
	public static long diffOfDate(String begin, String end) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");

		Date beginDate = formatter.parse(begin);
		Date endDate = formatter.parse(end);

		long diff = endDate.getTime() - beginDate.getTime();
		long diffDays = diff / (24 * 60 * 60 * 1000);

		return diffDays;
	}

	/**
	 * Date of birth based on the difference to the current year / month calculate
	 * @param birthYmd - Date of birth
	 * @param pattern - Birth of a pattern
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
    public static DataMap ageYearMonth(String birthYmd, String pattern) throws Exception{
		long day = diffOfDate(dateParse(birthYmd, pattern, "yyyyMMdd"), getSimpleDate("yyyyMMdd"));

		int y = (int) (day / 365);
		int rest = (int) (day % 365);
		int month = rest / 30;

		DataMap resultMap = new DataMap();
		resultMap.put("year", y);
		resultMap.put("month", month);

		return resultMap;
	}

	/**************************************************
	 * @MethodName : calculationDate
	 * @Description: Date of +/- calculation at a given date
	 * @param ymd
	 * @param nowPattern
	 * @param newPattern
	 * @param plusNum
	 * @param minusNum
	 * @return String
	 * @throws Exception
	 * @Author     : joon
	 * @Version    : 2014. 11. 14.
	**************************************************/
	@SuppressWarnings("static-access")
    public static String calculationDate(String ymd, String nowPattern, String newPattern, int plusNum, int minusNum) throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat(nowPattern);

		Date date = sdf.parse(ymd);

		Calendar cal = Calendar.getInstance();

		cal.setTime(date);

		if(plusNum > 0){
			cal.add(cal.DATE, plusNum);
		}else if(minusNum > 0){
			cal.add(cal.DATE, - minusNum);
		}

		sdf = new SimpleDateFormat(newPattern);

		return sdf.format(cal.getTime());
	}
	
	/**************************************************
	 * @MethodName : calculationMonth
	 * @Description: Date of +/- calculation at a given date
	 * @param ym
	 * @param nowPattern
	 * @param returnPattern
	 * @param plusNum
	 * @param minusNum
	 * @return String
	 * @throws Exception
	 * @Author     : joon
	 * @Version    : 2014. 11. 14.
	**************************************************/
	@SuppressWarnings("static-access")
    public static String calculationMonth(String ymd, String nowPattern, String returnPattern, int plusNum, int minusNum) throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat(nowPattern);

		Date date = sdf.parse(ymd);

		Calendar cal = Calendar.getInstance();

		cal.setTime(date);

		if(plusNum > 0){
			cal.add(cal.MONTH, plusNum);
		}else if(minusNum > 0){
			cal.add(cal.MONTH, - minusNum);
		}

		sdf = new SimpleDateFormat(returnPattern);

		return sdf.format(cal.getTime());
	}

	public static void main(String[] args) throws Exception {
//		System.out.println(dateParse("1979/08/25", "yyyy/MM/dd", "yyyyMMdd"));
	}
}