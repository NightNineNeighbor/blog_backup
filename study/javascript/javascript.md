

# 자바스크립트


## 기본 타입

```javascript
선언 : typeof 에 의한 값
var intNum = 10 : number
var floatNum = 0.1 : number
var singleQuoteStr = 'single quote string' : string
var doubleQuoteStr = "double quote String" : string
var singleChar = 'a' : string
var boolVar = true : boolean
var emptyVar : undefin
var nullVar = null : object
```

###숫자

c의 double과 비슷한 64 bit 부동 소수로 일괄 저장

### 문자열

따움표(')와 큰 따옴표(") 로 생성

한번 정의된 문자열은 변하지 않는다.

### undefined

값이 할당되지 않았을 떄, 값이 비어있음을 나타낸다. undefined 타입 변수의 값은 undefined 이다.



## 참조 타입(객체 타입)

js에서 기본타입을 제외한 모든 값은 객체이다.

객체란 ''이름(key):값(value)" 형태의 프로퍼티를 저장하는 컨테이너이다.

### 객체 생성

1. Object() 생성자 함수 이용

```js
var foo = new Object();

foo.name = 'foo';
foo.age = 30;
foo.gender = 'male';

console.log(typeof foo);	//object
console.log(foo);			//{name: "foo", age: 30, gender: "male"}
```

2. 객체 리터럴 방식 : Object()라는 내장 생성자 함수를 쓰는 것이다.

```js
var foo = {
    name : 'foo',
    age : 30,
    gender: 'male'
};
```

3. 생성자 함수 이용

> 4장에서!

### 객체 프로퍼티 읽기/쓰기/갱신

* 마침표(.) 표기법
* 대괄호([]) 표기법

```JS
//객체 리터럴 방식을 통한 foo 객체 생성
var foo = {
    name : 'foo',
    major : 'computer science'
}
//객체 프로퍼티 읽기
console.log(foo.name);		//foo
console.log(foo['name']);	//foo
console.log(foo.nickname);	//undefined
//객체 프로퍼티 갱신
foo.major = 'electronics engineering';
//객체 프로퍼티 동적 생성
foo.age = 30;
//대괄호 표기법만을 사용해야 할 경우
foo['full-name'] = 'foo bar';
console.log(foo['full-name']);	//foo bar
console.log(foo.full-name);		//NaN(Not a Number)
console.log(foo.full);			//undefined
console.log(name);				//undefined
```

접근하려는 프로퍼티가 표현식이거나 예약어일 때에는 대괄호 표기법만을 사용해야 한다.

### for in 객체 프로퍼티 출력

```js
var foo = {
    name : 'foo',
    major : 'computer science',
    age : 30
};

var prop;
for(prop in foo){
    console.log(prop, foo[prop]);
}
/*
name foo
major computer science
age 30
*/
```

### 객체 프로퍼티 삭제

```js
delete foo.dickname;
```

프로퍼티를 삭제할 뿐 객체는 삭제되지 않는다.



## 참조 타입 특성

객체의 연산은 실제 값이 아닌 참조값으로 처리된다.

###동일한 객체를 참조하는 objA objB

```js
var ObjA = {
    val : 40
};
var objB = objA;

console.log(obaA.val);	// 40
console.log(objB.var);	// 40

onjB.var = 50;
console.log(objA.val); 	//50 objB.val도 바뀐다
console.log(objB.val);	//50 
```

### 객체 비교

```js
var a = 100;
var b = 100;

var objA = { value : 100 };
var objB = { value : 100 };
var objC = objB;

a == b 			//true	기본 타입은 값을 비교한다
objA == objB	//false	 값은 같지만 참조가 다르다
objB == objC	//true   같은 참조
```

## 참조에 의한 함수 호출 방식

함수 호출 방식에서

* 기본 타입은 **값에 의한 호출(Call by value)**
* 객체와 같은 참조 타입은 **참조에 의한 호출(Call by reference)**

```js
var a = 'initial';
var objA = { value : 'initial' };

function changeArg(num, obj){
    num = 'changed';
    obj.value = 'changed';
    
    console.log(num);
    console.log(obj);
}
change Arg(a, objA);	//changed { value : changed}

console.log(a);		//initial
console.log(objA);	//{ value: changed}
```

## 프로토타입

js의 모든 **자신의 보무 역할을 하는 객체와 연결되어 있다.** OOP의 상속과 같이 부모 객체의 프로퍼티를 쓸 수 있다.

이러한 부모 객체를 **프로토타입 객체** 라고 한다.

```js
var foo = {
    name: 'foo',
    age: 30
};

console.log(foo.toString());
console.dir(foo);			//객체 상세 정보 가능
```

![console.dir](.\javascript_image\prototype_log.PNG)

## 배열

배열은 js객체의 특별한 형태이다

### 배열 리터럴

배열 리터럴은 **대괄호([ ])를 사용한다** 

```js
//배열 리터럴으 통한 5개 원소를 가진 배열 생성
var colorArr = ['orange', 'yello', 'blue', 'green', red];
console.log(colorArr[0]);
```

객체에서는 프로퍼티 이름과 프로퍼티 값이 필요하지만 객체에서는 **프로퍼티 이름**만이 필요하다.

접근은 배열 내의 **위치 인덱스값**을 넣어서 접근한다.

### 배열의 요소 생성

```js
var emptyArr =[];	//빈 배열
//배열 요소 동적 생성
emptyArr[0] = 100;
emptyArr[3] = 'eight';
emptyArr[7] = true;
console.log(emptyArr);	//[100, empty × 2, "eight", empty × 3, true]
console.log(emptyArr.length);	//8
```

### 배열의 length 프로퍼티, 명시적 변경

```js
var arr = [0, 1, 2];
console.log(arr.length);	//3

arr.length = 5;	//명시적 변경
console.log(arr);	//[0, 1, 2, empty × 2]

arr.length = 2;
console.log(arr);	//[0, 1]
console.log(arr[2]);	//undefined
```

## 배열과 객체의 차이

```js
//colorArray 배열
var colorsArray = ['orange', 'yellow', 'green'];
colorsArray[0];	//"orange"
colorsArray[1];	//"yellow"
colorsArray[2];	//"green"

//colorsObj 객체
var colorsObj = {
    '0' : 'orange',
    '1' : 'yellow',
    '2' : 'green'
};
colorsObj[0];	//"orange"
colorsObj[1];	//"yellow"
colorsObj[2];	//"green"

//typeof 연산자 비교
typeof colorsArray;	//object
typeof colorsObj;	//object

//배열 표준 메서드
colorsArray.push('red');	//["orange", "yello", "green", "red"]
colorsObj.push('red');		//Uncaught TypeError: colorsObj.push is not a function
```

`console.dir(colorsArray);` `console.dir(colorsObj);`에 의해서 

> Object.prototype -> 객체
>
> Object.prototype -> Array.prototype -> 배열

### Array() 생성자 함수

```js
var foo = new Array(3);	//length : 3 [empty × 3]
var bar = new Array(1, 2, 3);	//length : 3 [1, 2, 3]
```

* 인자 1개 : 호출된 인자를 length 로 갖는 빈 배열 생성
* 그 외의 경우 : 호출된 인자를 요소로 갖는 배열 생성

### 유사 배열 객체

일반 객체에 length 라는 프로퍼티가 있으면 **유사배열객체**가 된다.

```js
var arr = ['bar'];
var obj = {
    name : 'foo',
    length : 1
};

obj.push('baz');	//error
Array.prototype.push.apply(obj, ['baz']);
console.log(obj);	//{1: "baz", name: "foo", length: 2}
```

### 기본 타입과 표준 메서드

```js
//숫자 메서드 호출
var num = 0.5;
console.log(num.toExponential(1));	//5.0e-1

//문자열 메서드 호출
console.log("test".charAt(2));	//'s'
```

기본 타입을 위해 정의된 표준 메서드들은 **객체처럼 호출할 수 있다**

## 연산자

### + 연산자

* 숫자 : 더하기
* 나머지 : 문자열 연결

###==(동등) 연산자 ===(일치) 연산자

```js
1 == '1'	//true	같은 타입으로 변환해서 비교, 에러 가능성 있으므로 비추천
1 === '1'	//false
```

### !! 연산자

!! : 피연산자를 불린값으로 변환한다.

```js
!!0		//false
!!1		//true
!!'string'	//true
!!'false'	//false
!!true		//true
!!false		//false
!!null		//true
!!undefined	//true
!!{}		//true
!![1,2,3]	//true
```

객체는 값이 비어있는 빈 객체라도 true로 반환한다.

#함수와 프로토타입 체이닝

## 함수 정의

###함수 리터럴

```js
function add(x,y){
    return x+y;
}
```

* function : 함수 리터럴은 function키워드로 시작한다
* 함수명 :  함수 명은 선택사항이다. 함수명이 없는 함수를 익명 함수라 한다.
* 매개변수 리스트 : 타입을 기록하지 않는다.
* 함수 몸체

###함수 선언문

```js
함수 리터럴과 같다. 단 반드시 함수명이 정의되어야 한다. 닫는 중괄호 뒤에 세미콜론을 붙이지 않는다.
```

###함수 표현식

```js
var add = function(x,y){	//함수 이름이 없으므로 익명함수이다.
    return x + y;		    //add는 함수 이름이 아니라 함수 변수이다.
};	//세미콜론 삽입

var plus = add;

add(3,4);	//7
plus(1,2);	//3
```

add와 plus는 같은 함수를 참조하는 함수 변수이다.



```js
var add = function sum(X,y){
    return x+y;
};	//세미콜론 삽입
add(3,4);	//7
sum(3,4);	//Uncaught ReferenceError: x is not defined
```

함수 표현식에서 사용된 함수 이름이 외부 코드에서 사용 불가능하다.

함수 표현식에서 함수 이름은 함수 내부에서 재귀적으로 호출하거나 디버거 등에서 구분할 때 사용된다.

```js
var factorialVar = function factorial(n){
    if(n<=1){
        return 1;
    }
    return n * factorial(n-1);
};	//세미콜론 삽입
```

### Function() 생성자 함수를 통한 함수 생성하기

> new Function(arg1, arg2, ..., argN, functionBody)
>
> * arg1, arg2, ....,argB : 함수의 매개변수
> * functionBody : 함수가 호출될 때 실행될 코드를 포함한 문자열

```js
var add = new Function('x','y','return x + y');
add(3,4); //7
```

### 함수 호이스팅

```js
add(2,3);	//5	함수 호이스팅

//함수 선언문
function add(x,y){
    return x + y;
}

add(3,4);	//7
```
함수 호이스팅 적용
```js
add(2,3);	//uncaught type error

//함수 표현식
var add = function(x,y){
    return x + y;
};

add(3,4);	//7
```

함수 호이스팅 일어나지 않는다

## 함수 객체

###js에서는 함수도 객체다

```js
function add(x,y){
    return x+y;
}
add.result = add(3,2);
add.status = "ok";

console.log(add.result);	//5
console.log(add.status);	//'ok'
```

함수는 객체와 같이

* 리터럴에 의해 생성
* 변수나 배열의 요소, 객체의 프로퍼티 등에 할당 가능
* 함수의 인자로 전달 가능
* 함수의 리턴값으로 리턴 가능
* 동적으로 프로퍼티를 생성 및 할당 가능

이와 같은 특징이 있으므로 js에서 함수를 **일급 객체** 라고 부른다.

####변수나 프로퍼티 값으로 할당

```js
var foo = 100;
var bar = function(){return 100;};
console.log(bar());	//100

var obj = {};
obj.baz = function(){return 200;};
console.log(obj.baz);	//ƒ (){return 200;}
console.log(obj.baz());	//200
```

#### 함수 인자로 전달

```js
var foo = function(func){
    func();
};

foo(function(){console.log("Function can be used as the argument.");});
```

#### 리턴 값으로 활용

```js
var foo = function(){
    return function(){
        console.log('this function is the return value.');
    };
};

var bar = foo();
bar();		//'this function is the return value.'
```

### 함수 객체의 기본 프로퍼티

![f_property](.\javascript_image\f_property.png)

* argument
* caller
* length : 인자의 개수
* name
* prototype :  프로토타입 객체를 가진다. 이 프로토타입 객체는 constructor 프로퍼티로 자신과 연결된 함수를 가리킨다.*순환구조이다. prototype < - > constructor

## 함수의 다양한 형태

### 콜백 함수

익명 함수의 대표적인 용도

어떤 이벤트가 발생했거나 특정 시점에 도달했을 때 시스템에서 호출되는 함수.

```html
<script>
    window.onload = function(){
        alert('This is the callback function.');
    }
</script>
```

### 즉시 실행 함수

```js
(function (name){
    console.log('This is hte immediate function ->' + name);
})('foo');
//This is hte immediate function ->foo
```

괄호로 함수 리터럴을 둘러싼다.

그 후 `('foo')`로 함수를 호출하였다.

즉시 실행 함수는 함수를 다시 호출할 수 없다. 따라서 **최초 한 번의 실행만을 필요로 하는 초기화 코드 부분**에 사용 할 수 있다.

### 내부함수

```js
//parent() 함수 정의
function parent(){
    var a = 100;
    var b = 200;
    //child() 정의
    function child(){
        var b = 300;
        console.log(a);	
        console.log(b);	
    }
    child();
}
parent();
child();
//100
//300
//Uncaught ReferenceError: child is not defined
```

내부 함수는 자신을 둘러싼 외부 함수의 변수에 접근 가능하다

스코프 체이닝

### 함수를 리턴하는 함수

```js
var self = function(){
    console.log('a');
    return function(){
        console.log('b');
    }
}
self = self(); 	//a
self();	//b
```

## 함수 호출과 this

자바스크립트는 타입이 엄격하지  않아서 함수 호출 또한 자유롭다.

### arguments 객체

```js
function runc(arg1, arg2){
    console.log(arg1, arg2);
}
func();		//undefined undefined
func(1);	//1 undefined
func(1,2);	//1 2
func(1,2,3);//1 2
```

argument객ㅊ는 유사배열객체이다

* 함수를 호출할 때 넘겨진 인자
* length 프로퍼티
* callee 프로퍼티

이 특성으로 매개변수 개수가 정확하게 정해지지 않은 함수를 구현하거나, 전달된 인자의 개수에 따라 서로 다른 처리를 해줘야 하는 함수를 개발하는데 쓸 수 있다.

```js
function sum(){
    var result = 0;
    for(var i = 0; i < arguments.length; i++){
        result += arguments[i];
    }
    return result;
}

console.log(sum(1,2,3));	//6
console.log(sum(1,2,3,4,5,6)); //21
```

### 호출 패턴과 this 바인딩

this는 함수가 호출되는 방식(호출 패턴)에 따라 다른 객체를 참조한다.

#### 객체의 메서드 호출할 때 this 바인딩

```js
var myObject = {
    name: 'foo',
    sayName: function(){
        console.log(this.name);	//this!
    }
};

var otherObject = {
    name: 'bar'
};

otherObject.sayName = myObject.sayName;

myObject.sayName();
otherObject.sayName();
```

#### 함수를 호출할 때 this 바인딩

js에서 함수를 호출하면, 해당 함수 내부 코드에서 사용된 **this는 전역객체에** 바인딩된다.



js의 모든 전역 변수는 전역 객체의 프로퍼티들이다.

```js
var foo = 'I`m test';

console.log(foo);
console.log(window.foo);
```

```js
var test = 'This is test';
console.log(window.test);

var sayFoo = function(){
    console.log(this.test);
}

sayFoo();
```

내부 함수를 호출 했을 떄에도 전역 객체에 바인딩된다.생성자를 호출할 떄 this 바인딩

생성자 함수 : 기존 함수에 new 키워드를 붙이면 생성자 함수로 작동한다.

생성자 함수의 this는 생성되는 빈객체에 바인딩된다.

```js
var Person = functino(name){
    this.name = name;	//동적 프로퍼티 생성
};

var foo = new Person('foo');
console.log(foo.name);	//foo
```

생성자 함수를 이용해 객첼를 만들경우 prototype 프로토타입은 생성자 함수를 가리킨다.

#### call과 apply 메서드를 이용한 명시적인 this 바인딩

> function.apply(thisArg,argArray)

```js
function Person(name, age, gender){
    this.name = name;
    this.age = age;
    this.gender = gender;
}

var foo = {};

Person.apply(foo,['foo', 30, 'man']);
//Person.call(foo,'foo',30,'man');
console.dir(foo);
```

apply()를 사용한 arguments객체의 배열 표준 메서드 slice()활용

```js
function myFunction(){
  console.dir(arguments);

	var args = Array.prototype.slice.apply(arguments); //slice에 인자는 전달하지 않음
	console.dir(args);
}
myFunction(1,2,3);
```



### 함수 리턴

일반 함수나 메서드는 리턴값을 지정하지 않을 경우 undefined값이 리턴된다.

```js
var noReturnFunc = function(){
    console.log("This function has no return statement.");
};

var result = noReturnRunc();	//This function has no return statement.
console.log(result);	//undefined
```

생상자 함수에서 리턴값을 지정하지 않을 경우 생성된 객체가 리턴된다.

생성자 함수에서 명시적으로 기본타입(불린 숫자 문자열)을 리턴할 경우 이러한 리턴값을 무시하고 객체를 리턴한다.

```js
function Person(name, age, gender){
    this.name = name;
    this.age = age;
    this.gender = gender;
    
    return 100;
}
var foo = new Person('foo',30,'man');
console.log(foo); //Person {name: "foo", age: 30, gender: "man"}
```

## 프로토타입 체이닝

js에서는 특정 객체의 프로퍼티나 메서드에 접근하려고 할 때, 접근하려는 프로퍼티 또는 메서드가 없다면 **[[Prototype]]링크**를 따라 자신의 부모 역할을 하는 프로토타입 객체를 검색하는 것

### 기본 데이터 타입 확장

```JS
String.prototype.testMethod = function(){
    console.log('This is the String.prototype.testMethod');
};

var str = "test is test";
str.testMethod();

console.dir(String.prototype);
```



# 실행 컨텍스트와 클로저

실행 컨텍스트의 개념, 활성객체(Activation object), 변수객체(Variable Object), 스코프 체인(Scope chain), 클로저(Closure)

## 컨텍스트 & 스코프

컨텍스트 : 함수가 **실행**될 때 만들어진다.

스코프 : 함수가 **생성** 될 때 만들어진다

##실행 컨텍스트 개념

실행 컨텍스트 : 실행 가능한 코드를 형상화하고 구분하는 추상적인 개념

실행 가능한 자바스크립트 코드 블록이 실행되는 환경

실행 컨텍스트가 형성되는 경우

* 전역 코드
* eval()
* 함수 안의 코드

## 실행 컨텍스트 생성 과정

1. 활성 객체 생성
   2. arguments 객체 생성
   3. 스코프 정보 생성
   4. 변수 생성
   5. this 바인딩
2. 코드 실행



### 함수 호이스팅

```js
foo();
bar();

var foo = function(){
    console.log("foo and x = " + x);
};
function bar(){
    console.log("bar and x = " + x);
}
var x = 1;
```

위는 아래와 같다

```js
var foo;

function bar(){
    console.log("bar and x = " + x);
}

var  x;

foo();	//type error
bar();
foo=function(){
    console.log("foo and x = " + x);
};

x = 1;
```



## 스코프 체인

### 함수를 호출한 경우 생성되는 실행 컨텍스트의 스코프 체인

```js
var var1 = 1;
var var2 = 2;
function func(){
    var var1 = 10;
    var var2 = 20;
    console.log(var1);	//10
    console.log(var2);	//20
}
func();
console.log(var1);	//1
console.log(var2);	//2	
```

```js
var value = "value1";

function printFunc(){
    var value = "value2";
    
    function printValue(){
        return value;
    }
    
    console.log(printValue());
}

printFunc();
```

```js
var value = "value1";

function printValue(){
    return value;
}
function printFunc(func){
    var value = "value2";
    console.log(func());
}
printFunc(printValue);
```



## 클로저

### 클로저 개념

```js
function outerFunc(){
    var x = 10;
    var innerFunc = function(){console.log(x);}
    return innerFunc;
}

var inner = outerFunc();
inner();	//10
```

innerFunc()는 outerFunc()가 끝난 후 실행되었다. 이와 같이 **이미 생명 주기가 끝난 함수의 변수를 참조하는 함수를 클로저라고 한다** 

```js
function outerFunc(){
    var x = 1;	//자유변수
    return function(){
       	/* x와 arguments를 활용한 로직 */
    }
}
var new_FUNC = outerFunc();
/* outerFunc 실행 컨텍스트가 끝났다 */
new_func();
```

### 클로저의 활용

#### 특정 함수에 사용자가 정의한 객체의 메서드 연결하기

```js
function HelloFunc(func){
    this.greeting = "hello";
}

HelloFunc.prototype.call = function(func){
    func ? func(this.greetinig) : this.func(this.greeting);
}

var userFunc = function(greeting){
    console.log(greeting);
}

var objHello = new HelloFunc();
objHello.func = userFunc;
objHello.call();
```



# 객체지향 프로그래밍

## 클래스, 생성자, 메서드

```js
function Person(arg){
    this.name = arg;
    
    this.getName = function(){
        return this.name;
    }
    this.setName = function(){
        return this.value;
    }
}
var me = newe Person("zzoon");
console.log(me.getName());	//zzoon

me.setName("iamhjoo");
console.log(me.getName());	//imhjoo
```

위와 같이 생성할 경우 생성된 객체에 모두 메소드가 들어가게 된다. 이는 메모리 낭비를 불러일으킨다.  따라서 위와같은 방식은 바람직하지 않다.



Person 함수 객체의 prototype 프로퍼티에 함수를 정의한다.

```js
function Person(arg){
    this.name = arg;
}
Person.prototype.getName = function(){
    return this.name;
}
Person.prototype.setName = function(){
    this.name = value;
}
var me = new Person("me");
var you = new Person("you");
console.log(me.getName());
console.log(you.getName());
```



메소드를 정의하는 방법

> ```js
> Function.prototype.method = function(name, func){
>     if(!this.prototype[name]){
>     	this.prototype[name] = func;    
>     }
> }
> ```

```js
Function.prototype.method = function(name, func){
    this.prototype[name] = func;
}

function Person(arg){
    this.name = arg;
}
Person.method("setName", function(value){
	this.name=value;              
});
Person.method("getName", function(){
    return this.name;
});
var me = new Person("me");
var you = new Person("you");
console.log(me.getName());
console.log(you.getName());
```

## 상속

### 프로토타입을 이용한 상속

```js
function create_object(o){
    function F(){}
    F.prototype = o;
    return new F();
}
```
person을 상속하는 student
```js
var person = {
    name : "zzoon",
    getName : function(){
        return this.name;
    },
    setName : function(arg){
        this.name = arg;
    }
};
function create_object(o){
    function F(){};
    F.prototype = o;
    return new F();
}

var student = create_object(person);

student.setName("me");
console.log(student.getName());
```
자식 객체에 메소드 추가
```js
var person = {
    name : "zzoon",
    getName : function(){
        return this.name;
    },
    setName : function(arg){
        this.name = arg;
    }
};

function create_object(o){
    function F(){};
    F.prototype = o;
    return new F();
}

function extend(obj, prop){
    if(!prop) { prop = obj; obj = this;}
    for(var i in prop ) obj[i] = prop[i];
    return obj;
};

var student = create_object(person);
var added = {
    setAge : function(age){
        this.age = age;
    },
    getAge : function(){
        return this.age;
    }
};

extend(student, added);

student.setAge(25);
console.log(student.getAge());
```



### 클래스 기반의 상속

```js
function Person(arg){
    this.name = arg;
}
Person.prototype.setName = function(value){
    this.name = value;
};
Person.prototype.getName = function(){
    return this.name;
};
function Student(arg){
}
var you = new Person("iamhjoo");
Student.prototype = you;

var me = new Student("zzoon");	//이 코드에서는 이 부분을 반영하지 않는다.
me.setName("zzoon");
console.log(me.getName());
```



중개자가 있는 상속

```js
function Person(arg){
    this.name = arg;
}
Function.prototype.method = function(name, func){
    this.prototype[name] = func;
}
Person.method("setName", function(value){
    this.name = value;
});
Person.method("getName", function(){
    return this.name;
});
function Student(arg){
}

function F(){};	//중개자
F.prototype = Person.prototype;
Student.prototype = new F();
Student.prototype.constructor = Student;
Student.super = Person.prototype;

var me = new Student();
me.setName("zzoon");
console.log(me.getName());     
                                   
```

빈 함수 F()를 중개자로 사용한다. 이 빈 함수에 메소드를 추가할 수 있다.

최적화한 패턴

> ```js
> var inherit = function(Parent, Child){
>     var F = function(){};
>     return function(Parent, Child){
>         F.prototype = Parent.prototype;
>         Child.prototype = new F();
>         Child.prototype.constructor = Child;
>         Child.super = Parent.prototype;
>     };
> }();
> ```

위와 같은 방식 외에도 여러 상속의 구현이 있다.



## 캡슐화

정보 은닉, 클로저를 활용한다.

```js
var Person = function(arg){
    var name = arg ? arg : "zzoon";
    this.getName = function(){
        return name;
    }
    this.setName = function(arg){
        this.name = arg;
    }
};

var me = new Person();
console.log(me.getName());
me.setName("iamhjoo");
console.log(me.getName());
console.log(me.name);		//undefined
```

개선

```js
var Person = function(arg){
    var name = arg ? arg : "zzoon";
    
    return{
        getName : function(){
            return name;
        },
        setName : function(arg){
            name = arg;
        }
    };
}
var me = Person();
console.log(me.getName())
```

































