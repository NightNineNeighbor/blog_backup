# 파일 업로드

controller

```java
@Controller
public class UploadController {
	@PostMapping("/")
	public String fileUpload(MultipartFile myfile) throws IOException {
		File file = new File("d:/",myfile.getOriginalFilename());
		FileCopyUtils.copy(myfile.getBytes(), file);
		return "home";
	}
}
```

pom.xml

```xml
<dependency>
	<groupId>commons-fileupload</groupId>
	<artifactId>commons-fileupload</artifactId>
	<version>1.3.3</version>
</dependency>
<dependency>
	<groupId>commons-io</groupId>
	<artifactId>commons-io</artifactId>
	<version>2.6</version>
</dependency>
```

root-context.xml

```xml
<bean id="filterMultipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
        <property name="maxUploadSize" value="100000000" />
        <property name="defaultEncoding" value="UTF-8" />
</bean>
```

html

```html
<form action="/file/" method="post" enctype="multipart/form-data">
	<input type="file" name="myfile">
	<input type="submit" value="file throw">
</form>
```

web.xml

```xml
<filter>
	<display-name>springMultipartFilter</display-name>
	<filter-name>springMultipartFilter</filter-name>
	<filter-class>org.springframework.web.multipart.support.MultipartFilter</filter-class>
</filter>
<filter-mapping>
	<filter-name>springMultipartFilter</filter-name>
	<url-pattern>/*</url-pattern>
</filter-mapping>
```

