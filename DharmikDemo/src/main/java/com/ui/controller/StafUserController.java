package com.ui.controller;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Hashtable;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.krysalis.barcode4j.impl.code128.Code128Bean;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;
import org.krysalis.barcode4j.tools.UnitConv;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;



import com.ui.dao.StafUserDAO;
import com.ui.model.Product;
import com.ui.model.StafUser;

@RestController
public class StafUserController {

	@Autowired
	StafUserDAO stafUserDao;
	
	MixController mixCon;
	
	 private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanController.class);
	 
	 @PostMapping("addStafUser")
	    public String addStafUser(@RequestBody StafUser stafuser, HttpServletRequest request, HttpSession session)  throws IOException, WriterException
	 
	    {
		 logger.info("***** Add StafUser  *****");
		 mixCon = new MixController();
			
			byte[] ii = mixCon.getImageByte(stafuser.getImage());
			String im = mixCon.uploadImage(ii, stafuser.getStafuser_number(), "Profile Picture",stafuser.getValuex(), stafuser.getValuey(), stafuser.getValuew(),stafuser.getValueh(), request);
			
			stafuser.setStafuser_image(im);
			  
		 String result = "";
		int  userid =1;
	    //   int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
	        System.out.println("============================================================="+userid);
	        String ip = request.getHeader("X-FORWARDED-FOR");
	        if (ip == null) {
	            ip = request.getRemoteAddr();
	        }

	        String s = "y";
	    	
			
			String qrcodeimage = "";
			 String membershipid = stafuser.getStafuser_number();
			String barcodeImage = "";
			String barcodevalue = membershipid;

		
			Code128Bean bar = new Code128Bean();
			final int dpi = 128;
			bar.setModuleWidth(UnitConv.in2mm(1.0f / dpi));
			bar.setFontSize(2.0);
			bar.doQuietZone(false);

			File dir1 = new File(request.getRealPath("") + "/resources/admin/images/barcode/");

			if (!dir1.exists()) {
				dir1.mkdirs();
			}
			String path1 = request.getRealPath("/resources/admin/images/barcode/");
			File uploadfile1 = new File(path1 + File.separator + membershipid + ".png");

			BufferedOutputStream bufferedoutput1 = null;
			bufferedoutput1 = new BufferedOutputStream(new FileOutputStream(uploadfile1));
			try {
				BitmapCanvasProvider canvasProvider = new BitmapCanvasProvider(bufferedoutput1, "image/x-png", dpi,
						BufferedImage.TYPE_BYTE_BINARY, false, 0);

				bar.generateBarcode(canvasProvider, barcodevalue);

				canvasProvider.finish();

				File ff = new File(path1);
				File files[] = ff.listFiles();

				for (int i = 0; i < files.length; i++) {
					if (files[i].isFile()) {

					}
				}
				/*
				 barcodeImage = request.getScheme() + "://"
				 +request.getServerName() + ":" + request.getServerPort()
				+"/PresidencyClub/resources/admin/images/barcode/" + membershipid + ".png";
				 */	 
				 
			barcodeImage = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
						+ "/DharmikDemo/resources/admin/images/barcode/" + membershipid + ".png";
						

			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				bufferedoutput1.close();
			}

			/* Generate BarCode End */

			/* Generate QRCode Start */

			File dir2 = new File(request.getRealPath("") + "/resources/admin/images/qrcode/");
			if (!dir2.exists())
				dir2.mkdirs();

			String path2 = request.getRealPath("/resources/admin/images/qrcode/");

			int size = 125;
			String fileType = "png";

			Hashtable hintMap = new Hashtable();

			hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);

			QRCodeWriter qrCodeWriter = new QRCodeWriter();

			BitMatrix byteMatrix = null;
			try {
				byteMatrix = qrCodeWriter.encode(membershipid, BarcodeFormat.QR_CODE, size, size, hintMap);
			} catch (WriterException e1) {
				e1.printStackTrace();
			}

			int matrixWidth = byteMatrix.getWidth();

			BufferedImage image1 = new BufferedImage(matrixWidth, matrixWidth, BufferedImage.TYPE_INT_RGB);
			image1.createGraphics();

			Graphics2D graphics = (Graphics2D) image1.getGraphics();
			graphics.setColor(Color.WHITE);
			graphics.fillRect(0, 0, matrixWidth, matrixWidth);
			graphics.setColor(Color.BLACK);

			for (int i = 0; i < matrixWidth; i++) {
				for (int j = 0; j < matrixWidth; j++) {
					if (byteMatrix.get(i, j)) {
						graphics.fillRect(i, j, 1, 1);
					}
				}
			}

			File qrFile = new File(path2 + File.separator + membershipid + ".png");
			ImageIO.write(image1, fileType, qrFile);
	/*
			 qrcodeimage = request.getScheme() + "://" + request.getServerName()
		      +":" + request.getServerPort()
			 +"/PresidencyClub/resources/admin/images/qrcode/" + membershipid + ".png";
		*/	
				qrcodeimage = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ "/DharmikDemo/resources/admin/images/qrcode/" + membershipid + ".png";

			/* Generate QRCode End */
		  
			 
			stafuser.setStafuser_barcode(barcodeImage);
			stafuser.setStafuser_qrcode(qrcodeimage);
	        stafuser.setCreatedBy(userid);
	        stafuser.setIpAddress(ip);
	        stafuser.setStatus(s);
	        result = stafUserDao.addStafUser(stafuser);
	    	
	     
		return result;
	       
	    }
	 
	 
		@GetMapping(value = "getAllStafUser")
		  public List<StafUser> getAllStafUser(HttpServletRequest request) {
		      logger.info("***** getAllStafUser*****");
		      return stafUserDao.getAllStafUser();
		  }
		
		@PostMapping(value = "editStafUser")
		  public String editStafUser(@RequestBody StafUser stafuser1, HttpSession session, HttpServletRequest request,
		          HttpServletResponse response) {
		      logger.info("***** EDIT editStafUser *****");
		      
		      

				String im=stafuser1.getStafuser_image();
				System.out.println("-------1-----------"+im);
					if(!stafuser1.getImage().isEmpty() ) {
				mixCon = new MixController();
				
				byte[] ii = mixCon.getImageByte(stafuser1.getImage());
				System.out.println("------2------------"+im);
				im = mixCon.uploadImage(ii, stafuser1.getStafuser_number(), "Profile Picture",stafuser1.getValuex(), stafuser1.getValuey(), stafuser1.getValuew(),stafuser1.getValueh(), request);
				
				
				
				
				}
		System.out.println("---------3---------"+im);
		stafuser1.setStafuser_image(im);
			
		      String result = "";

		     // int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
		    int id =1;
		      String ipaddress = request.getHeader("X-FORWARDED-FOR");
		      
		      if (ipaddress == null) {
		          ipaddress = request.getRemoteAddr();
		      }
		      String s = "y";
		    // System.out.println("//////////////////////////////___++++"+product.getProduct_id()); 
		      stafuser1.setCreatedBy(id);
		      stafuser1.setIpAddress(ipaddress);
		      stafuser1.setStatus(s);

		    
		        result = stafUserDao.editStafUser(stafuser1);
		      
		      return result;
		  }
		
		 @GetMapping(value = "/getStafUserById")
		  public StafUser getStafUserById(int stafuser_id, HttpServletRequest request) {
		      logger.info("***** GET getStafUserById *****");
		      return stafUserDao.getStafUserById(stafuser_id);
		  }
		 
		 @DeleteMapping(value = "deleteStafUser")
		  public void deleteTax(int stafuser_id) {
		      logger.info("***** DELETE StafUser *****");
		      stafUserDao.deleteStafUser(stafuser_id);
		  }
	 
}
