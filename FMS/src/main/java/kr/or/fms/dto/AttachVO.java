package kr.or.fms.dto;
									/* 통합첨부파일 */
import java.util.Date;

public class AttachVO {

	private int attach_no;			//첨부파일일련번호(복합키), 저장순번 // 고유번호 ano
	private String file_location;	//파일경로
	private String file_name;		//파일명(uuid)
	private String file_type;		//파일타입
	private String file_no; 		//게시글번호 pno
	private String file_register;	//파일등록자
	private Date file_date;			//파일등록일자

	
//	private int file_no;			//파일번호(복합키)
	private String file_save_name;	//저장된파일명
	private int file_size;			//파일사이즈

	


	public int getAttach_no() {
		return attach_no;
	}
	public void setAttach_no(int attach_no) {
		this.attach_no = attach_no;
	}

	public String getFile_no() {
		return file_no;
	}
	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_save_name() {
		return file_save_name;
	}
	public void setFile_save_name(String file_save_name) {
		this.file_save_name = file_save_name;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public String getFile_location() {
		return file_location;
	}
	public void setFile_location(String file_location) {
		this.file_location = file_location;
	}
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}
	public Date getFile_date() {
		return file_date;
	}
	public void setFile_date(Date file_date) {
		this.file_date = file_date;
	}
	public String getFile_register() {
		return file_register;
	}
	public void setFile_register(String file_register) {
		this.file_register = file_register;
	}
	
	
	
	
}
