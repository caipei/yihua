package com.doing.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang3.StringUtils;

import com.doing.admin.bean.StatusBean;
import com.doing.admin.interceptor.LoginInterceptor;
import com.doing.admin.interceptor.LoginJsonInterceptor;
import com.doing.common.utils.Utils;
import com.doing.common.utils.base.GsonUtils;
import com.doing.common.utils.base.ReadExcel;
import com.doing.dataservice.controller.BaseController;
import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

@Before(LoginInterceptor.class)
public class OwnerController extends BaseController {
	private File excelFile;//File对象，目的是获取页面上传的文件
	 public File getExcelFile() {
	    return excelFile;
	}
	public void setExcelFile(File excelFile) {
	    this.excelFile = excelFile;
	}
	public void index() {

		String propertyid = Utils.getStrVal(getSessionAttr("propertyid"));
		
		String villageid = StringUtils.defaultString(getPara("villageid"));
		
		String sql = "";
		
		if(StringUtils.isNotBlank(villageid)){
			sql += " and t.villageid = "+villageid;
		}
		
		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);

		Page<Record> page = Db
				.paginate(pageCurrent, PageSize_Default, "select t.*, s.villagename ",
						" from t_owner t, t_village s  where t.rstate = 0  and t.villageid = s.id and s.propertyid = '"+propertyid+"' "+ sql +" order by t.id desc");

		List<Record> list = Db
				.find("select * from t_village where rstate = 0 and propertyid = '"+propertyid+"' order by id desc");

		setAttr("villagelist", list);
		
		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());

		setAttr("pageitem", PageSize_Default);

		setAttr("ownerlist", page.getList());

		render("/html/owner/list.jsp");
	}
	public void importExcel(){
		String villageid = StringUtils.defaultString(getPara("villageid"));
		
		setAttr("villageid", villageid);
		
		render("/html/owner/upload.jsp");
	}
	public void importSubmit()
            throws ServletException, IOException {
	HttpServletRequest request = getRequest();
	HttpServletResponse response = getResponse();
		System.out.println("coming.......");
		String villageid = StringUtils.defaultString(getPara("villageid"));
        //得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
        String savePath = request.getRealPath("/WEB-INF/upload");
        //上传时生成的临时文件保存目录
        String tempPath = request.getRealPath("/WEB-INF/temp");
        File tmpFile = new File(tempPath);
        if (!tmpFile.exists()) {
            //创建临时目录
            tmpFile.mkdir();
        }
        
        //消息提示
        String message = "";
        try{
            //使用Apache文件上传组件处理文件上传步骤：
            //1、创建一个DiskFileItemFactory工厂
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //设置工厂的缓冲区的大小，当上传的文件大小超过缓冲区的大小时，就会生成一个临时文件存放到指定的临时目录当中。
            factory.setSizeThreshold(1024*100);//设置缓冲区的大小为100KB，如果不指定，那么缓冲区的大小默认是10KB
            //设置上传时生成的临时文件的保存目录
            factory.setRepository(tmpFile);
            //2、创建一个文件上传解析器
            ServletFileUpload upload = new ServletFileUpload(factory);
            //监听文件上传进度
            /*upload.setProgressListener(new ProgressListener(){
                public void update(long pBytesRead, long pContentLength, int arg2) {
                    System.out.println("文件大小为：" + pContentLength + ",当前已处理：" + pBytesRead);
                    
                }
            });*/
             //解决上传文件名的中文乱码
            upload.setHeaderEncoding("UTF-8"); 
            //3、判断提交上来的数据是否是上传表单的数据
            if(!ServletFileUpload.isMultipartContent(request)){
                //按照传统方式获取数据
                return;
            }
            
            //设置上传单个文件的大小的最大值，目前是设置为1024*1024字节，也就是1MB
            upload.setFileSizeMax(1024*1024);
            //设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为10MB
            upload.setSizeMax(1024*1024*10);
            
            //
           
            
            //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            List<FileItem> list = upload.parseRequest(request);
            for(FileItem item : list){
                //如果fileitem中封装的是普通输入项的数据
                if(item.isFormField()){
                    String name = item.getFieldName();
                    //解决普通输入项的数据的中文乱码问题
                    String value = item.getString("UTF-8");
//                    String value = item.getString("gbk");
                    //value = new String(value.getBytes("iso8859-1"),"UTF-8");
                    System.out.println(name + "=" + value);
                }else{//如果fileitem中封装的是上传文件
                    //得到上传的文件名称，
                    String filename = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+"."+item.getName().split("\\.")[1];
                    System.out.println(filename+"..");
                    if(filename==null || filename.trim().equals("")){
                        continue;
                    }
                    //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
                    //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
                    filename = filename.substring(filename.lastIndexOf("\\")+1);
                    //得到上传文件的扩展名
                    String fileExtName = filename.substring(filename.lastIndexOf(".")+1);
                    //如果需要限制上传的文件类型，那么可以通过文件的扩展名来判断上传的文件类型是否合法
                    System.out.println("上传的文件的扩展名是："+fileExtName);
                    //获取item中的上传文件的输入流
                    InputStream in = item.getInputStream();
                    //得到文件保存的名称
                    String saveFilename = makeFileName(filename);
                    //得到文件的保存目录
                    String realSavePath = makePath(saveFilename, savePath);
                    //创建一个文件输出流
                    FileOutputStream out = new FileOutputStream(realSavePath + "/" + saveFilename);
                    //创建一个缓冲区
                    byte buffer[] = new byte[1024];
                    //判断输入流中的数据是否已经读完的标识
                    int len = 0;
                    StringBuffer sb = new StringBuffer();
                    //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
                    while((len=in.read(buffer))>0){
                        //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
//                    	System.out.println(realSavePath);
//                    	System.out.println();
                        sb.append(new String(buffer,0,len));
//                        logger.info(sb.toString());
//                        System.out.println(sb.toString());
//                        sb.setLength(0);
                    	out.write(buffer, 0, len);
                    }
                    //关闭输入流
                    in.close();
                    //关闭输出流
                    out.close();
                    System.out.println("文件保存地址为："+realSavePath + "/" + saveFilename);
                    //删除处理文件上传时生成的临时文件
                    //item.delete();
                    ReadExcel ex = new ReadExcel();
                    File files = new File(realSavePath + "/" + saveFilename);
                    List<Map<String, Object>> mapList = ex.exportListFromExcel(files, 0);
                    
                    for(int i = 0 ; i < mapList.size() ; i ++){
                    	// excel读取时将文件转化为map形式   将每一个map取出得到具体的值以及对应的业主信息。
                    	Map<String, Object> map  =  mapList.get(i);
                    	
                    	int j = i + 2;
                    	// 业主名称
                    	String ownername = (String) map.get("A"+j);
                		// 业主联系方式
                		Double mobile = (Double) map.get("B"+j);
                		// 小区栋数
                		Double building = (Double) map.get("C"+j);
                		// 单元数
                		Double unit = (Double) map.get("D"+j);
                		// 楼层数
                		Double floor = (Double) map.get("E"+j);
                		// 门牌数
                		Double number = (Double) map.get("F"+j);
                    	
                		List<Record> recordList = Db.find("select * from t_owner where ownername = ? and mobile = ? and building = ? and unit = ? and floor = ? and number = ? and villageid = ? and rstate = 0"
                				,ownername,mobile.longValue(),building.intValue(),unit.intValue(),floor.intValue(),number.intValue(),villageid);
                		List<Record> recordList1 = Db.find("select * from t_owner where building = ? and unit = ? and floor = ? and number = ? and villageid = ? and rstate = 0"
                				,building,unit,floor,number,villageid);
                		
                		if(recordList.size() == 0 && recordList1.size() == 0){
	                		// 导入用户不存在则添加进入业主表内
		                    Db.save("t_owner", new Record()
		                    			.set("ownername", map.get("A"+j))
		        						.set("mobile", map.get("B"+j))
		        						.set("villageid", villageid)
		        						.set("building", map.get("C"+j))
		        						.set("unit", map.get("D"+j))
		        						.set("floor", map.get("E"+j))
		        						.set("number", map.get("F"+j))
		        						.set("housingarea", map.get("G"+j))
		        						.set("createtime", new Date()));
                		}
                    }
                    
                    System.out.println("end");
                    
                    message = "success";
                }
            }
        }catch (FileUploadBase.FileSizeLimitExceededException e) {
            e.printStackTrace();
            message = "单个文件超出最大值！！！";
            /*request.setAttribute("message", "单个文件超出最大值！！！");*/
           /* request.getRequestDispatcher("/message.jsp").forward(request, response);*/
            return;
        }catch (FileUploadBase.SizeLimitExceededException e) {
            e.printStackTrace();
            message = "上传文件的总的大小超出限制的最大值！！！";
            /*request.setAttribute("message", "上传文件的总的大小超出限制的最大值！！！");*/
            /*request.getRequestDispatcher("/message.jsp").forward(request, response);*/
            return;
        }catch (Exception e) {
            message= "文件上传失败！";
            e.printStackTrace();
        }
        /*request.setAttribute("message",message);*/
//        returnResultJson(response,message);
        /*request.getRequestDispatcher("/message.jsp").forward(request, response);*/
		
		return;
	}
	     
	    private String makeFileName(String filename){  //2.jpg
	        //为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
	        return UUID.randomUUID().toString() + "_" + filename;
	    }
	    
	     
	    private String makePath(String filename,String savePath){
	        //得到文件名的hashCode的值，得到的就是filename这个字符串对象在内存中的地址
	        int hashcode = filename.hashCode();
	        int dir1 = hashcode&0xf;  //0--15
	        int dir2 = (hashcode&0xf0)>>4;  //0-15
	        //构造新的保存目录
	        String dir = savePath + "/" + dir1 + "/" + dir2;  //upload\2\3  upload\3\5
	        //File既可以代表文件也可以代表目录
	        File file = new File(dir);
	        //如果目录不存在
	        if(!file.exists()){
	            //创建目录
	            file.mkdirs();
	        }
	        return dir;
	    }
	public void add() {

		String propertyid = Utils.getStrVal(getSessionAttr("propertyid"));
		
		List<Record> list = Db
				.find("select * from t_village where rstate = 0 and propertyid = '"+propertyid+"' order by id desc");

		setAttr("villagelist", list);
		
		render("/html/owner/add.jsp");
	}

	public void submit() {
		// 业主名称
		String ownername = StringUtils.defaultString(getPara("ownername"));
		// 业主联系方式
		String mobile = StringUtils.defaultString(getPara("mobile"));
		// 小区id
		String villageid = StringUtils.defaultString(getPara("villageid"));
		// 小区栋数
		String building = StringUtils.defaultString(getPara("building"));
		// 单元数
		String unit = StringUtils.defaultString(getPara("unit"));
		// 楼层数
		String floor = StringUtils.defaultString(getPara("floor"));
		// 门牌数
		String number = StringUtils.defaultString(getPara("number"));
		// 住房面积
		String housingarea = StringUtils.defaultString(getPara("housingarea"));
		// 装修情况
		String decoration = StringUtils.defaultString(getPara("decoration"));
		// 收楼情况
		String repossession = StringUtils.defaultString(getPara("repossession"));
		// 入住情况
		String checkstatus = StringUtils.defaultString(getPara("checkstatus"));
		
		
		List<Record> recordList = Db.find("select * from t_owner where ownername = ? and mobile = ? and building = ? and unit = ? and floor = ? and number = ? and villageid = ? and rstate = 0"
				,ownername,mobile,building,unit,floor,number,villageid);
		List<Record> recordList1 = Db.find("select * from t_owner where building = ? and unit = ? and floor = ? and number = ? and villageid = ? and rstate = 0"
				,building,unit,floor,number,villageid);
		if(recordList.size() == 0 && recordList1.size() == 0){
			Db.save("t_owner",
					new Record().set("ownername", ownername)
							.set("mobile", mobile)
							.set("villageid", villageid)
							.set("building", building)
							.set("unit", unit)
							.set("floor", floor)
							.set("number", number)
							.set("housingarea", housingarea)
							.set("decoration", decoration)
							.set("repossession", repossession)
							.set("checkstatus", checkstatus)
							.set("createtime", new Date()));
		}

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_owner");

		renderJson(GsonUtils.toJson(statusBean));
	}

	public void edit() {

		String id = StringUtils.defaultString(getPara("id"));

		String propertyid = Utils.getStrVal(getSessionAttr("propertyid"));
		
		Record record = Db.findFirst("select * from t_owner where id = ?",
				id);

		List<Record> list = Db
				.find("select * from t_village where rstate = 0 and propertyid = '"+propertyid+"' order by id desc");

		setAttr("villagelist", list);
		
		
		if (record != null) {

			setAttrs(record.getColumns());

			render("/html/owner/edit.jsp");

		} else {

			renderJson(GsonUtils.toJson(setStatusError(null, false)));
		}

	}

	public void update() {

		String id = StringUtils.defaultString(getPara("id"));

		// 业主名称
		String ownername = StringUtils.defaultString(getPara("ownername"));
		// 业主联系方式
		String mobile = StringUtils.defaultString(getPara("mobile"));
		// 小区id
		String villageid = StringUtils.defaultString(getPara("villageid"));
		// 小区栋数
		String building = StringUtils.defaultString(getPara("building"));
		// 单元数
		String unit = StringUtils.defaultString(getPara("unit"));
		// 楼层数
		String floor = StringUtils.defaultString(getPara("floor"));
		// 门牌数
		String number = StringUtils.defaultString(getPara("number"));
		// 住房面积
		String housingarea = StringUtils.defaultString(getPara("housingarea"));
		// 装修情况
		String decoration = StringUtils.defaultString(getPara("decoration"));
		// 收楼情况
		String repossession = StringUtils.defaultString(getPara("repossession"));
		// 入住情况
		String checkstatus = StringUtils.defaultString(getPara("checkstatus"));
		
		Db.update(
				"update t_owner set ownername = ?, mobile = ?, villageid = ?, building = ?, unit = ?, floor = ? , number = ? , housingarea = ?,decoration = ? ,repossession = ?, checkstatus = ? where id = ?",
				ownername, mobile, villageid, building ,unit ,floor ,number ,housingarea ,decoration ,repossession ,checkstatus ,
				id);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_owner");

		renderJson(GsonUtils.toJson(statusBean));
	}

	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void del() {

		String id = StringUtils.defaultString(getPara("id"));

		Db.update("update t_owner set rstate = 1 where id = ?", id);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_owner");

		statusBean.setCloseCurrent(false);

		renderJson(GsonUtils.toJson(statusBean));
	}
	
	public void family() {

		String id = getPara("id");
		
		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);

		Page<Record> page = Db.paginate(pageCurrent, PageSize_Default, "select t1.*" ,"from t_owner_relationship t1  where t1.ownerid = ? and t1.rstate = 0  order by id desc",id);

		setAttr("pageSize", page.getTotalPage());
		
		setAttr("ownerid", id);

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());

		setAttr("familylist", page.getList());
		
		setAttr("pageitem", PageSize_Default);

		render("/html/owner/family/list.jsp");
	}
	public void addfamily() {
		String id = getPara("id");
		
		setAttr("ownerid", id);
		
		render("/html/owner/family/add.jsp");
	}
	public void submitfamily() {
		String ownerid = StringUtils.defaultString(getPara("ownerid"));
		String name = StringUtils.defaultString(getPara("name"));
		String relationship = StringUtils.defaultString(getPara("relationship"));
		String telephone = StringUtils.defaultString(getPara("telephone"));
		String idcard = StringUtils.defaultString(getPara("idcard"));
		Record record = new Record();
		boolean flag = Db.save("t_owner_relationship",
				record.set("ownerid", ownerid).set("name", name)
					  .set("relationship", relationship).set("telephone", telephone)
						.set("idcard", idcard).set("createtime", new Date()));
		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_owner");

		renderJson(GsonUtils.toJson(statusBean));
	}
	public void editfamily() {

		String id = getPara("id");

		Record record = Db.findFirst("select *, id as familyid from t_owner_relationship where id = ?", id);
		
		if (record != null) {
			
			setAttrs(record.getColumns());
		}

		render("/html/owner/family/edit.jsp");
	}

	public void updatefamily() {

		String ownerid = StringUtils.defaultString(getPara("ownerid"));
		String name = StringUtils.defaultString(getPara("name"));
		String relationship = StringUtils.defaultString(getPara("relationship"));
		String telephone = StringUtils.defaultString(getPara("telephone"));
		String idcard = StringUtils.defaultString(getPara("idcard"));
		String familyid = StringUtils.defaultString(getPara("familyid"));
		

		Db.update(
				"update t_owner_relationship set name = ?, relationship = ?, telephone = ?,idcard = ? where id = ?",
				name, relationship, telephone,idcard, familyid);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_circle");

		renderJson(GsonUtils.toJson(statusBean));
	}
	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void delfamily(){
		String id = StringUtils.defaultString(getPara("id"));

		Db.update("update t_owner_relationship set rstate = 1 where id = ?", id);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_owner");

		statusBean.setCloseCurrent(false);

		renderJson(GsonUtils.toJson(statusBean));
	}
}
