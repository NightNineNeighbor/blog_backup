# Transaction

root-context.xml
```java
<bean id="dataSource"
		...
	</bean>
	<bean id="sqlSessionFactory"
		...
	</bean>
	<bean id="sqlSessionTemplate"
		...
	</bean>

	<bean id="txManager"
		class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
		<property name="dataSource" ref="dataSource" />
	</bean>
```

Test.java

```java
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class Test {
	@Autowired TXDao dao;
	
	@Test
	@Transactional
	public void create() {
		for(int i = 0; i < 10; i++) {
			dao.insert("asdf");
		}
		assertThat(dao.select("asdf").equals("asdf") , is(true));
	}

}
```

JUnit에 트랜잭션의 롤백을 적용해서 DB에 영향을 끼치지 않는 예제이다. @Transactional 을 붙임으로써 해당 메소드에 트랜잭션이 적용되게 된다. 그를 위해서 txManager를 DI해줘야 하기 때문에 빈으로 등록해주어야 한다. 그렇지 않으면 작동하지 않는다.

 다만, 어째서 @Transactional 만 붙였는데 롤백이 작용하는지는 모르겠다.