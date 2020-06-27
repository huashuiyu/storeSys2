package config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;

/**
 * 该类是一个配置类，作用同bean.xml
 *  spring中的新注解
 * Configuration
 *      作用：指定当前类为配置类
 *      当配置类作为AnnotationConfigApplicationContext对象创建的参数时，该注解可以省略
 * ComponentScan
 *      作用：通过注解指定spring容器创建时要扫描的包
 *      属性：
 *          value：同basePackages作用相同，指定要扫描的包。
 *                  使用此注解等同在xml中配置了：
 *                          <context:component-scan base-package="com.ldu"></context:component-scan>
 * Bean
 *      作用：用于把当前方法的返回值作为bean对象存入spring的ioc容器中
 *      属性：
 *          name：用于指定bean的id。不写时，默认值是当前方法名称
 *          当使用注解配置方法时，若方法有参数，spring框架会区容器中查找有无可用neam对象。
 *          查找方式同Autowired注解作用相同
 * Import
 *      作用：导入其他的配置类
 *      属性：
 *          value：指定其他配置类的字节码
 *                  当使用Import的注解后，有Import注解的类就是父配置类，而导入的都是子配置类
 * PropertySource
 *      作用：指定properties文件位置
 *      属性：
 *          value：指定文件的名称和路径。
 *              关键字：classpath，表示类路径下
 */
//@Configuration
@ComponentScan("config")
@Import(JdbcConfig.class)
@PropertySource("classpath:jdbcConfig.properties")
public class SpringConfiguration {

}
