<%@page import="member.userinfo"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="Services.RegisterInsertService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int resultCnt = 0;
	RegisterInsertService register = RegisterInsertService.getInstance();
	
	userinfo Userinfo=new userinfo();
	
	String imgname = "";

	//1.multipart/form-data 여부 확인    	
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (isMultipart) {
		// 2. 메모리나 파일로 업로드 파일 보관하는 FileItem의 Factory 설정
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 3. 업로드 요청을 처리하는 ServletFileUpload 생성
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 4. 업로드 요청 파싱해서 FileItem 목록 구함
		List<FileItem> items = upload.parseRequest(request);
		Iterator<FileItem> iter = items.iterator();

		while (iter.hasNext()) {
			FileItem item = iter.next();

			// 5. FileItem이 폼 입력 항목인지 여부에 따라 알맞은 처리
			//file인지 여부 확인
			if (item.isFormField()) { // 텍스트 입력인 경우
				String name = item.getFieldName();
				String value = item.getString("UTF-8");
				System.out.println("일반 폼 필드  : " + name + "-" + value);

				switch (name) {
				case "id":
					Userinfo.setId(value);
					break;
				case "pw":
					Userinfo.setPw(value);
					break;
				case "name":
					Userinfo.setName(value);
					break;
				case "year":
					Userinfo.setYear(value);
					break;
				case "month":
					Userinfo.setMonth(value);
					break;
				case "day":
					Userinfo.setDay(value);
					break;
				case "gender":
					Userinfo.setGender(value);
					break;
				case "email":
					Userinfo.setEmail(value);
					break;
				case "phone":
					Userinfo.setPhone(value);
					break;
				}

			} else { // 파일 업로드인 경우
				String name = item.getFieldName();
				String fileName = item.getName();
				String contentType = item.getContentType();
				boolean isInMemory = item.isInMemory();
				long sizeInBytes = item.getSize();

				//저장하고자 하는 파일의 이름 = 다른 파일들과 식별되도록 하는게 중요
				imgname = "cool_" + fileName;

				//웹서비스에서 사용되는 저장 경로
				String uploadUri = "/file/imgs";

				//물리적인 경로
				String dir = request.getSession().getServletContext().getRealPath(uploadUri);
				System.out.println(uploadUri + "의 물리적 경로  : " + dir);

				item.write(new File(dir, imgname));
				Userinfo.setImgname(imgname);
				
			}
		}
	}
	
	resultCnt=register.register(Userinfo);
%>

<%
	/*
	// Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	
	String jdbcDriver="jdbc:apache:commons:dbcp:pool1";
	//String jdbcDriver="jdbc:oracle:thin:@localhost:1521:xe";
	//String dbUser="student";
	//String dbPass="1234"; 
	String birth=userinfo.getYear()+"-"+userinfo.getMonth()+"-"+userinfo.getDay();
	String phone=request.getParameter("loc")+Integer.toString(userinfo.getPhone());
	String sql="insert into userinfo values(?,?,?,?,?,?,?)";
	
	
	try{
		conn=DriverManager.getConnection(jdbcDriver);	
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1,userinfo.getId());
		pstmt.setString(2,userinfo.getPw());
		pstmt.setString(3,userinfo.getName());
		pstmt.setString(4,birth);
		pstmt.setString(5, userinfo.getGender());
		pstmt.setString(6,phone);
		pstmt.setString(7,userinfo.getEmail());
		
		pstmt.executeUpdate();
	}catch(SQLException ex){
		out.println(ex.getMessage());
		ex.printStackTrace();
	}finally{
		if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		if(conn!=null) try{conn.close();}catch(SQLException ex){}
	}
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>

	<h1>회원가입이 완료되었습니다.</h1>
	<a href="/index.jsp">로그인 하러 가기</a>


</body>
</html>