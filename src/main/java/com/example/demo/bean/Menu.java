package com.example.demo.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicUpdate;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

@DynamicUpdate
@Data
@SuperBuilder
@NoArgsConstructor
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true, exclude = "childNodes")
@Entity
@Table(
        name = "T_ADMIN_MENU",
        indexes = {
            @Index(name = "IDX_ADMIN_MENU_1", columnList="PARENT_OID", unique = false)
        }
)
public class Menu extends BaseBean {
	
    /**
     * 選單節點類別 <br>
     * M-Module(功能模組), F-Function(功能項目)
     */
    @Column(name = "NODE_TYPE", length = 1, nullable = false)
    private String nodeType;
    
    /**
     * 功能或節點名稱
     */
    @Column(name = "FNCT_NAME", length = 255, nullable = false)
    private String fnctName;
    
    /**
     * I18N(多國語言)的代號 
     */
    @Column(name = "I18N_CODE", length = 255)
    private String i18nCode;
    
    /**
     * 節點順序 <br>
     * 用於指定同一層的模組或功能選單的呈現順序
     */
    @Column(name = "NODE_ORDER", nullable = false)
    private Integer nodeOrder;
    
    /**
     * 功能項目代碼 <br>
     * 供系統進行操作權限檢核使用
     */
    @Column(name = "ACCESS_ID", length = 60)
    private String accessId;
    
    /**
     * 功能選單網址鏈結
     */
    @Column(name = "HREF", length = 255)
    private String href;
      
    
    /**
     * 父節點功能選單
     */
	@JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PARENT_OID", foreignKey = @ForeignKey(name = "FK_ADM_MENU_PARN_OID"))
    private Menu parentNode;
    
    /**
     * 子節點功能選單
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy="parentNode")
    @OrderBy(value = "NODE_ORDER asc")
    private Set<Menu> childNodes = new HashSet<Menu>();
 
    /**
     * 暫時性的屬性，用於 "功能群組設定" 作業中，用於記錄用戶勾選 "權限" 的暫時性記錄。 
     */
    @Transient
    private Boolean mark;

    /**
     * 創建 "節點" 用建構子
     * 
     * @param fnctName        節點名稱
     * @param nodeOrder       節點名稱
     * @param i18nCode        i18n名稱
     */
    public Menu(String fnctName, Integer nodeOrder,
			String i18nCode) {
		super();
		this.nodeType = "M";	// 選單節點類別 = M/F
		this.fnctName = fnctName;
		this.nodeOrder = nodeOrder;
		this.i18nCode = i18nCode;

	}

    /**
     * 創建 "功能" 用建構子
     * 
     * @param fnctName        功能名稱
     * @param nodeOrder       功能順序
     * @param accessId        功能項目代碼
     * @param href            功能選單網址鏈結
     * @param parentNode      父節點
     * @param i18nCode        i18n名稱
     */
	public Menu(String fnctName, Integer nodeOrder, String accessId, String href,
			Menu parentNode , String i18nCode) {
		super();
		this.nodeType = "F";	// 選單節點類別 = M/F
		this.fnctName = fnctName;
		this.nodeOrder = nodeOrder;
		this.accessId = accessId;
		this.href = href;
		this.parentNode = parentNode;
		this.i18nCode = i18nCode;
	}
	
}
