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
입출력 최적화
```java
import java.io.*;
import java.util.*;

public class Main {
	
	static int[][] paper;
	static int[] ans = new int[3];
	
	public static void main(String[] args) {
		InputReader in = new InputReader(System.in);
		PrintWriter out = new PrintWriter(System.out);

		int n = in.nextInt();
		paper = new int[n][n];
		for(int i=0; i<n; ++i) {
			for(int j=0; j<n; ++j) {
				paper[i][j] = in.nextInt() + 1;
			}
		}
		int pn = pn(0, 0, n);
		if(pn != -1)
			ans[pn]++;
		for(int i=0; i<3; ++i)
			System.out.println(ans[i]);
		
		out.close();
	}
	
	static int pn(int i, int j, int size) {
		if(size == 1)
			return paper[i][j];
		
		int[] cnt = new int[3];
		int ns = size / 3;
		for(int a = 0; a < 3; ++a) {
			for(int b = 0; b < 3; ++b) {
				int ni = i + a * ns;
				int nj = j + b * ns;
				int ppn = pn(ni, nj, ns);
				if(ppn != -1)
					cnt[ppn]++;
			}
		}
		for(int a = 0; a < 3; ++a) {
			if(cnt[a] == 9)
				return a;
		}
		for(int a = 0; a < 3; ++a) {
			ans[a] += cnt[a];
		}
		return -1;
	}
}


class InputReader {

	private final InputStream stream;
	private final byte[] buf = new byte[8192];
	private int curChar, snumChars;

	public InputReader(InputStream st) {
		this.stream = st;
	}

	public int read() {
		if (snumChars == -1)
			throw new InputMismatchException();
		if (curChar >= snumChars) {
			curChar = 0;
			try {
				snumChars = stream.read(buf);
			} catch (IOException e) {
				throw new InputMismatchException();
			}
			if (snumChars <= 0)
				return -1;
		}
		return buf[curChar++];
	}

	public int nextInt() {
		int c = read();
		while (isSpaceChar(c)) {
			c = read();
		}
		int sgn = 1;
		if (c == '-') {
			sgn = -1;
			c = read();
		}
		int res = 0;
		do {
			res *= 10;
			res += c - '0';
			c = read();
		} while (!isSpaceChar(c));
		return res * sgn;
	}

	public long nextLong() {
		int c = read();
		while (isSpaceChar(c)) {
			c = read();
		}
		int sgn = 1;
		if (c == '-') {
			sgn = -1;
			c = read();
		}
		long res = 0;
		do {
			res *= 10;
			res += c - '0';
			c = read();
		} while (!isSpaceChar(c));
		return res * sgn;
	}

	public int[] nextIntArray(int n) {
		int a[] = new int[n];
		for (int i = 0; i < n; i++) {
			a[i] = nextInt();
		}
		return a;
	}

	public String readString() {
		int c = read();
		while (isSpaceChar(c)) {
			c = read();
		}
		StringBuilder res = new StringBuilder();
		do {
			res.appendCodePoint(c);
			c = read();
		} while (!isSpaceChar(c));
		return res.toString();
	}

	public String nextLine() {
		int c = read();
		while (isSpaceChar(c))
			c = read();
		StringBuilder res = new StringBuilder();
		do {
			res.appendCodePoint(c);
			c = read();
		} while (!isEndOfLine(c));
		return res.toString();
	}

	public boolean isSpaceChar(int c) {
		return c == ' ' || c == '\n' || c == '\r' || c == '\t' || c == -1;
	}

	private boolean isEndOfLine(int c) {
		return c == '\n' || c == '\r' || c == -1;
	}

}
```



