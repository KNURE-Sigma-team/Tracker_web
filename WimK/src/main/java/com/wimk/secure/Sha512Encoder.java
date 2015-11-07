package com.wimk.secure;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.security.crypto.password.PasswordEncoder;;

public class Sha512Encoder implements PasswordEncoder{

	public String encode(CharSequence rawPassword) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		md.update(rawPassword.toString().getBytes());
		StringBuilder sb = new StringBuilder();
		byte[] mdbytes = md.digest();
		for(byte b : mdbytes){
			sb.append(Integer.toHexString((b & 0xFF)+0x100).substring(1));
		}
		return sb.toString();
	}

	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		return encode(rawPassword).equals(encodedPassword);
	}

}