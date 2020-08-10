package com.ui.controller;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Hashtable;
import java.util.List;

import org.apache.commons.codec.binary.Base64;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;



@RestController
public class MixController {

 
  private static final Logger logger = LoggerFactory.getLogger(MixController.class);
  

  
  public String uploadImage(MultipartFile file, String folderName,int valuex, int valuey, int valuew,int valueh, HttpServletRequest request) {
    logger.info("****** uploadImage *******");
    String imagePath = null;

    try {
    	byte[] bytes =  file.getBytes();
			
		File dir = new File(request.getRealPath("")+"/resources/admin/images/" + File.separator +folderName );
		if (!dir.exists()) 
			dir.mkdirs();
		String path = request.getRealPath("/resources/admin/images/"+folderName+"/");
		 File uploadfile = new File(path + File.separator + file.getOriginalFilename());
        ByteArrayInputStream in = new ByteArrayInputStream(bytes);

        try {
        	BufferedImage img = ImageIO.read(in);
    		
    		Image scaledImage = img.getScaledInstance(valuew-1, valueh-1, Image.SCALE_SMOOTH);
            BufferedImage SubImgage = img.getSubimage(valuex, valuey, valuew-1, valueh-1);
            Graphics2D drawer = SubImgage.createGraphics();
            drawer.setComposite(AlphaComposite.Src);
            drawer.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
            drawer.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
            drawer.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            drawer.drawImage(scaledImage, valuew-1, valueh-1, null);
            drawer.dispose();
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            ImageIO.write(SubImgage, "jpg", buffer);
            bytes = buffer.toByteArray();
            
        } catch (IOException e) {
				/* System.out.println("ERROR OCCURED == "+e); */
        }
        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(uploadfile));
        bufferedOutputStream.write(bytes);
        bufferedOutputStream.close();
			
			/*
			 * imagePath = request.getScheme() + "://" + request.getServerName() + ":" +
			 * request.getServerPort() + "/PresidencyClub/resources/admin/images/" +
			 * folderName + "/" + file.getOriginalFilename();
			 * 
			 */
			
			  imagePath = request.getScheme() + "://" + request.getServerName() + ":" +
			  request.getServerPort() + "/DharmikDemo/resources/admin/images/" + folderName
			  + "/" + file.getOriginalFilename();
			 
			/* imagepath */
    } catch (Exception e) {
        imagePath = null;
        
			/* System.out.println("Erorrrrrrrrrrrrrrrr"+e); */
    }

		/* System.out.println("pathhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhr"+imagePath); */
    return imagePath;

}
  
  
  public String uploadImage(byte[] file, String filename, String folderName,int valuex, int valuey, int valuew,int valueh, HttpServletRequest request) {
	    logger.info("****** uploadImage2 *******");
	    String imagePath = null;

	    try {
	    	filename = filename+".jpeg";
	    	//byte[] bytes =  file.getBytes();
	    	byte[] bytes = file;
			
			File dir = new File(request.getRealPath("")+"/resources/admin/images/" + File.separator +folderName );
			if (!dir.exists()) 
				dir.mkdirs();
			String path = request.getRealPath("/resources/admin/images/"+folderName+"/");
			 File uploadfile = new File(path + File.separator + filename);
	        ByteArrayInputStream in = new ByteArrayInputStream(bytes);

	        try {
	        	BufferedImage img = ImageIO.read(in);
	    		
	    		Image scaledImage = img.getScaledInstance(valuew-1, valueh-1, Image.SCALE_SMOOTH);
	            BufferedImage SubImgage = img.getSubimage(valuex, valuey, valuew-1, valueh-1);
	            Graphics2D drawer = SubImgage.createGraphics();
	            drawer.setComposite(AlphaComposite.Src);
	            drawer.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
	            drawer.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
	            drawer.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
	            drawer.drawImage(scaledImage, valuew-1, valueh-1, null);
	            drawer.dispose();
	            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
	            ImageIO.write(SubImgage, "jpg", buffer);
	            bytes = buffer.toByteArray();
	            
	        } catch (IOException e) {
	            System.out.println("ERROR OCCURED == "+e);
	        }
	        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(uploadfile));
	        bufferedOutputStream.write(bytes);
	        bufferedOutputStream.close();
	        imagePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
	                + "/DharmikDemo/resources/admin/images/" + folderName + "/" + filename;
	        
			/*imagepath presidency*/
	    } catch (Exception e) {
	    	
	        imagePath = null;
	    }

	    return imagePath;

	}
  
  public byte[] getImageByte(String baseUrl64) {
	  logger.info("****** getiamge byte *******");
	  byte[] byteArray = Base64.decodeBase64(baseUrl64.getBytes());
	  
	  
	 	 
	  String decodedString = new String(byteArray);
	 
	
	  return byteArray;
  }
  
 
  
}
