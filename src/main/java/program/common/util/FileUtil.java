package program.common.util;

import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Method;
import java.nio.channels.FileChannel;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;

/***************************************************
 * @FileName : FileUtil.java
 * @Description:
 * @Author : joon
 * @Version : 2016. 01. 14.
 * @Copyright : ⓒ ADUP. All Right Reserved
 ***************************************************/
public class FileUtil {

	/**
	 * @param filename
	 * @return the file size
	 */
	public static long filesize(String filename){
		return (new File(filename)).length();
	}

	/**
	 * @param filepath
	 * @return true if filepath ends with File.separator
	 */
	public static boolean isEndSeparator(String filepath){
		return filepath.endsWith(File.separator);
	}
	/**
	 * @param filepath
	 * @return  add File.separator at the end of filepath if filepath doesn't end with File.separator
	 */
	public static String setEndSeparator(String filepath){
		if(isEndSeparator(filepath)){
			return filepath;
		}
		return filepath+File.separator;
	}

	/**
	 * write all content
	 * @param filename
	 * @param content
	 * @param append
	 * @throws IOException
	 */
	public static void writeAll(String filename, String content, boolean append) throws IOException{
		FileWriter writer = null;
		try {
			writer = new FileWriter(filename, append);
			writer.write(content);
		} finally {
			if(writer!=null){
				writer.close();
			}
		}
	}
	/**
	 * write all content not append
	 * @param filename
	 * @param content
	 * @throws IOException
	 */
	public static void writeAll(String filename, String content) throws IOException{
		writeAll(filename, content, false);
	}
	/**
	 * @param filename
	 * @return all contents to string
	 * @throws IOException
	 */
	public static String readAll(String filename) throws IOException{
		FileReader reader = null;
		try {
			reader = new FileReader(filename);
			File file = new File(filename);
			char[] chars = new char[(int)file.length()];
			reader.read(chars);
			return new String(chars);
		} finally {
			if(reader!=null){
				reader.close();
			}
		}
	}
	/**
	 * copy using channel
	 * @param src
	 * @param dst
	 * @return true or false
	 * @throws Exception 
	 */
	public static boolean copy(String src, String dst) throws Exception{
		boolean result = true;
		File srcFile = new File(src);
		// declare stream and channel
		FileInputStream inputStream = null;
		FileOutputStream outputStream = null;
		FileChannel inputChannel = null;
		FileChannel outputChannel = null;
		try {
			// open stream
			inputStream = new FileInputStream(srcFile);
			outputStream = new FileOutputStream(dst);
			// open channel
			inputChannel = inputStream.getChannel();
			outputChannel = outputStream.getChannel();
			// send the stream through the channel
			long size = inputChannel.size();
			inputChannel.transferTo(0, size, outputChannel);
		} finally {
			if(outputChannel!=null){try {outputChannel.close();} catch (IOException e) {}}
			if(inputChannel!=null){try {inputChannel.close();} catch (IOException e) {}}
			if(outputStream!=null){try {outputStream.close();} catch (IOException e) {}}
			if(inputStream!=null){try {inputStream.close();} catch (IOException e) {}}
		}
		return result;
	}

	public static void close(Closeable c) {
		if(c!=null){
			try {
				c.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	public static void close(Object o){
		Method method = null;
		try {
			method = o.getClass().getMethod("close", (Class<?>[]) null);
			method.invoke(o, (Object[])null);
		} catch(Exception e) {
		}
	}

	/***************************************************
	 * @MethodName : removeFile
	 * @Description: File delete
	 * @param : String fileName
	 * @return : boolean
	 * @Author : joon
	 * @Version : 2016. 01. 14.
	 ***************************************************/
	public static boolean removeFile(String fileName) {
		File file = new File(fileName);
		return file.isFile() && file.exists() && file.delete();
	}
	public static boolean removeDir(String dirname){
		return removeDir(new File(dirname));
	}

	/**
	 * @param file
	 * @return
	 */
	public static boolean removeDir(File file) {
		if(file.exists()){
			if(file.isFile()){
				return file.delete();
			}
			boolean all = false;
			for(File fl : file.listFiles()){
				if(".".equals(fl.getName()) || "..".equals(fl.getName())){
					continue;
				}
				if(fl.isFile()){
					if(!fl.delete()){
						all = false;
					}
				}else{
					if(!removeDir(fl)){
						all = false;
					}
				}
			}
			return all;
		}
		return false;
	}

	/***************************************************
	 * @MethodName : renameFile
	 * @Description: file rename
	 * @param : String saveDirectory, String filename, String newFileName
	 * @return : boolean
	 * @Author : joon
	 * @Version : 2016. 01. 14.
	 ***************************************************/
	public static boolean renameFile(String src, String dst) {
		return renameFile(new File(src), new File(dst));
	}

	public static boolean renameFile(File sf, File df) {
		try{
			return sf.exists() && !df.exists() && sf.renameTo(df);
		}catch(Exception e){
			return false;
		}
	}

	/***************************************************
	 * @MethodName : mkdir
	 * @Description: make dir
	 * @param : String dirPath
	 * @return : void
	 * @Author : joon
	 * @Version : 2016. 01. 14.
	 ***************************************************/
	public static boolean mkdir(String dir) {
		return mkdir(new File(dir));
	}

	public static boolean mkdir(File file) {
		if (!file.exists() && !file.isDirectory()) {
			return file.mkdir();
		}
		return true;
	}
	public static boolean mkdirs(String dir){
		return mkdirs(new File(dir));
	}
	public static boolean mkdirs(File dir){
		if(!dir.exists() && !dir.isDirectory()){
			return dir.mkdirs();
		}
		return true;
	}

	/**
	 * @param filepath
	 * @param dotext
	 * @return
	 */
	public static String filename(String filepath, String sep, String dotext) {
		String filename = filepath + dotext;
		int index = 0;
		while(FileUtil.exists(filename)){
			filename = filepath + sep + index++ + dotext;
		}
		return filename;
	}

	/**
	 * @param filename
	 * @return
	 */
	public static boolean exists(String filename) {
		File file = new File(filename);
		return file.exists();
	}
}