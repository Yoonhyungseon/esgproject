package program.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**************************************************
* @FileName   : CommonController.java
* @Description: Commonly used functions
* @Author     : Seung-Jun. Kim
* @Version    : 2021. 2. 8
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/
@Controller
@RequestMapping("common")
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	@Value("${FILE_ROOT}")
	String FILE_ROOT;
	
	/**************************************************
	 * @MethodName : fileDownoad
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws SQLException
	 *             byte[]
	 * @Author : Jong-Hoon. Jung
	 * @Version : 2018. 11. 29.
	 **************************************************/
	@RequestMapping(value = "/imageload2", method = RequestMethod.GET, produces = "application/octet-stream; charset=utf-8")
	@ResponseBody
	public byte[] fileDownoad(HttpServletRequest request,
			HttpServletResponse response) throws IOException, SQLException {

		String fullImageFileNm = request.getParameter("fullImageFileNm");

		logger.debug("***** fullImageFileNm={}", fullImageFileNm);

//		String osname = System.getProperty("os.name");
//		if (osname.startsWith("Window")) {
//			fullImageFileNm = FILE_ROOT_WINDOW + "/" + fullImageFileNm;
//		} else {
//			fullImageFileNm = FILE_ROOT_LINUX + "/" + fullImageFileNm;
//		}
		fullImageFileNm = FILE_ROOT + "/" + fullImageFileNm;
		logger.debug("***** fullImageFileNm={}", fullImageFileNm);
		File file = new File(fullImageFileNm);

		if (!(file.exists() && file.isFile())) {
			logger.info("file is not exists");
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}

		byte[] bytes = FileCopyUtils.copyToByteArray(file);

		String fileNm = fullImageFileNm.substring(fullImageFileNm.lastIndexOf("/") + 1);
		
		response.setHeader("Content-Disposition", "attachment;filename=" + new String(fileNm.getBytes("UTF-8"), "8859_1")); // 아랍어:
		response.setContentLength(bytes.length);

		return bytes;
	}
	
	/**************************************************
	 * @MethodName : fileDownoad
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws SQLException
	 *             byte[]
	 * @Author : june85
	 * @Version : 2021. 5. 11.
	 **************************************************/
	@RequestMapping(value = "/imageload", method = RequestMethod.GET)
	public ResponseEntity<byte[]> fileDownoad2(HttpServletRequest request,
			HttpServletResponse response) throws IOException, SQLException {

		String fullImageFileNm = request.getParameter("fullImageFileNm");

		logger.debug("***** fullImageFileNm={}", fullImageFileNm);

//		String osname = System.getProperty("os.name");
//		if (osname.startsWith("Window")) {
//			fullImageFileNm = FILE_ROOT_WINDOW + "/" + fullImageFileNm;
//		} else {
//			fullImageFileNm = FILE_ROOT_LINUX + "/" + fullImageFileNm;
//		}
		fullImageFileNm = FILE_ROOT + "/" + fullImageFileNm;
		logger.debug("***** fullImageFileNm={}", fullImageFileNm);
		File file = new File(fullImageFileNm);

		if (!(file.exists() && file.isFile())) {
			logger.info("file is not exists");
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}

		byte[] bytes = FileCopyUtils.copyToByteArray(file);
		
		String mimeType = "application/octet-stream";
		String fileNm = fullImageFileNm.substring(fullImageFileNm.lastIndexOf("/") + 1);
		if(file.exists()) {
			mimeType = request.getServletContext().getMimeType(file.getAbsolutePath());
		}

		return ResponseEntity.ok()
			.contentType(MediaType.parseMediaType(mimeType))
			.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + new String(fileNm.getBytes("UTF-8"), "8859_1"))
			.body(bytes);
	}
	
	/**************************************************
	 * @MethodName : fileDownoad
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws SQLException
	 *             byte[]
	 * @Author : Jong-Hoon. Jung
	 * @Version : 2018. 11. 29.
	 **************************************************/
	@RequestMapping(value = "/filedown", method = RequestMethod.GET, produces = "application/octet-stream; charset=utf-8")
	@ResponseBody
	public byte[] filedown(HttpServletRequest request,
			HttpServletResponse response) throws IOException, SQLException {

		String fullImageFileNm = request.getParameter("fullFileNm");
		String downFileNm = request.getParameter("downFileNm");

		logger.debug("***** fullFileNm={}", fullImageFileNm);

//		String osname = System.getProperty("os.name");
//		if (osname.startsWith("Window")) {
//			fullImageFileNm = FILE_ROOT_WINDOW + "/" + fullImageFileNm;
//		} else {
//			fullImageFileNm = FILE_ROOT_LINUX + "/" + fullImageFileNm;
//		}
		fullImageFileNm = FILE_ROOT + "/" + fullImageFileNm;
		logger.debug("***** fullFileNm={}", fullImageFileNm);
		File file = new File(fullImageFileNm);

		if (!(file.exists() && file.isFile())) {
			logger.info("file is not exists");
			return null;
		}

		byte[] bytes = FileCopyUtils.copyToByteArray(file);
		
//		response.setHeader("Content-type", "application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=" + new String(downFileNm.getBytes("UTF-8"), "8859_1")); // 아랍어:
		response.setContentLength(bytes.length);

		return bytes;
	}
	
	/**************************************************
	 * @MethodName : EditorfileUpload
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws SQLException
	 *             byte[]
	 * @Author : june85
	 * @Version : 2021. 04. 13.
	 **************************************************/
	@RequestMapping(value = "/editor/fileUpload", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public byte[] EditorfileUpload(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		
		//파일정보
	    String sFileInfo = "";
	    //파일명을 받는다 - 일반 원본파일명
	    String filename = request.getHeader("file-name");
	    //파일 확장자
	    String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
	    //확장자를소문자로 변경
	    filename_ext = filename_ext.toLowerCase();
	  //이미지 검증 배열변수
	    String[] allow_file = { "jpg", "png", "bmp", "gif" };
	    
	  //돌리면서 확장자가 이미지인지 
	    int cnt = 0;
	    for (int i = 0; i < allow_file.length; i++) {
	        if (filename_ext.equals(allow_file[i])) {
	            cnt++;
	        }
	    }
	 
	    //이미지가 아님
	    if (cnt == 0) {
	    	return ("NOTALLOW_" + filename).getBytes();
	    }else {
	    	//이미지이므로 신규 파일로 디렉토리 설정 및 업로드   
	        //파일 기본경로
	        String dftFilePath = FILE_ROOT;
			
			//String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	        //파일 기본경로 _ 상세경로
	        String filePath = dftFilePath + File.separator + "editor" + File.separator;
	        File file = new File(filePath);
	        if (!file.exists()) {
	            file.mkdirs();
	        }
	        String realFileNm = "";
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	        String today = formatter.format(new java.util.Date());
	        realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	        String rlFileNm = filePath + realFileNm;
	        ///////////////// 서버에 파일쓰기 ///////////////// 
	        InputStream is = request.getInputStream();
	        OutputStream os = new FileOutputStream(rlFileNm);
	        int numRead;
	        byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	        while ((numRead = is.read(b, 0, b.length)) != -1) {
	            os.write(b, 0, numRead);
	        }
	        if (is != null) {
	            is.close();
	        }
	        os.flush();
	        os.close();
	        ///////////////// 서버에 파일쓰기 /////////////////
	 
	        // 정보 출력
	        sFileInfo += "&bNewLine=true";    
	        sFileInfo += "&sFileName=" + filename;
	        sFileInfo += "&sFileURL=/upload/editor/"+realFileNm;
	        return sFileInfo.getBytes();
	    }
	}
}