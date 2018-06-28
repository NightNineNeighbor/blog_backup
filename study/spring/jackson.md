# JACKSON - Java Object - JSON

root-context.xml
```xml
<bean id="mapper" class="com.fasterxml.jackson.databind.ObjectMapper" />
```

controller

```java
@autowired ObjectMapper mapper;
@GetMapping("/list")
	public String list(Model model)  {
		model.addAttribute("list", getJson(service.list()));
		return "list";
	}
private String getJson(Object object) {
		try {
			return mapper.writeValueAsString(object);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return null;
	}
```



테스트 예제

```java
@Test
	public void Mappertest() throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		List<Board> list = new ArrayList<Board>();
		list.add(new Board(3, "3번글", "테스트3", "summer", 9));
		list.add(new Board(2, "2번글", "테스트2", "spring", 6));
		list.add(new Board(1, "1번글", "테스트1", "admin", 2));

		System.out.println(mapper.writeValueAsString(list));
	}
결과 : 
[{"bno":3,"title":"3번글","content":"테스트3","writer":"summer","readCnt":9},{"bno":2,"title":"2번글","content":"테스트2","writer":"spring","readCnt":6},{"bno":1,"title":"1번글","content":"테스트1","writer":"admin","readCnt":2}]
```

