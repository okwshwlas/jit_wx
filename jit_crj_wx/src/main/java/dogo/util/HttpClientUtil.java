package dogo.util;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Date;
import java.util.Map;

import net.sf.json.JSON;




/**
 * 
 */
public class HttpClientUtil {

	public static String getFeiInfo(String posturl,String json ) throws IOException{
        //发送的请求参数，发送的格式也是Json的  "http://221.8.52.227/mc/api/console/token"
		
                String data = json;
                BufferedReader in = null;
                String result = "";
        try {
                //请求的地址
            URL url = new URL(posturl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            //发送Post强求，开启其读写的功能
            conn.setDoOutput(true);
            conn.setDoInput(true);
            //这些参数是看了网上有人的建议，用上之后效果不大
            conn.setRequestProperty("accpt", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; rv:27.0) Gecko/20100101 Firefox/27.0");
            conn.setRequestProperty("X-Requested-With", "XMLHttpRequest");
            conn.setRequestProperty("Connection", "keep-alive");
            conn.setRequestProperty("Content-Type", "application/json");
            
            conn.setRequestMethod("POST");
            //发送Post请求
            conn.connect();
            OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream());
            //发送参数
            writer.write(data);
            writer.flush();
            // 解析响应信息，用了很多种，用了字节流啊，处理流都试过了，这是最后试的那个
            //主要是不能解决乱码问题，响应的东西还是能够收到，就是乱码
            ByteArrayOutputStream baos=new ByteArrayOutputStream();
            byte[] buf = new byte[1024];
            int len = 0;
            InputStream is = conn.getInputStream();
            while((len=is.read(buf))!=-1){
//                    System.out.println(len);
                    baos.write(buf, 0, len);
            }
            baos.flush();
            //这个utf8给予了太多的希望
            
//            // 定义BufferedReader输入流来读取URL的响应
//            in = new BufferedReader(
//                    new InputStreamReader(conn.getInputStream()));
//            String line;
//            while ((line = in.readLine()) != null) {
//                result += line;
//            }
            result = baos.toString("utf8");
//            System.out.println(baos.toString("utf8"));
            baos.close();
            is.close();
        } catch (MalformedURLException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return result;
    }
	
	 /**
     * 向指定URL发送GET方法的请求
     * 
     * @param url
     *            发送请求的URL
     * @param param
     *            请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return URL 所代表远程资源的响应结果
     */
    public static String sendGet(String url, String param) {
        String result = "";
        BufferedReader in = null;
        String urlNameString = url + "?" + param;
     //   System.out.println(urlNameString);
        try {
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map map = connection.getHeaderFields();
            // 遍历所有的响应头字段
//            for (String key : map.keySet()) {
//                System.out.println(key + "--->" + map.get(key));
//            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
        	Date date = new Date();
//            CrjErrorLog.saveLog("INFO",date+":GET请求出现异常！" + e + urlNameString);
//            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }
    public static String sendGetToken(String url, String param,String token) {
        String result = "";
        BufferedReader in = null;
        String urlNameString = url + "?" + param;
     //   System.out.println(urlNameString);
        try {
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            connection.setRequestProperty("token",token); 
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map map = connection.getHeaderFields();
            // 遍历所有的响应头字段
//            for (String key : map.keySet()) {
//                System.out.println(key + "--->" + map.get(key));
//            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
        	Date date = new Date();
//            CrjErrorLog.saveLog("INFO",date+":GET请求出现异常！" + e + urlNameString);
//            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }
    /**
     * 向指定 URL 发送POST方法的请求
     * 
     * @param url
     *            发送请求的 URL
     * @param param
     *            请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return 所代表远程资源的响应结果
     */
    public static String sendPost(String url, String param,String token) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("token",token); 

            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！"+e);
            e.printStackTrace();
            try{
                if(out!=null){
                    out.close();
                }
                if(in!=null){
                    in.close();
                }
            }
            catch(IOException ex){
                ex.printStackTrace();
            }
        }
        //使用finally块来关闭输出流、输入流
        finally{
            try{
                if(out!=null){
                    out.close();
                }
                if(in!=null){
                    in.close();
                }
            }
            catch(IOException ex){
                ex.printStackTrace();
            }
        }
        return result;
    }
    
    
    public static String post(String posturl,String data ,String token) throws IOException{
        //发送的请求参数，发送的格式也是Json的  "http://221.8.52.227/mc/api/console/token"
		
                BufferedReader in = null;
                String result = "";
        try {
                //请求的地址
            URL url = new URL(posturl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            //发送Post强求，开启其读写的功能
            conn.setDoOutput(true);
            conn.setDoInput(true);
            //这些参数是看了网上有人的建议，用上之后效果不大
            conn.setRequestProperty("accpt", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; rv:27.0) Gecko/20100101 Firefox/27.0");
            conn.setRequestProperty("X-Requested-With", "XMLHttpRequest");
            conn.setRequestProperty("Connection", "keep-alive");
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            conn.setRequestProperty("token", token);
            
            conn.setRequestMethod("POST");
            //发送Post请求
            conn.connect();
            OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream());
            //发送参数
            writer.write(data);
            writer.flush();
            // 解析响应信息，用了很多种，用了字节流啊，处理流都试过了，这是最后试的那个
            //主要是不能解决乱码问题，响应的东西还是能够收到，就是乱码
            ByteArrayOutputStream baos=new ByteArrayOutputStream();
            byte[] buf = new byte[1024];
            int len = 0;
            InputStream is = conn.getInputStream();
            while((len=is.read(buf))!=-1){
//                    System.out.println(len);
                    baos.write(buf, 0, len);
            }
            baos.flush();
            //这个utf8给予了太多的希望
            
//            // 定义BufferedReader输入流来读取URL的响应
//            in = new BufferedReader(
//                    new InputStreamReader(conn.getInputStream()));
//            String line;
//            while ((line = in.readLine()) != null) {
//                result += line;
//            }
            result = baos.toString("utf8");
//            System.out.println(baos.toString("utf8"));
            baos.close();
            is.close();
        } catch (MalformedURLException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return result;
    }
    
    /**
     * 向指定 URL 发送POST方法的请求
     * 
     * @param url
     *            发送请求的 URL
     * @param param
     *            请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return 所代表远程资源的响应结果
     */
    public static String sendPost(String url, String param) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！"+e);
            e.printStackTrace();
            try{
                if(out!=null){
                    out.close();
                }
                if(in!=null){
                    in.close();
                }
            }
            catch(IOException ex){
                ex.printStackTrace();
            }
        }
        //使用finally块来关闭输出流、输入流
        finally{
            try{
                if(out!=null){
                    out.close();
                }
                if(in!=null){
                    in.close();
                }
            }
            catch(IOException ex){
                ex.printStackTrace();
            }
        }
        return result;
    }
    public static String wxpost(String posturl,String data ) throws IOException{
        //发送的请求参数，发送的格式也是Json的  "http://221.8.52.227/mc/api/console/token"
		
                BufferedReader in = null;
                String result = "";
        try {
                //请求的地址
            URL url = new URL(posturl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            //发送Post强求，开启其读写的功能
            conn.setDoOutput(true);
            conn.setDoInput(true);
            //这些参数是看了网上有人的建议，用上之后效果不大
            conn.setRequestProperty("accpt", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; rv:27.0) Gecko/20100101 Firefox/27.0");
            conn.setRequestProperty("X-Requested-With", "XMLHttpRequest");
            conn.setRequestProperty("Connection", "keep-alive");
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            
            conn.setRequestMethod("POST");
            //发送Post请求
            conn.connect();
            OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream());
            //发送参数
            writer.write(data);
            writer.flush();
            // 解析响应信息，用了很多种，用了字节流啊，处理流都试过了，这是最后试的那个
            //主要是不能解决乱码问题，响应的东西还是能够收到，就是乱码
            ByteArrayOutputStream baos=new ByteArrayOutputStream();
            byte[] buf = new byte[1024];
            int len = 0;
            InputStream is = conn.getInputStream();
            while((len=is.read(buf))!=-1){
//                    System.out.println(len);
                    baos.write(buf, 0, len);
            }
            baos.flush();
            //这个utf8给予了太多的希望
            
//            // 定义BufferedReader输入流来读取URL的响应
//            in = new BufferedReader(
//                    new InputStreamReader(conn.getInputStream()));
//            String line;
//            while ((line = in.readLine()) != null) {
//                result += line;
//            }
            result = baos.toString("utf8");
//            System.out.println(baos.toString("utf8"));
            baos.close();
            is.close();
        } catch (MalformedURLException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return result;
    }
    public static String getFeiInfoToken(String posturl,String json,String token ) throws IOException{
        //发送的请求参数，发送的格式也是Json的  "http://221.8.52.227/mc/api/console/token"
		
                String data = json;
                BufferedReader in = null;
                String result = "";
        try {
                //请求的地址
            URL url = new URL(posturl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            //发送Post强求，开启其读写的功能
            conn.setDoOutput(true);
            conn.setDoInput(true);
            //这些参数是看了网上有人的建议，用上之后效果不大
            conn.setRequestProperty("accpt", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; rv:27.0) Gecko/20100101 Firefox/27.0");
            conn.setRequestProperty("X-Requested-With", "XMLHttpRequest");
            conn.setRequestProperty("Connection", "keep-alive");
            conn.setRequestProperty("Content-Type", "application/json");
            
            conn.setRequestMethod("POST");
            //发送Post请求
            conn.connect();
            OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream());
            //发送参数
            writer.write(data);
            writer.flush();
            // 解析响应信息，用了很多种，用了字节流啊，处理流都试过了，这是最后试的那个
            //主要是不能解决乱码问题，响应的东西还是能够收到，就是乱码
            ByteArrayOutputStream baos=new ByteArrayOutputStream();
            byte[] buf = new byte[1024];
            int len = 0;
            InputStream is = conn.getInputStream();
            while((len=is.read(buf))!=-1){
//                    System.out.println(len);
                    baos.write(buf, 0, len);
            }
            baos.flush();
            //这个utf8给予了太多的希望
            
//            // 定义BufferedReader输入流来读取URL的响应
//            in = new BufferedReader(
//                    new InputStreamReader(conn.getInputStream()));
//            String line;
//            while ((line = in.readLine()) != null) {
//                result += line;
//            }
            result = baos.toString("utf8");
//            System.out.println(baos.toString("utf8"));
            baos.close();
            is.close();
        } catch (MalformedURLException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return result;
    }
    /** 
    * 发送HttpPost请求 
    *  
    * @param strURL 
    *            服务地址 
    * @param params 
    *            json字符串,例如: "{ \"id\":\"12345\" }" ;其中属性名必须带双引号<br/> 
    * @return 成功:返回json字符串<br/> 
    */  
   public static String mbpost(String strURL, String params,String token) {  
       System.out.println(strURL);  
       System.out.println(params);  
       try {  
           URL url = new URL(strURL);// 创建连接  
           HttpURLConnection connection = (HttpURLConnection) url  
                   .openConnection();  
           connection.setDoOutput(true);  
           connection.setDoInput(true);  
           connection.setUseCaches(false);  
           connection.setInstanceFollowRedirects(true);  
           connection.setRequestMethod("POST"); // 设置请求方式  
           connection.setRequestProperty("Accept", "application/json"); // 设置接收数据的格式  
           connection.setRequestProperty("Content-Type", "application/json"); // 设置发送数据的格式 
           connection.setRequestProperty("token", token);
           connection.connect();  
           OutputStreamWriter out = new OutputStreamWriter(  
                   connection.getOutputStream(), "UTF-8"); // utf-8编码  
           out.append(params);  
           out.flush();  
           out.close();  
           // 读取响应  
           int length = (int) connection.getContentLength();// 获取长度  
           InputStream is = connection.getInputStream();  
           if (length != -1) {  
               byte[] data = new byte[length];  
               byte[] temp = new byte[512];  
               int readLen = 0;  
               int destPos = 0;  
               while ((readLen = is.read(temp)) > 0) {  
                   System.arraycopy(temp, 0, data, destPos, readLen);  
                   destPos += readLen;  
               }  
               String result = new String(data, "UTF-8"); // utf-8编码  
               System.out.println(result);  
               return result;  
           }  
       } catch (IOException e) {  
           // TODO Auto-generated catch block  
           e.printStackTrace();  
       }  
       return "error"; // 自定义错误信息  
   }  
    
    

public static void main(String[] args){
		
		try{
//			getFeiInfo();
		}catch(Exception e){}
	}
   
}