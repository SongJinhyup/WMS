package kr.or.fms.hq.controller;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.fms.command.FranNoticeRegistCommand;
import kr.or.fms.command.SearchCriteria;
import kr.or.fms.dto.AttachVO;
import kr.or.fms.fran.dto.FranNoticeVO;
import kr.or.fms.hq.dto.FranAppliDetailVO;
import kr.or.fms.hq.dto.FranAppliVO;
import kr.or.fms.hq.dto.HqEmpVO;
import kr.or.fms.hq.service.AppliService;

@Controller
@RequestMapping("/hq")
public class AppliController {

	@Autowired
	AppliService appliService;
	
	@Resource(name="fileUploadPath")
	private String fileUploadPath;
	
	@RequestMapping("/com/regist")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv)throws SQLException{
		String url="hq/franappli/list";		
		cri.setPerPageNum(17);
		Map<String,Object> dataMap = appliService.getAppliList(cri);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/com/detail")
	public ModelAndView detail(String fran_applidoc_code, ModelAndView mnv) throws SQLException{
		String url="hq/franappli/detail";
		FranAppliDetailVO detail = appliService.read(fran_applidoc_code);
		detail.setFran_tel(detail.getFran_tel().replace(",", "-"));
		
		FranAppliDetailVO franAppliDetailVO = new FranAppliDetailVO();
		franAppliDetailVO = appliService.read(fran_applidoc_code);
		System.out.println("dddddddddddddddddddddd" + franAppliDetailVO.getFran_code());
		List<AttachVO> attachList = appliService.getAttachByAttach_no(franAppliDetailVO.getFran_code());
		if (franAppliDetailVO != null && attachList != null) {
			franAppliDetailVO.setAttachList(attachList);
		}

		mnv.addObject("detail", detail);
		mnv.addObject("attachList", attachList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "updateAppliCheckSt.do", method = RequestMethod.POST)
	public String updateFranSt(String fran_applidoc_code, String franRegSt, String fran_applidoc_appr_st,  String fran_code, String fran_addr, HttpSession session) throws SQLException {
		
		String url = "hq/franappli/success";

		FranAppliVO franAppli = new FranAppliVO();
		
		franAppli.setFran_reg_st(franRegSt);
		franAppli.setFran_applidoc_code(fran_applidoc_code);
		franAppli.setFran_applidoc_appr_st(fran_applidoc_appr_st);
		
		HqEmpVO hqEmp = (HqEmpVO) session.getAttribute("loginEmp");
		String emp_no = hqEmp.getEmp_no();
		String emp_name = hqEmp.getEmp_name();
		
		FranNoticeVO franNotice = new FranNoticeVO();
		franNotice.setEmp_no(emp_no);
		franNotice.setEmp_name(emp_name);
		franNotice.setFran_code(fran_code);
		franNotice.setFran_applidoc_code(fran_applidoc_code);

		appliService.modify(franAppli);
		appliService.modifyAppr(franAppli);
		appliService.regist(franNotice);
		
		return url;
	}
	
	@RequestMapping("/com/getFile.do")
	public String getFile(String attach_no, Model model) throws Exception {
		
		String url = "downloadFile";
		
		AttachVO attach = appliService.selectAttachDownload(attach_no);
		
		model.addAttribute("savedPath", attach.getFile_location());
		model.addAttribute("fileName", attach.getFile_name());
		
		return url;
		
	}
	
	
}
