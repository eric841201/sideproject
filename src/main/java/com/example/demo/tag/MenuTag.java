package com.example.demo.tag;

import static org.springframework.web.servlet.tags.RequestContextAwareTag.REQUEST_CONTEXT_PAGE_ATTRIBUTE;

import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.springframework.web.servlet.support.RequestContext;

import com.example.demo.bean.Menu;
import com.example.demo.service.MenuService;
import com.example.demo.util.SpringContextUtil;

public class MenuTag extends SimpleTagSupport {

	private List<String> grantedAccessIdList;

	private Locale locale;

	@Override
	public void doTag() throws JspException {
		JspWriter out = getJspContext().getOut();

		try {
			JspFragment f = getJspBody();
			if (f != null) {
				f.invoke(out);
			}
			MenuService menuService = SpringContextUtil.getApplicationContext().getBean("MenuService",
					MenuService.class);
			List<Menu> menuList = menuService.findAll();
			int sidebarNum = 0;
			StringBuilder sb = new StringBuilder();
			for (Menu module : menuList) {
				if (module.getChildNodes().isEmpty()) {
					continue;
				}
				sb.append("    <li class='nav-item'>");
				sb.append(
						"        <span class='nav-link  collapsed  d-flex justify-content-between align-items-center' data-toggle='collapse' data-target='#submenu-"
								+ sidebarNum + "'>");
				sb.append("        <span>");
				sb.append("            <span class='sidebar-icon'><span class='" + getMenu(module, module.getI18nCode())
						+ "'></span></span>");
				sb.append("            <span class='sidebar-text' style='word-break:break-word'>"
						+ getMenuName(module.getI18nCode()) + "</span>");
				sb.append("        </span>");
				sb.append("        <span class='link-arrow'><span class='fas fa-chevron-right'></span></span>");
				sb.append("        </span>");
				sb.append("        <div class='multi-level collapse' role='list' id='submenu-" + sidebarNum
						+ "' aria-expanded='false'>");
				sb.append("            <ul class='flex-column nav'>");
				// function
				sb = composeFunctionMenu(sb, module);
				sb.append("            </ul>");
				sb.append("        </div>");
				sb.append("    </li>");

				sidebarNum++;
			}
			// sb.append("</ul>");

			out.println(sb.toString());

		} catch (Exception e) {
			// TODO: handle exception
		}
	}


	/**
	 * 組織主功能/子功能選單HTML標籤語法
	 * 
	 * @param sb     StringBuilder
	 * @param module 功能模組/主功能項
	 * @return 功能選單HTML標籤語法
	 */
	private StringBuilder composeFunctionMenu(StringBuilder sb, Menu module) {
		for (Menu function : module.getChildNodes()) {
			if (function.getChildNodes().isEmpty()) {
				sb.append("            <li class='nav-item'>");
				sb.append("            <a class='nav-link d-flex align-items-center justify-content-between' href='"
						+ function.getHref() + "'>");
				sb.append(
						"                <span class='sidebar-text-contracted'><span class='fas fa-chevron-right'></span></span>");
				sb.append("                <span class='sidebar-text' style='word-break:break-word'>"
						+ getMenuName(function.getI18nCode()) + "</span>");
				sb.append("            </a>");
				sb.append("            </li>");

			} else {
				sb.append("    <li class='nav-item'>");
				sb.append(
						"        <span class='nav-link  collapsed  d-flex justify-content-between align-items-center' data-toggle='collapse' data-target='#submenu-access_control'>");
				sb.append("        <span>");
				sb.append("            <span class='sidebar-icon'><span class='" + getMenu(module, module.getI18nCode())
						+ "'></span></span>");
				sb.append("            <span class='sidebar-text'>" + getMenuName(function.getI18nCode()) + "</span>");
				sb.append("        </span>");
				sb.append("        <span class='link-arrow'><span class='fas fa-chevron-right'></span></span>");
				sb.append("        </span>");
				sb.append(
						"        <div class='multi-level collapse' role='list' id='submenu-access_control' aria-expanded='false'>");
				sb.append("            <ul class='flex-column nav'>");
				// function
				sb = composeFunctionMenu(sb, function);
				sb.append("            </ul>");
				sb.append("        </div>");
				sb.append("    </li>");

			}
		}

		return sb;
	}

	/**
	 * 取得多國語系的文字
	 * 
	 * @param String i18nCode
	 * @return 多國語系的文字
	 */
	private String getMenuName(String i18nCode) {

		// 取得目前的Locale設定
		// Locale locale = LocaleContextHolder.getLocale();
		RequestContext requestContext = (RequestContext) this.getJspContext()
				.getAttribute(REQUEST_CONTEXT_PAGE_ATTRIBUTE);

		// i18n檔案名稱開頭 - messages
		ResourceBundle res = ResourceBundle.getBundle("messages", requestContext.getLocale());

		String menuName = null;
		try {
			if (i18nCode == null)
				return "";
			menuName = res.getString(i18nCode);
		} catch (java.util.MissingResourceException ex) {
			menuName = "";
		}
		if (menuName == null) {
			menuName = "";
		}
		return menuName;
	}

	private String getMenu(Menu module, String i18n) {

		// module.getI18nCode().equals("i18nCode")
		if (module.getI18nCode().equals("ui.menu.index")) { // 權限管理
			return "fas fa-user-plus";
		} else if (module.getI18nCode().equals("ui.menu.inedex")) { // 系統管理
			return "fas fa-cog";
		} else if (module.getI18nCode().equals("ui.menu.institute")) { // 使用機構管理
			return "fas fa-university";
		} else if (module.getI18nCode().equals("ui.menu.child-institute")) { // 子機構管理
			return "fas fa-sitemap";
		} else if (module.getI18nCode().equals("ui.menu.risk-profile")) { // 風險評估參數設定
			return "fa fa-sliders";
		} else if (module.getI18nCode().equals("ui.menu.transaction")) { // 交易管理
			return "fas fa-table";
		} else if (module.getI18nCode().equals("ui.menu.login-log")) { // 登入交易管理
			return "fas fa-table";
		} else if (module.getI18nCode().equals("ui.menu.analysis-report")) { // 統計報表
			return "fas fa-chart-bar";
		} else if (module.getI18nCode().equals("ui.menu.abnormal-report")) { // 異常報表
			return "fas fa-tags";
		} else if (module.getI18nCode().equals("ui.menu.rule-engine")) { // 规则引擎
			return "fas fa-user-shield";
		} else if (module.getI18nCode().equals("ui.menu.diia")) { // DIIA管理
			return "fa fa-laptop";
		}

		return null;
	}
	
	   public void setGrantedAccessIdList(List<String> grantedAccessIdList) {
	        this.grantedAccessIdList = grantedAccessIdList;
	    }
		public void setLocale(Locale locale) {
			this.locale = locale;
		}

}
