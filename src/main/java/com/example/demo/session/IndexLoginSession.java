package com.example.demo.session;



import java.io.Serializable;
import java.util.List;
import java.util.Locale;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import com.example.demo.bean.Member;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Component
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS, value = "session")
public class IndexLoginSession implements Serializable{
	
	private static final long serialVersionUID = 1L;

	/**
	 * 用戶登錄訊息類
	 */
	private Member member = null;
    
    /**
     * 被授權的功能項目代碼
     */
    private List<String> grantedAccessIdList;
    
    /**
     * 被授權覆核的功能項目代碼
     */
    
    /**
     * 使用機構使用者授權功能清單
     */
    
    /**
     * 使用機構使用者授權功能Key-Value
     */
    
    /**
     * 語言國別代碼
     */
    private Locale locale;
    
    /**
     * 登入紀錄
     */	
    
}
