package com.ja.freeboard.util;

import java.security.MessageDigest;

public class FBMessageDigest {
	
	public static String digest(String value) {
		
		String hashCode = null;
		
		try {
			
			
			StringBuilder sb = new StringBuilder();
			
			MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
			
			messageDigest.reset();
			messageDigest.update((value + "@!FB").getBytes());
			byte[] chars = messageDigest.digest();
			
			for(int i = 0; i < chars.length; i++) {
				
				String temp = Integer.toHexString(chars[i] & 0xff);
				
				//한자리면 0 붙힌다.
				if(temp.length() == 1) {
					sb.append("0");
				}
				
				sb.append(temp);
				
			}
			
			hashCode = sb.toString();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return hashCode;
		
	}
	
}
