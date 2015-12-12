package com.wimk.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Map.Entry;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.common.base.Function;
import com.google.common.base.Joiner;
import com.google.common.collect.Iterables;
import com.google.common.collect.Maps;

public class Geodecoder {
	
	private static String BASE_URL = "http://maps.googleapis.com/maps/api/geocode/json";
	private static Map<String, String> PARAMS = Maps.newHashMap();
	static{
		PARAMS.put("language", "en");
		PARAMS.put("sensor", "false");
	}
	
	private Geodecoder(){
	}
	
	public static String geodecode(Double latitude, Double longitude){
		PARAMS.put("latlng", latitude.toString() + ',' + longitude.toString()); 
		String url = BASE_URL + '?' + encodeParams(PARAMS);
		String formattedAddress = "Address undefined";
		try {
			JSONObject response = JsonReader.read(url);
			JSONObject location = response.getJSONArray("results").getJSONObject(0); 
			formattedAddress = location.getString("formatted_address"); 
		} catch (IOException | JSONException e) {
			e.printStackTrace();
		}
		return formattedAddress;
	}
	
	private static String encodeParams(final Map<String, String> params) {
        final String paramsUrl = Joiner.on('&').join(
                Iterables.transform(params.entrySet(), new Function<Entry<String, String>, String>() {

                    @Override
                    public String apply(final Entry<String, String> input) {
                        try {
                            final StringBuffer buffer = new StringBuffer();
                            buffer.append(input.getKey());
                            buffer.append('=');
                            buffer.append(URLEncoder.encode(input.getValue(), "utf-8"));
                            return buffer.toString();
                        } catch (final UnsupportedEncodingException e) {
                            throw new RuntimeException(e);
                        }
                    }
                }));
        return paramsUrl;
    }
	
}
