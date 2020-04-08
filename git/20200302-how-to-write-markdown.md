###### 최초 작성일: 2020. 03. 02.

# ★ 마크다운 사용법 ★

## 1. 마크다운이란?

마크다운(Markdown)은 마크업 언어의 일종으로, 존 그루버(John Gruber)와 아론 스워츠(Aaron Swartz)가 만들었다.   
온갖 태그로 범벅된 HTML 문서 등과 달리, 읽기도 쓰기도 쉬운 문서 양식을 지향한다.   
확장자는 .md 또는 .markdown을 쓰지만, 전자가 압도적으로 많이 쓰인다.

***

## 2. 마크다운 장&단점

### 2-1. 장점
> 1. 간결하다.
> 2. 별도의 도구 없이 작성 가능하다.
> 3. 다양한 형태로 변환이 가능하다.
> 4. 텍스트(Text)로 저장되기 때문에 용량이 적어 보관이 용이하다.
> 5. 텍스트 파일이기 때문에 버전 관리 시스템을 이용하여 변경 이력을 관리 할 수 있다.
> 6. 지원하는 프로그램과 플랫폼이 다양하다.

### 2-2. 단점
> 1. 표준이 없고, 도구에 따라서 변환 방식이나 생성물이 다르다.
> 2. 모든 HTML 마크업을 대신하지 못한다.

***

## 3. 마크다운 사용법(문법)
## 3-1. 제목(Header): H1~H6까지 지원
### 3-1-1. 사용법 및 결과
# # This is a H1 => 큰 제목에 사용
## ## This is a H1 => 부 제목에 사용
### ### This is a H1
#### #### This is a H1
##### ##### This is a H1
###### ###### This is a H1

***
## 3-2. BlockQuote

이메일에서 사용하는 ```>``` 블럭 인용 문자를 사용한다.
### 3-2-1. 사용법
```
> 첫 번째 Block Quote입니다.
>> 두 번째 Block Quote입니다.
>>> 세 번째 Block Quote입니다.
```
### 3-2-2. 결과
> 첫 번째 Block Quote입니다.
>> 두 번째 Block Quote입니다.
>>> 세 번째 Block Quote입니다.

### 3-2-3. 응용법
> 첫 번째 Block Quote입니다.
> ### 여기 안에서 제목을 사용 할 수 있습니다.
> - 글머리 기호도 사용 가능!!!
>> ###### 정리하면 이 안에서 다른 마크다운 요소를 사용할 수 있습니다.

***
## 3-3. 목록
* 순서 있는 목록(번호)
### 3-3-1. 사용법
```
1. 첫 번째
2. 두 번째
3. 세 번째
```

### 3-3-2. 결과
1. 첫 번째
2. 두 번째
3. 세 번째

### 3-3-3. 응용법
###### 하단 번호로 사용 할 경우 띄여쓰기 3번 정도 눌러야 하는 것 같다.
1. 첫 번째
    1. 첫 번째
        1. 첫 번째
    2. 두 번째
2. 두 번째
3. 세 번째
    1. 첫 번째
    2. 두 번째

* 순서 없는 목록(글머리 기호 ```*```, ```+```, ```-``` 사용)
### 3-3-1. 사용법
```
* 1단계
   * 2단계
      * 3단계
      
+ 1단계
   + 2단계
      + 3단계

- 1단계
   - 2단계
      - 3단계
```

### 3-3-2. 결과
* 1단계
   * 2단계
      * 3단계
      
+ 1단계
   + 2단계
      + 3단계

- 1단계
   - 2단계
      - 3단계
      
### 3-3-3. 응용법
```
+ 1단계
   - 2단계
   - 2단계
      * 3단계
```
+ 1단계
   - 2단계
   - 2단계
      * 3단계
      

***
## 3-4. 코드
4개 이상의 공백이 필요하며 변환되기 시작하여 들여쓰지 않은 행을 만날때까지 변환이 계속된다.

### 3-4-1. 사용법
```
코드 문법 테스트 중입니다.

    printf("Hello World!\n");

테스트 종료입니다.
```

### 3-4-2. 결과
코드 문법 테스트 중입니다.

    printf("Hello World!\n");
    
테스트 종료입니다.

### 3-4-3. 오류
> ###### 한 줄 개행을 안하면 코드 적용이 안 될 수 있습니다.
```
코드 문법 테스트 중입니다.
    printf("Hello World!\n");
테스트 종료입니다.
```
코드 문법 테스트 중입니다.
    printf("Hello World!\n");
테스트 종료입니다.


***
## 3-5. 코드블럭
### 3-5-1. ```<pre><code>{code}</code></pre>``` 이용 방식
#### 3-5-1-1. 사용법
```
<pre>
<code>
let individualScroes = [75, 42, 103, 87, 12]
var teamScore = 0
for score in individualScroes {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
</pre>
</code>
```
#### 3-5-1-2. 결과
<pre>
<code>
let individualScroes = [75, 42, 103, 87, 12]
var teamScore = 0
for score in individualScroes {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
</pre>
</code>


### 3-5-2. 코드 블럭 코드 이용 방식
#### 3-5-2-1. 사용법
<pre>
<code>
```
let individualScroes = [75, 42, 103, 87, 12]
var teamScore = 0
for score in individualScroes {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
```
</pre>
</code>

#### 3-5-2-2. 
```
let individualScroes = [75, 42, 103, 87, 12]
var teamScore = 0
for score in individualScroes {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
```

***
## 3.6 수평선
주로 내용이 바뀌거나 문단 구분이 필요할 때 사용한다.

### 3.6.1 사용법
```
* * *
***
*****
- - -
---
---------------------------
```

### 3.6.2 결과
* * *
***
*****
- - -
---
---------------------------


***
## 3.7 링크
### 3.7.1 사용법(참조링크)
```
* 기본 구조

[링크 이름][링크 ID]

[링크 ID]: URL "URL 제목(옵션)"


* 실제 사용 구조
Link: [Google][googleID]

[googleID]: https://www.google.com/ "Google Link"
```

### 3.7.2 결과(참조링크)
> Link: [Google][googleID]
> 
> [googleID]: https://www.google.com/ "Google Link"


### 3.7.3 사용법(외부링크)
```
* 기본 구조

[링크 이름](URL, "URL 제목(옵션)"

* 실제 사용 구조
Link: [Google](https://www.google.com/, "Google Link")
```

### 3.7.4 결과(외부링크)
> Link: [Google](https://www.google.com/, "Google Link")

### 3.7.5 사용법(자동연결)
```
* 기본 구조
<URL>

* 실제 사용 구조
- Google: <https://www.google.com/>
- Email: <jiwo.oni1000@gmail.com>
```

### 3.7.6 결과(자동연결)
- Google: <https://www.google.com/>
- Email: <jiwo.oni1000@gmail.com>

***
## 3.8 강조
### 3.8.1 사용법
```
*기울임체*
_기울임체_
**볼드체**
__볼드체__
~~취소글자~~
```

### 3.8.2 결과
> *기울임체1*   
> _기울임체2_   
> **볼드체3**   
> __볼드체4__   
> ~~취소글자5~~   

### 3.8.3 응용
> 안녕하세요. 나는 **천지운** 입니다. 나이는 ~~29살(2020년 기준)~~ 입니다.


## 3.9 이미지
### 3.9.1 사용법(기본)
```
![Alt text](/cheonji/test.jpg)
![Alt text](/cheonji/test.jpg "testImg")
```

### 3.9.2 사용법(HTML 크기 조절 가능)
```
<img src="/cheonji/test.jpg" width="200px" height="150px" title="px(픽셀) 크기 설정" alt="Smile"></img><br/>
<img src="/cheonji/test.jpg" width="50%" height="40%" title="px(픽셀) 크기 설정" alt="Smile"></img>
```

### 3.9.3 결과
```
![markdown_logo](https://raw.github.com/dcurtis/markdown-mark/master/png/208x128.png)
```

![markdown_logo](https://raw.github.com/dcurtis/markdown-mark/master/png/208x128.png)

```
<img src="https://raw.github.com/dcurtis/markdown-mark/master/png/208x128.png" width="200px" height="150px" title="px(픽셀) 크기 설정" alt="Smile"></img><br/>
```
<img src="https://raw.github.com/dcurtis/markdown-mark/master/png/208x128.png" width="100px" height="50px" title="px(픽셀) 크기 설정" alt="Markdown"></img><br/>

***
# 4. 정리
야간 대학 다니면서 Markdown을 공부 할 기회가 있었는데 1주차 만에 휘리릭 지나가 버려서,   
그냥 따라 쳐보기만 하고 이렇게 직접 정리 해보진 못했던 것 같다.   
이번 수업을 앞두고 공부할 겸, 이력서도 Github로 써볼겸~ 해서 이렇게 정리를 해보았다.   
추가로 알아내는 것들이 있다면 여기에 덧붙여야겠다.

> 참고문서   
> [마크다운 사용법](https://gist.github.com/ihoneymon/652be052a0727ad59601)


***
***
## 추가(2020.03.02)
### ㅇ 코드를 입력 할 때 특정 언어를 명시해주면 문법에 대한 색이 적용된다.
#### 사용법
<pre>
<code>
``` swift
let individualScroes = [75, 42, 103, 87, 12]
var teamScore = 0
for score in individualScroes {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
```
</code>
</pre>

#### 결과
``` swift
let individualScroes = [75, 42, 103, 87, 12]
var teamScore = 0
for score in individualScroes {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
```

### ㅇ 표 만들기
#### 1. 표의 구조(Table Structure)
##### 사용법
```
| First Header  | Second Header | Third Header         |
| :------------ | :-----------: | -------------------: |
| First row     | Data          | Very long data entry |
| Second row    | **Cell**      | *Cell*               |
| Third row     | Cell that spans across two columns  ||
```

##### 결과
| First Header  | Second Header | Third Header         |
| :------------ | :-----------: | -------------------: |
| First row     | Data          | Very long data entry |
| Second row    | **Cell**      | *Cell*               |
| Third row     | Cell that spans across two columns  ||

#### 2. 표의 정렬(Text Alignment)
표를 정렬하기 위해서는 ```:```를 정렬할 위치에 넣으면 된다.
##### 사용법
```
| Header One | Header Two | Header Three | Header Four |
| ---------- | :--------- | :----------: | ----------: |
| Default    | Left       | Center       | Right       |
```

##### 결과
| Header One | Header Two | Header Three | Header Four |
| ---------- | :--------- | :----------: | ----------: |
| Default    | Left       | Center       | Right       |
