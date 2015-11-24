package com.wimk.utils;

import java.io.IOException;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

import org.apache.commons.fileupload.FileItem;

public class ImageValidator {

	private ImageValidator() {
	}

	public static boolean isImage(FileItem item) {
		boolean isImage = false;
		ImageInputStream iis;
		try {
			iis = ImageIO.createImageInputStream(item.getInputStream());
			Iterator<ImageReader> readers = ImageIO.getImageReaders(iis);
			while (readers.hasNext()) {
				ImageReader read = readers.next();
				if (read.getFormatName().equals("png") || read.getFormatName().equals("JPEG")) {
					isImage = true;
					break;
				}
			}
		} catch (IOException e) {
			isImage = false;
		}
		return isImage;
	}
}
