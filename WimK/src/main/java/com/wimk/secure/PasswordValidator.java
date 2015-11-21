package com.wimk.secure;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PasswordValidator{
	
	  private Pattern pattern;
	  private Matcher matcher;
 
	  private static final String PASSWORD_PATTERN = 
              "([A-Za-z0-9\\*\\.\\?\\+\\-!;,]{8,20})";
	        
	  public PasswordValidator(){
		  pattern = Pattern.compile(PASSWORD_PATTERN);
	  }
	  
	  public boolean validate(final String password){
		  matcher = pattern.matcher(password);
		  return matcher.matches();
	  }
}