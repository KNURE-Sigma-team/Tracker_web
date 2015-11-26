package com.wimk.utils;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

public class PushNotificationSender {
	
	private PushNotificationSender(){
	}
	
	private static final String URL = "https://gcm-http.googleapis.com/gcm/send";
	private static final String AUTHORIZATION_KEY = "AIzaSyCLk48A05HJnoiQ4OBhTVhVNfsaRPIVv7w";
	
	public static void sendPush(String token) throws IOException{
		URL obj = new URL(URL);
		HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
		
		con.setRequestMethod("POST");
		con.setRequestProperty("Content-Type", "application/json");
		con.setRequestProperty("Authorization", "key=" + AUTHORIZATION_KEY);

		StringBuilder urlParameters = new StringBuilder();
		urlParameters.append("{\"data\": {")
				.append("\"purpose\":\"give_point\"")
				.append("},")
				.append("\"to\":\"").append(token).append("\"")
				.append("}");
		
		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(urlParameters.toString());
		wr.flush();
		wr.close();
		con.getResponseCode();
	}
}
