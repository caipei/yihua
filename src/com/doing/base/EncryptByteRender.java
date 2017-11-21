package com.doing.base;

import javax.servlet.ServletOutputStream;

import com.doing.common.utils.Utils;
import com.jfinal.render.Render;

public class EncryptByteRender extends Render {
	
	private String encryptStr;
	
	public EncryptByteRender(String encryptStr) {
		
		this.encryptStr = encryptStr;
	}

	@Override
	public void render() {
		// TODO Auto-generated method stub
		try (ServletOutputStream sos=response.getOutputStream();) {
			
			response.addHeader("Content-Type", "application/octet-stream");
			
			Utils.encryptResult(encryptStr);
			
            sos.write(Utils.encryptResult(encryptStr));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
	}
}
