```java

	public Connection getConnection() {
		try {
            //리플렉션을 이용한다. throws ClassNotFoundException
            //클래스 이름을 이용하여 메모리에 클래스를 올린다.
            //아래 코드의 경우 메모리에 드라이버를 올리는 것이다.
			Class.forName("oracle.jdbc.driver.OracleDriver");
            //java api 참조
            //throws SQLException
            //static Connection	getConnection(String url, String user, String password)
		   //Attempts to establish a connection to the given database URL.
			return DriverManager.getConnection("jdbc.oracle.thins:@localhost:1521:XE", "SCOTT", "TIGER");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
```

class.forName에 대한 좀 더 자세한 내용이 필요할 수 있습니다. jdbc에 class.forName이 등장하는 이유는 벤더들 때문입니다.

oracle, mysql, mssql, postgresql, db2 등 다양한 dbms와 이 dbms들이 만들어낸 다양한 버전을 대응할 수 없기 때문에 JDBC 스펙을 정의하고 해당 드라이버에 대한 구현은 각 벤더에게 위임했습니다. 그래서 각 dbms마다 jdbc 라이브러리가 다 다릅니다. 대신 registerDirver메소드에 의해 등록되도록 만들었습니다. 이제 문제는 그 라이브러리가 어디있는지 어떻게 인식시키느냐는 건데 이때 class.forName을 사용해서 해당 클래스의 위치를 알려줄 수 있습니다. 하지만 알려줄 뿐이지 로드하지는 않습니다.

실제로 클래스 로딩은 class.forName이 수행하는 것이 아니라 classLoader의 loadClass 메소드를 통해서 이루어지고 class.forName은 직접적인 호출을 피하기 위한 완충작용을 한다고 볼 수 있습니다.

https://www.slipp.net/questions/275

Class.forName을 활용해 jdbc driver를 등록하는 과정

https://www.slipp.net/questions/276