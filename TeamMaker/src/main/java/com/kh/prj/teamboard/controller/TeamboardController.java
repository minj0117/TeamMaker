package com.kh.prj.teamboard.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.prj.paging.PageMaker;
import com.kh.prj.paging.PagingCriteria;
import com.kh.prj.teamboard.svc.TeamboardSVC;
import com.kh.prj.teamboard.vo.FileVO;
import com.kh.prj.teamboard.vo.TeamboardVO;

@Controller
@RequestMapping("/tboard/*")
public class TeamboardController {
	private Logger logger = LoggerFactory.getLogger(TeamboardController.class);
	@Inject
	TeamboardSVC teamboardSVC;
	
	/**
	 * 글 리스트
	 * @param tno
	 * @param model
	 * @param cri
	 * @return
	 */
	@GetMapping("/boardList")
	public String boardList(@RequestParam("tno") int tno,Model model,  PagingCriteria cri){
		cri.setTno(tno);
		model.addAttribute("tno", tno);
		return "team/teamboard";
	}
	@GetMapping("/talkList")
	public String talkList(@RequestParam("tno") int tno, Model model, PagingCriteria cri) {
		cri.setTno(tno);
		int total = teamboardSVC.totalCntboard(tno);
		List<TeamboardVO> list = teamboardSVC.boardList(cri);
		model.addAttribute("paging",new PageMaker(cri,total));
		model.addAttribute("list", list);
		model.addAttribute("tno", tno);
		return "team/teamboardList";
	}
	
	@GetMapping("/fileList")
	public String fileList(@RequestParam("tno") int tno,Model model,  PagingCriteria cri){
		cri.setTno(tno);
		int total = teamboardSVC.totalCnt(tno); //첨부파일 토탈
		List<FileVO> flist = teamboardSVC.fileList(cri);
		model.addAttribute("paging",new PageMaker(cri,total));
		model.addAttribute("flist",flist);
		model.addAttribute("tno", tno);
		return "team/teamfileList";
	}
	
	/**
	 * 글 상세보기
	 * @param bno
	 * @param model
	 * @return
	 */
	@GetMapping("/boardView/{bno}")
	public String boardView(@RequestParam("bno") int bno,Model model) {
		System.out.println(bno);
		TeamboardVO vo = teamboardSVC.boardView(bno);
		model.addAttribute("vo",vo);
		return "team/rview";
	}
	/**
	 * 글쓰기폼
	 * @param tno
	 * @param model
	 * @return
	 */
	@GetMapping("/boardForm")
	public String boardForm(@RequestParam("tno") int tno, Model model) {
		model.addAttribute("tno",tno);
		return "team/teamboardForm";
	}
	/**
	 * 글쓰기
	 * @param info
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/boardWrite", method = RequestMethod.POST, produces = "application/json")
	public int boardWrite(@RequestBody HashMap<String, String> info) throws Exception {
		TeamboardVO vo = new TeamboardVO();
		vo.setTitle(info.get("title"));
		vo.setB_comment(info.get("b_comment"));
		vo.setWriter(info.get("writer"));
		vo.setTno(Integer.parseInt(info.get("tno")));
		return teamboardSVC.boardWrite(vo);
	}
	
	/**
	 * 글 삭제
	 * @param info
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/boardDelete", method = RequestMethod.DELETE, produces = "application/json")
	public int boardDelete(@RequestBody HashMap<String, String> info) throws Exception {
		int bno = Integer.parseInt(info.get("bno"));
		return teamboardSVC.boardDelete(bno);
	}
	
	/**
	 * 글 수정 폼
	 * @param bno
	 * @param model
	 * @param vo
	 * @return
	 */
	@GetMapping("/boardModForm")
	public String boardModForm(@RequestParam("bno") int bno,Model model,TeamboardVO vo) {
		vo = teamboardSVC.boardView(bno);
		model.addAttribute("vo",vo);
		return "team/teamboardModForm";
	}
	
	/**
	 * 글 수정 처리
	 * @param info
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/boardMod", method = RequestMethod.PUT, produces = "application/json")
	public int boardMod(@RequestBody HashMap<String, String> info, TeamboardVO vo) throws Exception {
		vo.setTitle(info.get("title"));
		vo.setB_comment(info.get("b_comment"));
		vo.setBno(Integer.parseInt(info.get("bno")));
		return teamboardSVC.boardMod(vo);
	}
	/**
	 * 댓글 폼
	 * @param tno
	 * @param bno
	 * @param model
	 * @return
	 */
	@GetMapping("/boardReplyForm")
	public String boardReplyForm(@RequestParam("tno") int tno, @RequestParam("bno") int bno, Model model) {
		model.addAttribute("tno", tno);
		model.addAttribute("bno", bno);
		return "team/teamboardReplyForm";
	}
	/**
	 * 댓글 처리
	 * @param info
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/boardReply", method = RequestMethod.POST, produces = "application/json")
	public int boardReply(@RequestBody HashMap<String, String> info, TeamboardVO vo) {
		vo.setTitle(info.get("title"));
		vo.setB_comment(info.get("b_comment"));
		vo.setWriter(info.get("writer"));
		vo.setTno(Integer.parseInt(info.get("tno")));
		vo.setBno(Integer.parseInt(info.get("bno")));
		return teamboardSVC.boardReply(vo);
	}
	/**
	 * 첨부파일 폼
	 * @param tno
	 * @param model
	 * @return
	 */
	@GetMapping("/fileuploadForm")
	public String fileuploadForm(@RequestParam("tno") int tno, Model model) {
		model.addAttribute("tno",tno);
		return "team/fileuploadForm";
	}
	/**
	 * 첨부파일 업로드
	 * @param fvo
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/fileupload")
	public String fileupload(FileVO fvo) throws Exception {
		String fileName = null;
		MultipartFile uploadFile = fvo.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName=uuid+"."+ext;
			uploadFile.transferTo(new File("D:\\file\\" + fileName));
		}
		fvo.setFileName(fileName);
		teamboardSVC.fileupload(fvo);
		return "redirect:boardList?tno="+fvo.getTno();
	}
	/**
	 * 첨부파일 게시글 보기
	 * @param bno
	 * @param model
	 * @return
	 */
	@GetMapping("/fileView")
	public String fileView(@RequestParam("bno") int bno, Model model) {
		System.out.println(bno);
		FileVO fvo = teamboardSVC.fileView(bno);
		model.addAttribute("fvo",fvo);
		return "team/fileView";
	}
	/**
	 * 파일 수정 폼
	 * @param bno
	 * @param model
	 * @return
	 */
	@GetMapping("/fileModForm")
	public String fileModForm(@RequestParam("bno") int bno, Model model) {
		FileVO fvo = teamboardSVC.fileView(bno);
		model.addAttribute("fvo",fvo);
		return "team/fileModForm";
	}
	/**
	 * 파일 수정 처리
	 * @param fvo
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/fileMod")
	public String fileMod(FileVO fvo) throws Exception {
		String fileName = null;
		MultipartFile uploadFile = fvo.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName=uuid+"."+ext;
			uploadFile.transferTo(new File("D:\\file\\" + fileName));
		}
		fvo.setFileName(fileName);
		teamboardSVC.fileMod(fvo);
		return "redirect:boardList?tno="+fvo.getTno();
	}
	
	@ResponseBody
	@RequestMapping(value="/fileDelete", method=RequestMethod.DELETE, produces="application/json")
	public int fileDelete(@RequestBody HashMap<String, String> info) {
		int bno = Integer.parseInt(info.get("bno"));
		System.out.println(bno);
		return teamboardSVC.fileDelete(bno);
	}
	
}
