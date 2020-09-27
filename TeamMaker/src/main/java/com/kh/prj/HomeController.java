package com.kh.prj;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.prj.dae.svc.DaeSVC;
import com.kh.prj.dae.vo.DaeVO;
import com.kh.prj.gong.svc.GongSVC;
import com.kh.prj.gong.vo.GongVO;
import com.kh.prj.recruit.svc.RecruitSVC;
import com.kh.prj.recruit.vo.RecruitVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	RecruitSVC recruitSVC;
	@Inject
	DaeSVC daeSVC;
	@Inject
	GongSVC gongSVC;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, RecruitVO vo, DaeVO daevo, GongVO gongvo) {
		logger.info("Welcome home! The client locale is {}.", locale);
		List<RecruitVO> list = recruitSVC.rank();
		List<DaeVO> listdae = daeSVC.rank();
		List<GongVO> listgong = gongSVC.rank();
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		model.addAttribute("rank",list);
		model.addAttribute("rankdae", listdae);
		model.addAttribute("rankgong", listgong);
		model.addAttribute("serverTime", formattedDate );


		return "home";
	}
	
}
