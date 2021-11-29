package kr.or.fms.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.fms.dto.AttachVO;

public interface AttachDAO {
	
	public List<AttachVO> selectAttachesByReturn_code(String return_code)throws SQLException;
	public List<AttachVO> selectAttachesByFran_applidoc_code(String fran_applidoc_code)throws SQLException;
	
	public List<AttachVO> selectAttachByAttach_no(String attach_no)throws SQLException;
	
	public void insertAttach(AttachVO attach) throws SQLException;

	public void deleteAttach(String attach_no) throws SQLException;
	
	public void deleteAttachModi(String attach_no) throws SQLException;

	public void deleteAllAttach(String return_code)throws SQLException;

	public AttachVO selectAttachDownload(String attach_no)throws SQLException;
	
	public AttachVO selectAttachByAno(String attach_no)throws SQLException;
}
