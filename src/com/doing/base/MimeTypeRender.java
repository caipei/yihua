package com.doing.base;

import java.io.File;
import java.io.FileInputStream;

import javax.servlet.ServletOutputStream;

import com.jfinal.log.Logger;
import com.jfinal.render.Render;

/**
 * 用来render图片
 * Created by konbluesky
 * Date : 14-8-24 上午2:34
 */
public class MimeTypeRender extends Render {
    private static Logger log = Logger.getLogger(MimeTypeRender.class);
    private String mimetype;
    private String filename;
 
    public MimeTypeRender(String mimetype, String filename) {
        this.mimetype=mimetype;
        this.filename=filename;
    }
 
    public void render() {
//        Cookie cookie = new Cookie(randomCodeKey, vCode);
//        cookie.setMaxAge(-1);
//        cookie.setPath("/");
//        response.addCookie(cookie);
 
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType(ContentTypeKit.get(mimetype));
        
        try (ServletOutputStream sos=response.getOutputStream();) {
            File file = new File(filename);
            //设置头信息,内容处理的方式,attachment以附件的形式打开,就是进行下载,并设置下载文件的命名
//            response.setHeader("Content-Disposition","attachment;filename="+file.getName());
            // 创建文件输入流
            FileInputStream is = new FileInputStream(file);
            // 创建缓冲区
            byte[] buffer = new byte[1024];
            int len = 0;
            while ((len = is.read(buffer)) != -1) {
                sos.write(buffer, 0, len);
            }
            is.close();
        } catch (Exception e) {
            log.error("图片render出错:"+e.getLocalizedMessage(),e);
            throw new RuntimeException(e);
        }
    }
}
