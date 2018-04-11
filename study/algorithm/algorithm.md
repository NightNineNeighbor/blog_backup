참고

http://snacky.tistory.com/10 //buffered reader

# 알고리즘

## 문제해결 전략

* 비슷한 문제를 풀어 보았는가
* 단순한 방법은 없는가
* 문제를 단순화
* 그림으로 그려보자
* 수식으로 표현해보자
* 문제를 분해할 수 있을까
* 뒤에서부터 생각해보자
* 순서를 강제할 수 있을까 - 전구 켜기 문제

## 좋은 코드 작성

* 간결한 코드 - 매크로(사파)
* 코드 재사용 - 하지만 한계가 있다.
* 표준 라이브러리
* 코딩 스타일 정립
* 명료한 명명법
* 코드와 데이터의 분리



## 재귀호출

* 기저사례 : 쪼개지지 않는 가장 작은 작업



입출력 예제

```java
import java.util.*;
import java.io.*;
class Main{
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int N = Integer.parseInt(br.readLine());
		int[] input = new int[N];
		for(int i = 0; i < N; i++) {
			input[i] = Integer.parseInt(br.readLine());
		}
		Arrays.sort(input);
		for(int i = 0; i < N; i++) {
			bw.write(input[i]+"\n");
		}
		bw.flush();
	}
}
```

