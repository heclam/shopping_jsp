package com.luo.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
  
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
  
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
 
 
 
 
/**
 * Servlet implementation class UpLoadExcelServlet
 */
 
public class UpLoadExcelServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
        
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpLoadExcelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
 
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>\n");
        out.println("<head><title>PageTitle</title></head>");
        out.println("<body>");
        out.println("<p>�ļ��Ѿ��ϴ��ɹ�</p>");
        out.println("</body>");
    }
 
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
        System.out.println("doPost");
         
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
          
        if (isMultipart) {
            System.out.println("True");
             
            // ���������������õ��ǹ���ģʽ��
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //��ȡ��������嵥����װ˵���飨��ServletContext�еõ��ϴ��������ݣ�
            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            //�����ѽ�Ҫ��װ�������Ĳ���¼�빤���Լ���ϵͳ����ΪҪ������Щ��������һ�������ߣ��ϴ������ļ��ĸ������ԣ�
            factory.setRepository(repository);
            //��ʱ�������Ѿ�������������װ���ա���ɫ�����Բ������ϴ������ļ��Ĵ�С���ļ����ȣ�
            //ִ���������һ�д�����ζ�Ÿ�����װ���յȿ�����һ����װ������
            ServletFileUpload upload = new ServletFileUpload(factory);
  
            //��������
            try {
                //������͸������ߣ������ľ���һ����װ�õ���������requestת��FileItem��ʵ����
                List<FileItem> items = upload.parseRequest(request);
                Iterator<FileItem> iter = items.iterator();
                while (iter.hasNext()) {
                    FileItem item = iter.next();
                    //�����ļ������
                    File file=new File("D:\\b.xlsx");
                    if(!file.exists())
                    {
                        try {   
                            file.createNewFile();   
                        } catch (IOException e) {   
                            e.printStackTrace();   
                        }   
                    }
                    FileOutputStream fos=new FileOutputStream(file);                 
                    //����������
                    InputStream fis=(InputStream) item.getInputStream();
                    //����������ȡ�ֽ�����
                    byte b[]=new byte[1];
                    //��ȡһ�����������ֽڵ�b[0]��
                    int read=fis.read(b);
                    while(read!=-1) 
                    { 
                        fos.write(b,0,1); 
                        read=fis.read(b); 
                    } 
                    fis.close();
                    fos.flush();
                    fos.close();
                    //��ӡList�е����ݣ�ÿһ��FileItem��ʵ������һ���ļ���ִ�����д�����ӡ���ļ���һЩ�������ԣ��ļ�������С�ȣ�
                    System.out.println(item);  
                }
                System.out.println("ѭ��������");
            } catch (FileUploadException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        else {
        System.out.println("False");
        }  
    }
}
