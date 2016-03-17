/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ttc.util;

/**
 *
 * @author Masaki
 */

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class CsrfUtil {
	private static int TOKEN_LENGTH = 16;
	
	public static String getToken(){
		byte[] token = new byte[TOKEN_LENGTH];
		StringBuffer buff = new StringBuffer();
		SecureRandom randam = null;
		
		try{
			randam = SecureRandom.getInstance("SHA1PRNG");
			randam.nextBytes(token);
			
			for(int i = 0;i < token.length;i++){
				buff.append(String.format("%02x", token[i]));
			}
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace();
		}
		
		return buff.toString();
	}
}
