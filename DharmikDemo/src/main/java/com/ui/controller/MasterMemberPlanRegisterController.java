package com.ui.controller;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.EnumMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

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

import com.google.zxing.WriterException;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;

import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.ui.dao.MasterMemberPlanDAO;
import com.ui.dao.MasterMemberRegisterDAO;
import com.ui.dao.MemberFamilyRegisterDAO;
import com.ui.dao.MemberPaymentDAO;
import com.ui.model.MasterMemberPlan;
import com.ui.model.MasterMemberRegister;

@RestController
public class MasterMemberPlanRegisterController {

	@Autowired
	MasterMemberRegisterDAO masterMemberRegisterDAO;

	@Autowired
	MasterMemberPlanDAO masterMemberPlanDAO;

	@Autowired
	MemberFamilyRegisterDAO memberFamilyRegisterDAO;
	
	@Autowired
	MemberPaymentDAO memberPaymentDAO;
	
	MixController mixCon;

	private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanRegisterController.class);

	@PostMapping("addMasterMemberRegister")
	public int addMasterPlan(@RequestBody MasterMemberRegister masterMemberRegister, HttpServletRequest request,
			HttpSession session) throws IOException, WriterException

	{
		logger.info("***** Add Master Member Register  *****");
		
	
		
		mixCon = new MixController();
		
		byte[] ii = mixCon.getImageByte(masterMemberRegister.getImage());
		String im = mixCon.uploadImage(ii, masterMemberRegister.getMembership_number(), "Profile Picture",masterMemberRegister.getValuex(), masterMemberRegister.getValuey(), masterMemberRegister.getValuew(),masterMemberRegister.getValueh(), request);
		
		masterMemberRegister.setMember_image(im);
		String result = "";
		int userid = Integer.parseInt(session.getAttribute("adminuserid").toString());
		System.out.println("=============================================================" + userid);
		String ip = request.getHeader("X-FORWARDED-FOR");
		if (ip == null) {
			ip = request.getRemoteAddr();
		}

		String s = "y";
		
		
		
		
		String qrcodeimage = "";
		 String membershipid = masterMemberRegister.getMembership_number();
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
					+ "/presidency/resources/admin/images/barcode/" + membershipid + ".png";
					

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
				+ "/presidency/resources/admin/images/qrcode/" + membershipid + ".png";

		/* Generate QRCode End */
	  
		 
		  masterMemberRegister.setMembership_barcode(barcodeImage);
		  masterMemberRegister.setMembership_qrcode(qrcodeimage);
		 
		masterMemberRegister.setCreatedBy(userid);
		masterMemberRegister.setIpAddress(ip);
		masterMemberRegister.setStatus(s);
		
		int id = 0;
		result = masterMemberRegisterDAO.addMasterMemberRegister(masterMemberRegister);
		
		System.out.println(result);
		if (result.equals("Success")) {

			logger.info("***** Last Member Id Id Got it *****");

			id = memberFamilyRegisterDAO.getMemberLastId();

		}

		return id;
	}

	@GetMapping(value = "/getMasterMemberPlanType")
	public MasterMemberRegister getMasterMemberTypeById(int plan_id, HttpServletRequest request) {
		logger.info("*****GeT getAllMemberTYpe *****");
		return masterMemberRegisterDAO.getMemberPlanSequence(plan_id);
	}

	@GetMapping(value = "/getAllRegisterMemberName")
	public List<MasterMemberRegister> getAllRegisterMemberName(HttpServletRequest request) {
		logger.info("***** GETgetAllMemberName*****");
		return masterMemberRegisterDAO.getAllMemberRegisterName();
	}

	@GetMapping(value = "/getRegisterMemberById")
	public MasterMemberRegister getMemberById(int member_id, HttpServletRequest request) {
		logger.info("***** getMemberById*****");
		return masterMemberRegisterDAO.getRegisterMemberById(member_id);
	}

	@PostMapping(value = "editMasterMemberRegister")
	public String editBatch(@RequestBody MasterMemberRegister masterMemberRegister, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) {
		logger.info("***** EDIT ------------------------------------------------------MasterMemberRegister *****");
		
		
		String im=masterMemberRegister.getMember_image();
		System.out.println("-------1-----------"+im);
			if(!masterMemberRegister.getImage().isEmpty() ) {
		mixCon = new MixController();
		
		byte[] ii = mixCon.getImageByte(masterMemberRegister.getImage());
		System.out.println("------2------------"+im);
		im = mixCon.uploadImage(ii, masterMemberRegister.getMembership_number(), "Profile Picture",masterMemberRegister.getValuex(), masterMemberRegister.getValuey(), masterMemberRegister.getValuew(),masterMemberRegister.getValueh(), request);
		
		
		
		
		}
System.out.println("---------3---------"+im);
		masterMemberRegister.setMember_image(im);
		
		
		
		
		String result = "";
	

		int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
		String ipaddress = request.getHeader("X-FORWARDED-FOR");

		if (ipaddress == null) {
			ipaddress = request.getRemoteAddr();
		}
		String s = "y";
		
		
		masterMemberRegister.setCreatedBy(id);
		masterMemberRegister.setIpAddress(ipaddress);
		masterMemberRegister.setStatus(s);

		result = masterMemberRegisterDAO.editRegisterMember(masterMemberRegister);

		return result;
	}

	@DeleteMapping(value = "deleteMasterMemberRegister")
	public void delete(int member_id) {
		logger.info("***** DELETE masterMemberRegister *****");
		masterMemberRegisterDAO.deleteRegisterMember(member_id);
	}
	
	@GetMapping(value = "getRegisterMemberId")
	public MasterMemberRegister getMember(int member_id, HttpServletRequest request) {
		logger.info("***** getMemberId*****");
		return masterMemberRegisterDAO.getRegisterMember(member_id);
	}

	 @GetMapping(value = "/getMemberByPage")
	  public List<MasterMemberRegister> getRegisterMemberByPage(int pagesize, int startindex, HttpServletRequest request) {
	      logger.info("***** GET getMasterMemberByPage *****");
	      return masterMemberRegisterDAO.getRegisterMemberByPage(pagesize, startindex);
	  }
	 
	 @GetMapping(value = "/getRegisterMemberAmount")
		public MasterMemberRegister getRegisterMemberAmount(int member_id, HttpServletRequest request) {
			logger.info("***** getMemberById*****");
			return masterMemberRegisterDAO.getRegisterMemberAmount(member_id);
		}
	
	
}