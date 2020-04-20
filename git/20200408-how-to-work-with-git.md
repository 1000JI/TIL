
## 2020년 04월 08일(수)


### Git 특강(Shell, vim Command && git) 최우영 강사님
[Git 입문 - 버전관리 사이트](https://backlog.com/git-tutorial/kr/)
[SICP-Swift/1.1](https://github.com/godrm/SICP-Swift)


#### 자료구조 알고리즘 공부
  - CODE 코드```(하드웨어와 소프트웨어에 숨어 있는 언어)```
  - 소프트 스킬```(평범한 개발자의 비범한 인생 전략 71가지)```
  - 윤성우의 열혈 자료구조
  
***

#### Linux
  - 리누스 토발즈가 작성한 커널 혹은 GNU 프로젝트의 라이브러리와 도구가 포함 된 운영체제
  - Redhat, Debian, Ubuntu, Android 등 다양한 배포판이 존재
  
#### Shell
  - 운영체제의 커널과 사용자를 이어주는 소프트웨어
  - bash(Bourne Again Shell): 유닉스 쉘으로, 다양한 운영체제에서 기본 쉘로 채택
  - zsh: Paul Falstad가 작성한 유닉스 쉘로, ```sh``` 확장형 쉘

#### Shell 명령어
  - rename이 없고 move를 통해 파일 이름을 바꿀 수 있다.
    * mv readme.txt unreadme.md
  - '*'는 "모든"이라는 뜻을 가진다.
    * rm server.*
    * 디렉토리 같은 경우는 'rm'를 사용할 경우 또 다른 옵션 필요하다
      + rm -rf bin (-f: 삭제 확인 과정을 거치지 않음, -r: 하위 폴더, 파일들을 모두 지우는 옵션)
  
  - ```open```: 파일 여는 명령어
  - ```/[찾고 싶은 문자열]```: 찾고 싶은 문자 찾을 때 씀
  - d[rwx][rwx][rwx\]: 첫 번째(나), 두 번째(내가 속한 유저 그룹), 세 번째(게스트) [읽기 쓰기 실행]
    * ```chmod 555 [파일명]```
    
***

#### Git(VCS, Version Control System)
  * SCM(Source Code Management, 형상관리)
  * 수정 내용은 **commit** 단위로 관리, 배포 뿐 아니라 원하는 시점으로 **Checkout** 가능
  * 새로운 기능 추가는 **Branch**로 개발하여 편안한 실험이 가능하며, 성공적으로 개발이 완성료되면 **Merge**하여 반영
  * 인터넷이 연결되지 않아도 개발 할 수 있음
  * **잔디 밭 꾸미기**
  * **Git != Github**
  
### 관련 유틸 프로그램
  * git GUI
  * sourcetree -> ㅁ7ㅁ8
  * kraken -> ㅁ7ㅁ8
  * smartGit
  
### Git 구성
  1. workspace(working directory)
  2. index(staging area)
  3. local repository
  4. remote repository
  ![https://www.rlee.ai/assets/apt-git/git_operations.png](https://www.rlee.ai/assets/apt-git/git_operations.png)
  - 출처: https://www.rlee.ai/apt/git
  
      1. ```git add [파일 이름] or [-all] or [-u]``` : 수정 내역들 중 저장하고 싶은 것들을 인덱스(스테이징 공간)에 넣을 때 사용
          - 만약 실수로 넣고 싶지 않은 파일을 인덱스(스테이징 공간)에 넣었다면 ```git reset [파일 이름]```으로 뺄 수 있음
          - [-u]는 Untracted File을 제외한 수정/삭제된 파일만 Stage 영역에 올리고 싶다면..
      2. ```git commit [--amend]``` : 로컬 저장소에 저장되며, 인덱스(스테이징 공간)에서는 빠져나감
          - commit 제목과 내용을 작성 할 수 있는 vim 화면
              + docs: documentations
              + conf: configurations
              + feat: features
              + bugFix: fix bug
          - [--amend]: 새로운 Commit을 생성하지 않고 가장 최근에 작성한 Commit을 수정
      3. ```git push origin master``` : 원격 저장소에 저장 할 수 있음
          - origin : remote repo nickname(git address)
              + git remote add [nickname] [git address] ==> [nickname] == origin
          - master : branch name in remote repo
      4. ```git pull origin master``` : 원격 저장소에서 로컬 저장소로 가져올 수 있음 **수정 전에 하는 것이 좋음**
          - origin : remote repo nickname(git address)
      5. ```git status``` : 워킹 디렉토리와 스테이징 공간의 현재 상태를 출력
      6. ```git diff [--staged]```: 스테이징 공간에 있지 않은 파일들 중 수정된 파일들의 수정 내역을 출력, 초록색 줄은 추가 된 줄을 나타내며, 빨간 줄은 지워진 줄을 나타냄, ```--staged```를 붙일 경우, 스테이징 공간에 있는 파일들 중 수정된 파일들의 수정 내역을 출력
      
### Git 실행 방법
1. Homebrew 설치
  * [설치링크](https://brew.sh/index_ko)
  ```
  git config --global user.name "username"
  git config --global user.email "github email address"
  git config --global core.editor "vim"
  git config --global core.pager "cat"    // 정보를 볼 때 cat으로 볼건지 이런 것들
  git config --list // git config 정보 보기
  ```
  
2. git init

3. git status / git status -uall

4. git remote add origin https://github.com/1000JI/first-repo.git

5. git remote : origin이 잘 떠야함

> 단위별 커밋이 중요함 [키체인 문제 해결 사이트](https://recoveryman.tistory.com/392)

6. 내용 수정 후 git add [수정한 파일명]

7. git commit -> vim 화면에서 head, body 내용 작성
  
8. git push -u origin master (첫번째)
   - 키체인으로 저장되었고, git push origin master로 해도 상관없음

9. push 완료!!!!
    
.gitignore => Swift로 지정하면 이외의 파일들을 걸러주는 역할
.licence => MIT: 오픈소스로 뭘하든 상관 없음, Apache: 약간의 저작권료가 필요함, GNU: GPL만 써야함 여기에 MIT을 가져다 못 씀

***

### Git Ignore 및 hexo 설치

1. git Clone [주소]

2. vi .gitignore [gitignore.io](gitignore.io)를 통해 "swift", "macos", "xcode"를 입력 -> ignore 목록을 만들 수 있음

3. swift/{date}{subject}.md, git/{date}{subject}.md : 양식으로 만들어 관리

4. https://github.com/1000JI/1000JI.github.io : 내 io 메인 페이지
    - [hexo.io](hexo.io)

6. brew install node (node 설치해야함, iTerm)
    1. sudo npm install hexo-cli -g
    2. hexo init myBlog
    3. cd myBlog
    4. npm install
    5. hexo server  : 테스트 할 수 있는 서버 열어주고
    6. hexo new post start-git
    7. vi source/_posts/start-git.md
    8. hexo clean && hexo generate
    9. npm install --save-dev hexo-deployer-git
    10. vi _config.yml
    11. hexo clean && hexo deploy : 실제 서버에 적용 해줌

7. [https://github.com/theme-next/hexo-theme-next](https://github.com/theme-next/hexo-theme-next)
    - git clone https://github.com/theme-next/hexo-theme-next themes/next : themes/next -> 여기에 넣어라~~

8. [https://asciinema.org/a/233626](https://asciinema.org/a/233626) : hexo 시작하는 법
9. [https://youtu.be/i_AjCEVr2As](https://youtu.be/i_AjCEVr2As) : hexo 테마 적용 방법
10 [https://www.holaxprogramming.com/2017/04/16/github-page-and-hexo/](https://www.holaxprogramming.com/2017/04/16/github-page-and-hexo/) : 참고할만한 사이트 hexo 설치 ~ 테마 적용까지

***




# How to work with git

## Contents

1. Git 특강(Shell, vim Command && git) 최우영 강사님
	- Linux
	- Shell 개요
	- Shell 명령어

2. Git(VCS, Version Control System)
	- 관련 유틸 프로그램
	- Git 구성
	- Git 설치, 사용법 등등

## TODO
1. 기존 Repo -> 새 Repo로 이동 작업
2. 오늘 배운 내용 간단하게 정리 필요
