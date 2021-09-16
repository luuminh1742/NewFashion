package com.newfashion.utilities;
import java.io.BufferedReader;
import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Tien ich map data (json) tu client gui len server vao model
 */
public class HttpUtil {

	// Bien luu chuoi ket qua string json khi chuyen tu json
	private String value;
	
	public HttpUtil(String value) {
		this.value = value;
	}


	/**
	 * Map data tu string json vao trong model
	 * @param tClass
	 * @param <T>
	 * @return
	 */
	public <T> T toModel(Class<T> tClass){
		try {
			return new ObjectMapper().readValue(value, tClass);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}

	/**
	 * Phuong thuc chuyen json nhan ve tu client thanh mot kieu string json
	 * @param reader lay data tu client gui len server (json)
	 * @return
	 */
	public static HttpUtil of(BufferedReader reader) {
		StringBuilder sb = new StringBuilder();
		String line ;
		// Chuyen json thanh string json
		try {
			while((line = reader.readLine())!=null) {
				sb.append(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return new HttpUtil(sb.toString());
	}
}
