package program.common.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import program.common.CamelMap;
import program.common.DataMap;
import program.common.util.DateFmt;
import program.common.util.FileUtil;



/**************************************************
* @FileName   : CommonService.java
* @Description: 공통 비지니스 로직
* @Author     : Seung-Jun. Kim
* @Version    : 2021. 8. 5.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/
@Service
public class CommonService {

	private static final Logger logger = LoggerFactory.getLogger(CommonService.class);
	
	@Value("${FILE_ROOT}")
	String FILE_ROOT;

	/**************************************************
	 * @MethodName : saveFile
	 * @Description: 파일 저장 후 파일 정보 리턴
	 * @param multipartRequest
	 * @param paramMap
	 *            - filePath : 저장할 파일 경로
	 * @return List<CamelMap> saveFileName : 저장된 파일 명 realFileName : 실제 파일 명
	 *         saveFilePath : 저장된 파일 경로 fileSize : 파일 사이즈 uploadName : 업로드 오브젝트의
	 *         네임값
	 * @throws Exception
	 * @Author : Seung-Jun. Kim
	 * @Version : 2021. 2. 8.
	 **************************************************/
	public List<CamelMap> saveFile(HttpServletRequest request, DataMap paramMap) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartRequest.getFileNames();
		MultipartFile multipartFile = null;

		List<CamelMap> rstFileList = new ArrayList<CamelMap>();

		String root = FILE_ROOT;
//		String osname = System.getProperty("os.name");
//		
//		if(osname.startsWith("Window")){
//			root = FILE_ROOT_WINDOW;
//		}else{
//			root = FILE_ROOT_LINUX;
//		}
		
		String filePath = null;
		if (StringUtils.isNotEmpty(paramMap.getString("filePath")))
			filePath = paramMap.getString("filePath");
		else {
			filePath = "komabio/" + DateFmt.getSimpleDate("yyyy") + "/" + DateFmt.getSimpleDate("MMdd");
		}

		root = root + "/" + filePath;
		FileUtil.mkdirs(root);

		while (iterator.hasNext()) {
			multipartFile = multipartRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				logger.debug("------------- file start -------------");
				logger.debug("name : " + multipartFile.getName());
				logger.debug("filename : " + multipartFile.getOriginalFilename());
				logger.debug("size : " + multipartFile.getSize());
				logger.debug("-------------- file end --------------\n");
				String filename = multipartFile.getOriginalFilename();

				String saveFile = DateFmt.getSimpleDate() + "_" + RandomStringUtils.randomAlphabetic(8);
				if (filename.lastIndexOf(".") > -1)
					saveFile += filename.substring(filename.lastIndexOf("."));

				writeFile(multipartFile, root, saveFile);

				CamelMap fileMap = new CamelMap();
				fileMap.put("saveFileName", saveFile);
				fileMap.put("realFileName", filename);
				fileMap.put("saveFilePath", filePath);
				fileMap.put("fileSize", multipartFile.getSize());
				fileMap.put("uploadName", multipartFile.getName());

				rstFileList.add(fileMap);
			}
		}

		return rstFileList;
	}
	
	public boolean deleteFile(CamelMap delFile) throws Exception {
		boolean sw = false;
		
		String root = FILE_ROOT;
//		String osname = System.getProperty("os.name");
//		
//		if(osname.startsWith("Window")){
//			root = FILE_ROOT_WINDOW;
//		}else{
//			root = FILE_ROOT_LINUX;
//		}
		
		logger.info("test :: "+root+"/"+delFile.getString("fileName"));
		
		File file = new File(root+"/"+delFile.getString("fileName"));
		
		if( file.exists() ){
			if(file.delete()){
				sw = true; 
			} else {
				sw = false;
			}
		} else {
			sw = false;
		}


		return sw;
	}

	/**
	 * @param multipartFile
	 * @param pathNm
	 * @param saveFile
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	private void writeFile(MultipartFile multipartFile, String pathNm, String saveFile) throws IllegalStateException, IOException {
		FileUtil.mkdirs(pathNm);
		File file = new File(pathNm + "/" + saveFile);
		multipartFile.transferTo(file);
	}
	
	/**************************************************
	 * @MethodName : saveFileMulti
	 * @Description: 배열 파일 저장 후 파일 정보 리턴
	 * @param multipartRequest
	 * @param paramMap
	 *            - filePath : 저장할 파일 경로
	 * @return List<DataMap> saveFileName : 저장된 파일 명 realFileName : 실제 파일 명
	 *         saveFilePath : 저장된 파일 경로 fileSize : 파일 사이즈 uploadName : 업로드 오브젝트의
	 *         네임값
	 * @throws Exception
	 * @Author : june85
	 * @Version : 2021. 2. 16.
	 **************************************************/
	public List<CamelMap> saveFileMulti(HttpServletRequest request, DataMap paramMap) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartRequest.getFileNames();
		
		List<CamelMap> rstFileList = new ArrayList<CamelMap>();

		String root = FILE_ROOT;
				
		String filePath = null;
		if (StringUtils.isNotEmpty(paramMap.getString("filePath")))
			filePath = paramMap.getString("filePath");
		else {
			filePath = "komabio/" + DateFmt.getSimpleDate("yyyy") + "/" + DateFmt.getSimpleDate("MMdd");
		}

		root = root + "/" + filePath;
		FileUtil.mkdirs(root);
		
		while (iterator.hasNext()) {
			List<MultipartFile> fileList = multipartRequest.getFiles(iterator.next());
			int count = 0;
			for (MultipartFile filePart : fileList) {
				String subFilePath = filePath;
				String rootPath = root;
				if (filePart.isEmpty() == false) {
					logger.debug("------------- file start -------------");
					logger.debug("name : " + filePart.getName());
					logger.debug("filename : " + filePart.getOriginalFilename());
					logger.debug("size : " + filePart.getSize());
					logger.debug("-------------- file end --------------\n");
					
					String filename = filePart.getOriginalFilename();
					
					String saveFile = DateFmt.getSimpleDate() + "_" + RandomStringUtils.randomAlphabetic(8);
					if (filename.lastIndexOf(".") > -1) saveFile += filename.substring(filename.lastIndexOf("."));
					
					writeFile(filePart, rootPath, saveFile);
	
					CamelMap fileMap = new CamelMap();
					fileMap.put("saveFileName", saveFile);
					fileMap.put("realFileName", filename);
					fileMap.put("saveFilePath", subFilePath);
					fileMap.put("fileSize", filePart.getSize());
					fileMap.put("uploadName", filePart.getName());
					fileMap.put("fileNum", count);
	
					rstFileList.add(fileMap);
				}
				count++;
			}
		}

		return rstFileList;
	}

}