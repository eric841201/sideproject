package com.example.demo.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class SpringContextUtil implements ApplicationContextAware {
    
    /**
     * Spring Framework applicationContext
     */
    private static ApplicationContext applicationContext;

    @Override
    public void setApplicationContext(ApplicationContext ac) throws BeansException {
        if (SpringContextUtil.applicationContext == null) {
            SpringContextUtil.applicationContext = ac;
        }
    }
    
    /**
     * Getter of applicationContext
     * @return applicationContext
     */
    public static ApplicationContext getApplicationContext() {
        return applicationContext;
    }
    
    /**
     * Autowire the bean properties of the given bean instance by name or type.
     * 
     * @param existingBean    the existing bean instance
     * @param autowireMode    by name or type, using the constants in this interface
     * @param dependencyCheck whether to perform a dependency check for object references in the bean instance
     */
    public static void autowireBeanProperties(Object existingBean, int autowireMode, boolean dependencyCheck) {
        applicationContext.getAutowireCapableBeanFactory()
                .autowireBeanProperties(existingBean, autowireMode, dependencyCheck);
    }
    
}
