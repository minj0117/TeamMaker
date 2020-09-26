package com.kh.prj;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.prj.recruit.svc.RecruitSVC;
import com.kh.prj.recruit.vo.RecruitVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	RecruitSVC recruitSVC;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, RecruitVO vo) {
		logger.info("Welcome home! The client locale is {}.", locale);
		List<RecruitVO> list = recruitSVC.rank();
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		model.addAttribute("rank",list);
		model.addAttribute("serverTime", formattedDate );
		StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();  
        encryptor.setAlgorithm("PBEWITHMD5ANDDES");  
        encryptor.setPassword("dksaudtjd");  
        String encryptedPass = encryptor.encrypt("admin1234");
        String decryptedPass = encryptor.decrypt(encryptedPass);
        System.out.println("Encrypted Password for admin is : "+encryptedPass);  
        System.out.println("Decrypted Password for admin is : "+decryptedPass);  

		return "home";
	}
	
}
