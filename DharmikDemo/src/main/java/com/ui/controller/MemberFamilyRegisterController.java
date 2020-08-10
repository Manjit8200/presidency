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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.ui.dao.MemberFamilyRegisterDAO;
import com.ui.model.MasterMemberRegister;
import com.ui.model.MemberFamilyRegister;
import com.ui.model.Product;

@RestController
public class MemberFamilyRegisterController {

	
	  private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanRegisterController.class);
		
	  	@Autowired
		MemberFamilyRegisterDAO memberFamilyRegisterDAO;
	  	
	  	MixController mixCon;
	  	@PostMapping("/addData")
	    public String addMasterPlan(@RequestParam(value = "image", required = false) MultipartFile[] image, String family_membership_no,String member_family_first_name,String member_family_middle_name,String member_family_last_name,
	    		 int member_family_gender,int member_family_type_of_relation,String member_family_date_of_birth,int member_family_blood_group,String member_family_image,String member_family_email,String  member_family_mobile_no,String  member_family_phone,String member_family_password,
	    		 String member_family_address1,String member_family_address2,String member_family_address3,int member_family_pincode,
	    		 int member_family_coutry_id, int member_family_state_id,
	    		 String member_family_city, String status,
	    		 String createdDate,int member_id1, int valuex, int valuey, int valuew, int valueh,int index,
	    		
	   		String ipAddress, HttpServletRequest request, HttpSession session) throws IOException, WriterException
	 
	    {
			 logger.info("***** Add Master Plan *****");
	        String result = "";
	        int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
	        System.out.println("============================================================="+userid);
	        String ip = request.getHeader("X-FORWARDED-FOR");
	        if (ip == null) {
	            ip = request.getRemoteAddr();
	        }
	        String s = "y";
	        int member_id=memberFamilyRegisterDAO.getMemberLastId();
	        if(member_id1!= 0) {
	        	member_id = member_id1;
	        	
	        }
	        
	    /* 	
	        System.out.println("/////////////////////////////"+valuex);
	        System.out.println("/////////////////////////////"+valuey);
	        System.out.println("/////////////////////////////"+valuew);
	        System.out.println("/////////////////////////////"+valueh);
	      */
	        mixCon = new MixController();
	   
	        MemberFamilyRegister m = new MemberFamilyRegister();
	     	String qrcodeimage = "";
			 String membershipid =  m.setFamily_membership_no(family_membership_no);
			String barcodeImage = "";
			String barcodevalue = membershipid;

		
			  String im = mixCon.uploadImage(image[index], "Profile Picture",valuex, valuey, valuew,valueh, request);
	

	          m.setMemberLastId(member_id);
	          m.setFamily_membership_no(family_membership_no);
			  m.setMember_family_first_name(member_family_first_name);
			  m.setMember_family_last_name(member_family_last_name);
			  m.setMember_family_middle_name(member_family_middle_name);
		
			  m.setMember_family_gender(member_family_gender);
			  m.setMember_family_type_of_relation(member_family_type_of_relation);
			  m.setMember_family_date_of_birth(member_family_date_of_birth);
			  m.setMember_family_blood_group(member_family_blood_group);  
			   m.setMember_family_image(im);
			   m.setMember_family_email(member_family_email);
			   m.setMember_family_mobile_no(member_family_mobile_no);
			   m.setMember_family_phone(member_family_phone);
			   m.setMember_family_password(member_family_password);
			   m.setMember_family_address1(member_family_address1);
			   m.setMember_family_address2(member_family_address2);
			   m.setMember_family_address3(member_family_address3);
		   m.setMember_family_pincode(member_family_pincode);
			   m.setMember_family_coutry_id(member_family_coutry_id);
			   m.setMember_family_state_id(member_family_state_id);
		   m.setMember_family_city(member_family_city);
		   
			
		
		
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
				/*		 barcodeImage = request.getScheme() + "://"
				 +request.getServerName() + ":" + request.getServerPort()
				+"/PresidencyClub/resources/admin/images/barcode/" + membershipid + ".png";
				 */			 
				 
				barcodeImage = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
						+ "presidency/resources/admin/images/barcode/" + membershipid + ".png";
						

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
					+ "presidency/resources/admin/images/qrcode/" + membershipid + ".png";

			/* Generate QRCode End */
		  
			m.setFamily_member_barcode(barcodeImage);
			m.setFamily_member_qrcode(qrcodeimage);
		
	        m.setCreatedBy(userid);
	        m.setIpAddress(ip);
	        m.setStatus(s);
			session.setAttribute("member_id", String.valueOf(member_id));
			
	        result = memberFamilyRegisterDAO.addMemberFamilyRegister(m);
	       
	       
	  
	        return result;
	    }
	  	
	  	
	 @GetMapping(value = "/getMemberFamilyRelation")
	  public List<MemberFamilyRegister> getFamilyRelationship(HttpServletRequest request) {
	      logger.info("***** GETgetAllMemberName*****");
	      return memberFamilyRegisterDAO.getMemberFamilyRelation();
	  }
	 // By MemberID
	 @GetMapping(value = "getMemberFamilyId")
	  public List<MemberFamilyRegister> getAllProductTaxName(int member_id,HttpServletRequest request) {
	      logger.info("***** getAllProductName*****");
	      return memberFamilyRegisterDAO.getFamilyMemberId(member_id);
	  }
	 
		//Family Members By Id
	 @GetMapping(value = "/getMemberFamilyById")
	  public MemberFamilyRegister getMemberFamilyById(int members_family_id, HttpServletRequest request) {
	      logger.info("*****  getMemberFamilyById *****");
	      return memberFamilyRegisterDAO.getFamilyMemberById(members_family_id);
	  }

		@PostMapping(value = "EditFamilyMember")
		public String editBatch(@RequestBody MemberFamilyRegister familymemberdata, HttpSession session,
				HttpServletRequest request, HttpServletResponse response) {
			logger.info("***** EDIT ------------------------------------------------------FamilyRegister *****");
	
			String im =familymemberdata.getMember_family_image();
			System.out.println("---------1"
					+ "---------"+im);
			if(!familymemberdata.getImage().isEmpty() ) {
				System.out.println("---------2---------"+im);
			mixCon = new MixController();		
			byte[] ii = mixCon.getImageByte(familymemberdata.getImage());
			im = mixCon.uploadImage(ii, familymemberdata.getFamily_membership_no(), "Profile Picture",familymemberdata.getValuex(), familymemberdata.getValuey(), familymemberdata.getValuew(),familymemberdata.getValueh(), request);
	}
			System.out.println("---------3---------"+im);
			familymemberdata.setMember_family_image(im);
			String result = "";

			int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
			String ipaddress = request.getHeader("X-FORWARDED-FOR");

			if (ipaddress == null) {
				ipaddress = request.getRemoteAddr();
			}
			String s = "y";		
			familymemberdata.setCreatedBy(id);
			familymemberdata.setIpAddress(ipaddress);
			familymemberdata.setStatus(s);

			result = memberFamilyRegisterDAO.EditUser(familymemberdata);

			return result;
		}
		
		 @DeleteMapping(value = "deleteFamilyMember")
		  public void delete(int members_family_id) {
		      logger.info("***** deleteFamilyMember*****");
		      memberFamilyRegisterDAO.deleteMemberFamily(members_family_id);
		  }
		 
		 @PostMapping("/addData1")
		    public String addMasterPlan1(@RequestParam(value = "image", required = false) MultipartFile image, String family_membership_no,String member_family_first_name,String member_family_middle_name,String member_family_last_name,
		    		 int member_family_gender,int member_family_type_of_relation,String member_family_date_of_birth,int member_family_blood_group,String member_family_image,String member_family_email,String  member_family_mobile_no,String  member_family_phone,String member_family_password,
		    		 String member_family_address1,String member_family_address2,String member_family_address3,int member_family_pincode,
		    		 int member_family_coutry_id, int member_family_state_id,
		    		 String member_family_city, String status,
		    		 String createdDate,int member_id1, int valuex, int valuey, int valuew, int valueh,
		    		
		   		String ipAddress, HttpServletRequest request, HttpSession session) throws IOException, WriterException
		 
		    {
				 logger.info("***** Add Master Plan *****");
		        String result = "";
		        int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
		        System.out.println("============================================================="+userid);
		        String ip = request.getHeader("X-FORWARDED-FOR");
		        if (ip == null) {
		            ip = request.getRemoteAddr();
		        }
		        String s = "y";
		        int member_id=memberFamilyRegisterDAO.getMemberLastId();
		        if(member_id1!= 0) {
		        	member_id = member_id1;
		        	
		        }
		        
		     	
		    /*    System.out.println("/////////////////////////////"+valuex);
		        System.out.println("/////////////////////////////"+valuey);
		        System.out.println("/////////////////////////////"+valuew);
		        System.out.println("/////////////////////////////"+valueh);
		     */ 
		        mixCon = new MixController();
		   
		        MemberFamilyRegister m = new MemberFamilyRegister();
		     	String qrcodeimage = "";
				 String membershipid =  m.setFamily_membership_no(family_membership_no);
				String barcodeImage = "";
				String barcodevalue = membershipid;

			System.out.println("=============================================================" +image);

				String im = mixCon.uploadImage(image, "Profile Picture",valuex, valuey, valuew,valueh, request);
			System.out.println("=============================================================" + im);

		          m.setMemberLastId(member_id);
		          m.setFamily_membership_no(family_membership_no);
				  m.setMember_family_first_name(member_family_first_name);
				  m.setMember_family_last_name(member_family_last_name);
				  m.setMember_family_middle_name(member_family_middle_name);
			
				  m.setMember_family_gender(member_family_gender);
				  m.setMember_family_type_of_relation(member_family_type_of_relation);
				  m.setMember_family_date_of_birth(member_family_date_of_birth);
				  m.setMember_family_blood_group(member_family_blood_group);  
				   m.setMember_family_image(im);
				   m.setMember_family_email(member_family_email);
				   m.setMember_family_mobile_no(member_family_mobile_no);
				   m.setMember_family_phone(member_family_phone);
				   m.setMember_family_password(member_family_password);
				   m.setMember_family_address1(member_family_address1);
				   m.setMember_family_address2(member_family_address2);
				   m.setMember_family_address3(member_family_address3);
			   m.setMember_family_pincode(member_family_pincode);
				   m.setMember_family_coutry_id(member_family_coutry_id);
				   m.setMember_family_state_id(member_family_state_id);
			   m.setMember_family_city(member_family_city);
			   
				
			
			
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
					/*		 barcodeImage = request.getScheme() + "://"
					 +request.getServerName() + ":" + request.getServerPort()
					+"/PresidencyClub/resources/admin/images/barcode/" + membershipid + ".png";
					 */			 
					 
					barcodeImage = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
							+ "presidency/resources/admin/images/barcode/" + membershipid + ".png";
							

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
						+ "presidency/resources/admin/images/qrcode/" + membershipid + ".png";

				/* Generate QRCode End */
			  
				m.setFamily_member_barcode(barcodeImage);
				m.setFamily_member_qrcode(qrcodeimage);
			
		        m.setCreatedBy(userid);
		        m.setIpAddress(ip);
		        m.setStatus(s);
				session.setAttribute("member_id", String.valueOf(member_id));
				
		        result = memberFamilyRegisterDAO.addMemberFamilyRegister(m);
		       
		       
		  
		        return result;
		    }  
		
}
