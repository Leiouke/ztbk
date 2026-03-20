package com.cnpiecsb.onInterface.util;

import java.io.File;
import java.net.URI;
import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.cnpiecsb.csu.controller.BaseServiceController;



//获得sign字符串和通讯的工具类
public class signUtil extends BaseServiceController{
	private static Logger logger = LogManager.getLogger(signUtil.class.getName());
	
	// 得到sign的字符串
	public static String sign(String str, String secret) {
		StringBuilder enValue = new StringBuilder();
		enValue.append(secret);
		enValue.append(str.toString());
		enValue.append(secret);
		return encryptByMD5(enValue.toString());
	}
	// MD5
	private static String encryptByMD5(String data) {
		StringBuilder sign = new StringBuilder();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] bytes = md.digest(data.getBytes("UTF-8"));
			for (int i = 0; i < bytes.length; i++) {
				String hex = Integer.toHexString(bytes[i] & 0xFF);
				if (hex.length() == 1) {
					sign.append("0");
					}
				sign.append(hex.toUpperCase());
				}
					
			} catch (Exception e) {
				logger.info(e);
				e.printStackTrace();
			}
				return sign.toString();
	}
	
	//通讯的方法post
	public static String sendPost(String url, String data) {
		try {
			CloseableHttpClient httpclient = null;
			CloseableHttpResponse httpresponse = null;
			try {
				httpclient = HttpClients.createDefault();
				HttpPost httppost = new HttpPost(url);
				//设置超时时间
//				RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(30000).setConnectTimeout(5000).build();//设置请求和传输超时时间
//				httppost.setConfig(requestConfig);
				StringEntity stringentity = new StringEntity(data,ContentType.create("application/json", "UTF-8"));
				httppost.setEntity(stringentity);
				httpresponse = httpclient.execute(httppost);
				String response = EntityUtils.toString(httpresponse.getEntity());
				System.out.println("response="+response);
				logger.info("response="+response);
				return response;
			} finally {
				if (httpclient != null) {
					httpclient.close();
				}
				if (httpresponse != null) {
						httpresponse.close();
				}
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return null;
	}
	
	//通讯的方法post
	public static String sendPostToken(String url, String data,String token) {
		try {
			CloseableHttpClient httpclient = null;
			CloseableHttpResponse httpresponse = null;
			try {
				httpclient = HttpClients.createDefault();
				HttpPost httppost = new HttpPost(url);
				httppost.addHeader("token", token);
				//设置超时时间
//				RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(30000).setConnectTimeout(5000).build();//设置请求和传输超时时间
//				httppost.setConfig(requestConfig);
				StringEntity stringentity = new StringEntity(data,ContentType.create("application/json", "UTF-8"));
				httppost.setEntity(stringentity);
				httpresponse = httpclient.execute(httppost);
				String response = EntityUtils.toString(httpresponse.getEntity());
				System.out.println("response="+response);
				logger.info("response="+response);
				return response;
			} finally {
				if (httpclient != null) {
					httpclient.close();
				}
				if (httpresponse != null) {
						httpresponse.close();
				}
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return null;
	}
	
	//通讯的方法post
	public static String sendGet(URIBuilder uriBuilder) {
		try {
			CloseableHttpClient httpclient = null;
			CloseableHttpResponse httpresponse = null;
			try {
				httpclient = HttpClients.createDefault();
				HttpGet httpGet = new HttpGet(uriBuilder.build());
				httpresponse = httpclient.execute(httpGet);
				//System.out.println(httpresponse.getEntity());
				String response = EntityUtils.toString(httpresponse.getEntity());
				//System.out.println("response="+response);
				//logger.info("response="+response);
				return response;
			} finally {
				if (httpclient != null) {
					httpclient.close();
				}
				if (httpresponse != null) {
					httpresponse.close();
				}
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return null;
	}
		
	//通讯的方法带文件
	public static String sendPostFile(String url, String data) {
		try {
			CloseableHttpClient httpclient = null;
			CloseableHttpResponse httpresponse = null;
			try {
				httpclient = HttpClients.createDefault();
				HttpPost httppost = new HttpPost(url);
				//设置超时时间
//				RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(30000).setConnectTimeout(5000).build();//设置请求和传输超时时间
//				httppost.setConfig(requestConfig);
				MultipartEntityBuilder builder = MultipartEntityBuilder.create();
		        //builder.addBinaryBody("file", flie, ContentType.DEFAULT_BINARY, flie.getName());
		        builder.addTextBody("data", data,ContentType.TEXT_PLAIN);
		        HttpEntity multipart = builder.build();
		        httppost.setEntity(multipart);
					httpresponse = httpclient.execute(httppost);
					String response = EntityUtils.toString(httpresponse.getEntity());
					System.out.println("response="+response);
					logger.info("response="+response);
					return response;
				} finally {
					if (httpclient != null) {
						httpclient.close();
					}
					if (httpresponse != null) {
							httpresponse.close();
					}
				}
			} catch (Exception e) {
				logger.info(e.getMessage());
				e.printStackTrace();
			}
			return null;
		}
	//通讯的方法
		public static String sendPostFileOA(String url, File file,String token) {
			try {
				CloseableHttpClient httpclient = null;
				CloseableHttpResponse httpresponse = null;
				try {
					httpclient = HttpClients.createDefault();
					HttpPost httppost = new HttpPost(url);
					httppost.addHeader("token",token);
					//设置超时时间
//					RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(30000).setConnectTimeout(5000).build();//设置请求和传输超时时间
//					httppost.setConfig(requestConfig);
					// 创建 MultipartEntityBuilder 以支持文件上传
		            MultipartEntityBuilder entityBuilder = MultipartEntityBuilder.create();
		            entityBuilder.addBinaryBody("file", file, ContentType.DEFAULT_BINARY, "file.jpg"); // 替换为实际文件路径和文件名
		            HttpEntity httpEntity = entityBuilder.build();
					httppost.setEntity(httpEntity);
					httpresponse = httpclient.execute(httppost);
					String response = EntityUtils.toString(httpresponse.getEntity());
					System.out.println("response="+response);
					logger.info("response="+response);
					return response;
				} finally {
					if (httpclient != null) {
						httpclient.close();
					}
					if (httpresponse != null) {
						httpresponse.close();
					}
				}
			} catch (Exception e) {
				logger.info(e.getMessage());
				e.printStackTrace();
			}
			return null;
		}
}
