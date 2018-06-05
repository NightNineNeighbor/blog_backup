# JSP
# JSP기초 문법
# JSP의 스크립트

## JSP 스크립트의 이해

* 선언문 Declaration```<%!  declaration %>``` 로 선언, 서블릿 클래스의 멤버 변수 & 메소드가 된다
* 스크립트릿 Scriptlet ```<% scriptlet %>```로 선언, 지역 변수가 된다.
* 표현식 Expression ```<%= 변수 혹은 메소드 %>``` 
* 주석 Comment

#### 표현식 예제

```html
<table border="1" width="200">
	<%!String name[] = {"Java","JSP","Android","Struts"};%>
	<% for(int i = 0 ; i < name.length;i++){ %>
	<tr><td><%=i %></td>
	<td><%=name[i] %></td>
	</tr>
	<%} %>
	</table>
```



# 지시자

지시자는 태그 안에서 @로 시작하며 다음과 같은 3가지 종류가 있다.

* page
* include
* taglib

## page 지시자

jsp 페이지에 지원되는 속성들을 정의한다. JSP컨테이너에게 JSP페이지를 어떻게 처리할지 알려준다.

#### info 속성

> ​	```<%@page info="JSPSTudy.co.kr"%>```

페이지 처리 내용에는 영향을 주지 않는다. jsp페이지의 제목을 붙이는 기능등을 한다.

#### language 속성

> ```<%@page language="java"%>```

jsp페이지의 스크립트 요소에서 사용할 언어를 지정한다. 디폴트는 java

#### contentType속성

> ​	```<%@page contentType="text/html";charset="EUC-KR"%>```

jsp페이지의 내용이 어떤 형태로 출력할 것인지 알려준다.

문자형식 charset 을 지정하는데 사용할 수 있다.

#### extends 속성

> ```<%@page extends="com.jspstudy.Directive"%>```

JSP 페이지가 Servlet소스로 변환되는 시점에서 자신이 상속받을 클래스를 지정한다.

#### import 속성

> ```html
> <%@page import="java.util.*,java.sql.*"
>         import="java.io.*"%>
> ```

jsp페이지 내에서 package 이름을 지정하지 않고 다른 클래스를 사용할 떄 쓰인다.

중복 사용 가능.

## include 지시자

> ```<%@include file="로컬URL"%>```

여러 jsp 페이지에서 공통으로 포함하는 내용이 있을 때 별도 파일에 저장한후 라이브러리처럼 사용할 수 있게 한다.

# 액션태그

* include
* foward
* plug-in
* useBean
* setProperty
* getProperty

### include 태그

> ```jsp:include page="로컬URL" flush="true"/>```

다른 페이지를 현재 페이지에 포함시킬 수 있다.

다만 include지시자와는 다르게 처리 결과를 포함시킨다.

### foward 태그

> ```<jsp:foward page="로컬URL"/>```

다른 페이지로 이동할 떄 쓰인다.

jsp페이지 내에서 foward태그를 만나게 되면 foward태그가 있던 jsp 페이지의 모든 내용을 버리고서 foward 태그가 지정하는 다른 페이지로 이동하게 된다.

# 내부객체

JSP컨테이너가 제공하는 특별한 객체(변수)

* request  : 파라미터를 포함한 요청을 담고 있는 객체
* response : 요청에 대한 응답을 담고 있는 객체
* out : 페이지 내용을 담고 있는 출력 스트림 객체
* session : 세션 정보를 담고 있는 객체
* application : 어플리케이션 Context의 모든 페이지가 공유할 데이터를 담고 있는 객체
* pageContext : 페이지 실행에 필요한 Context 정보를 담고 있는 객체
* page : JSP 페이지의 서블릿 객체
* config : JSP 페이지의 서블릿 설정 초기화 정보 객체
* exception : JSP 페이지의 서블릿 실행 시 처리하지 못한 예외 객체

# 자바빈

빈 태그

```<jsp:useBean id="..." scope="..."/>``` : 빈을 생성하여 둔다

```<jsp:setProperty name="..." property="..."/>``` : 빈에 값을 저장한다.

```<jsp:getProperty name="..." property="..."/>``` : 빈의 값을 가져온다.

예제

```html
<jsp:useBean id="myBean" class="com.SimpleBean" scpoe="page" />
<jsp:setProperty name="myBean" property="message" value="빈 정복!"/>
<jsp:getProperty name="myBean" property="message"/>
```

스코프

* page : 해당 jsp페이지 내에서만 존재한다.
* request : 사용자의 요청(request)를 처리하는 동안 존재한다.
* session : 사용자가 최초에 접속하여 세션이 종료되기까지 존재한다.
* application : 해당 어플리케이션이 살아 있는 동안 함께 존재한다.