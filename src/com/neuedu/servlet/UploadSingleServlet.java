package com.neuedu.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartFile;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.neuedu.util.StringUtil;

public class UploadSingleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//���������������
		response.setContentType("text/html;charset=utf-8");	

		//��ȡout�������---��Ҫ�������ʱ�Ӵ˾�
		PrintWriter out = response.getWriter();	   	
		
		try {
			
			//����1---�����ϴ����---ʵ����SmartUpload����
		    SmartUpload smartUpload = new SmartUpload("utf-8");
		
		    //����2---��ʼ���ϴ����---����initialize()����
		    smartUpload.initialize(getServletConfig(), request, response);
		    
		    //���2---�ļ���С
		    smartUpload.setMaxFileSize(100*1024);
		    
		    //���3---�ļ�����
		    //smartUpload.setAllowedFilesList("jpg,txt,xls");
		    smartUpload.setDeniedFilesList("jpg,txt,xls");
		    
		    //����3---�ϴ��ļ�������������ʱ�ڴ���---����upload()����
			smartUpload.upload();
		
			//��ȡ���ļ�����
			String username = smartUpload.getRequest().getParameter("username");
			System.out.println("username=" + username);
			
			//����4---��ȡ�ϴ��ļ�
		    SmartFile smartFile = smartUpload.getFiles().getFile(0);  
		
		    //���1---�ļ��ǿ�
		    if(smartFile.isMissing()){
		    	out.println("<script>alert('server:����ѡ���ļ�');history.back()</script>");
		    	return;
		    }
		    
		    //����5---׼���ϴ��ļ��Ĵ洢·�����ļ���---��֤�ļ���Ψһ
		    String serverFilePath = "e:/upload";
		    
		    //�Զ�����Ŀ¼
		    File dir = new File(serverFilePath);
		    if(!dir.exists()){
		    	dir.mkdirs();
		    }
		    
		    //�����µ��ļ���
		    String serverFilename = StringUtil.convertFilename(smartFile.getFileName());   //ԭʼ�ļ���
		 
		    //����6---�����ϴ��ļ�
			smartFile.saveAs(serverFilePath + "/" + serverFilename);
			
			out.println("<script>alert('�ļ��ϴ��ɹ�');location='upload_single.jsp'</script>");
			
		} catch (SmartUploadException e) {
			e.printStackTrace();
			out.println("<script>alert('�ļ��ϴ�ʧ��');location='upload_single.jsp'</script>");
		} catch (SecurityException e) {
			e.printStackTrace();
			//out.println("<script>alert('�ļ���С���ܳ���100k,�ļ����ͱ�����jpg,txt,xls');location='upload_single.jsp'</script>");
			out.println("<script>alert('�ļ����Ͳ�����jpg,txt,xls');location='upload_single.jsp'</script>");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
