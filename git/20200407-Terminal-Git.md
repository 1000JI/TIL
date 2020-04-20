
## 2020년 04월 07일(화)

[늦은 나이에 개발자를 준비하는 것이 아닌가?](https://www.freecodecamp.org/news/stories-from-300-developers-who-got-their-first-tech-job-in-their-30s-40s-and-50s-64306eb6bb27/)

***

* 커널(Kernel)
  - 프로세서, 프로세스, 하드웨어, 메모리, 파일 시스템, 네트워크 등을 관리
  - 하드웨어를 관리하고 필요한 프로세스에 나눠주는 등 여러 시스템 자원을 제어
  
* Shell
  - 사용자와 운영체제(커널)간에 대화를 가능하게 해주는 중간 역할
    

### Terminal
* Terminal 명령어
  - 목록 조회 (ls), 경로 이동 (cd), 경로 확인(pwd)
  - 디렉토리 생성 (mkdir), 디렉토리 삭제 (rmdir)
  - 파일 생성 (touch), 복사 (cp), 이동 (mv), 삭제 (rm),
  - 에디터 실행 (vi / nano 등등), 파일 내용 출력 (cat), 파일 상단/하단 내용 출력 (head / tail)
  - 명령어 매뉴얼 확인 (man), 입력한 명령어 목록 출력 (history), 다중명령어 실행 (;)
  - 지정한 경로를 Finder 로 열거나 파일 실행 (open)
  - 특정 파일을 찾을 때 (find / locate)
  - 파일 속성 변경 (chmod)
  - 애플리케이션 실행 중지 명령 (kill)
  - 화면 클리어 (clear), 종료 (exit)

* iTerm2 작업환경 구성하기
  - Shell 작업 환경 [구성하기](https://blog.pigno.se/post/184576332493/%EC%99%84%EB%B2%BD%ED%95%9C-mac-%EC%9E%91%EC%97%85%ED%99%98%EA%B2%BD-%EC%84%B8%ED%8C%85%ED%95%98%EA%B8%B0-vim-zsh-iterm)(Zsh + Oh My Zsh 설치)
    + Command + D : Vertical View
    + Command + Shift + D : Horizontal View
    + Command + T를 통해 탭을 생성
    + Command + 숫자로 특정 넘버의 탭으로 스위치
    + Command + W로 탭을 닫을 수 있다


### Git
  - VCS(버전 관리 시스템)
    + 동일 목적의 데이터에 대해 각 시점의 버전을 기록하여 코드의 변화를 관리하는 것
    + 각 변경사항마다 버전 번호를 부여하여 각각의 정보를 따로 기록
    + 현재 코드가 어떤 맥락을 거쳐서 지금 상태가 되었는지 변경사항 추적 소스 코드를 누가 수정했는지 파악
    + 문제가 생겼을 때 이전 버전으로 돌리는 기능 제공
    + 코드 백업 기능 수행
    + 여러 사람이 협업 시, 코드의 동기화 수행 / 코드 충돌과 유실 방지 히스토리만으로 문서화 역할

  - CVCS(중앙 집중식 버전 관리 시스템)
    + CVS / SVN
    + 중앙 서버에 큰 영향을 받음
    
  - DVCS(분산 버전 관리 시스템)
    + **Git** / Mercurial
    + 로컬 저장소와 원격 저장소를 각각 가지는 버전 관리 시스템
    + 중앙 서버에 의존적이지 않음
  
  - Git의 목표
    1. 빠른 속도
    2. 단순한 구조
    3. 비선형적인 개발(수천 개의 동시 다발적인 브랜치)
    4. 완벽한 분산
    5. 리눅스 커널 같은 대형 프로젝트에도 유용할 것(속도나 데이터 크기 면에서)

  - "수정"의 단계 구분
    1. 규칙1: "의미"를 기준으로 사용자가 정하는 것으로 함
    2. 규칙2: 하나의 커밋은 여러개의 파일이 포함 될 수 있으므로 "수정의 의미"를 확장함
    
  - Git != Github
    + Git => Program
    + Github => Service(1일 1커밋, 잔디심는다)

***

1. ~~터미널 기본 명령어 숙지~~
    - http://www.ciokorea.com/news/29239

2. **vimtutor**
    - 최소한 vimtutor Lesson 2 요약까지 따라하기
    - vim 명령어 참고: https://vim.rtorr.com/lang/ko
    
    - 'h': 왼쪽, 'l': 오른쪽, 'j': 아래, 'k': 위
    - 'x': 한 글자 삭제하기, 'i': 글자 삽입하기
    - 'A': 커서가 어디에 있든 끝에서 글자 삽입하기
    - 'd': 지우기
      + 'dw': 커서에서 그 단어의 끝까지 (공백을 포함.)
      + 'de': 커서에서 그 단어의 끝까지 (공백을 포함하지 않음.)
      + 'd$': 커서 있는 곳 부터 끝까지 삭제하기
      + 'dd': 한 줄 지우기
    - '2w': 커서를 단어 두 개 뒤로 옮기기
    - '3e': 커서를 뒤로 세 번째 단어의 끝으로 옮기기
    - '0': 문장 처음으로 돌아가기
    - 'd2w': d [횟수] [대상], 단어 지우고 싶은 갯수 입력하기
    - 'u': 마지막 명령 취소
    - 'U': 줄 전체를 복구 시킴

3. ~~Git 연습 사이트~~
    - LearnGitBranching (https://learngitbranching.js.org)
    - **Git 명령어**
      + commit: git commit
      + branch: git branch [브랜치명]
      + checkout: git checkout [브랜치명]
        * git checkout HEAD~^2~2 == git checkout HEAD~; git checkout HEAD^2; git checkout HEAD~2
        * git checkout -b bugFix : bugFix 브랜치 만들면서 checkout 변경
      + cherry-pick
      + reset: git reset HEAD~1
        * 애초에 커밋하지 않은 것처럼 예전 커밋으로 브랜치를 옮기는 것입니다.
      + revert: git recert HEAD
        * 변경분을 되돌리고, 이 되돌린 내용을 다른 사람들과 공유하기 위해서는, git revert를 써야합니다.
      + rebase: git rebase [브랜치명]
        * 리베이스는 기본적으로 커밋들을 모아서 복사한 뒤, 다른 곳에 떨궈 놓는 것입니다.
        * git rebase side another(another가 HEAD 됨)
      + merge: git merge [브랜치명]
      + tag: git tag [태그명][위치]
        * 태그는 특정 커밋들을 브랜치로 참조하듯이 영구적인 "milestone(이정표)"으로 표시
        * Git 태그는 커밋들이 추가적으로 생성되어도 절대 움직이지 않는다는 것입니다.
      + describe: git describe <ref>
        * 커밋 히스토리에서 앞 뒤로 여러 커밋을 이동하고 나서 커밋 트리에서 방향감각을 다시 찾는데 도움을 줍니다.
        * <tag>_<numCommits>_g<hash>
        * tag는 가장 가까운 부모 태그를 나타냅니다. numCommits은 그 태그가 몇 커밋 멀리있는지를 나타냅니다. <hash>는 묘사하고있는 커밋의 해시를 나타냅니다.
        * git describe bugFix => v1_2_gC6
    
    - HEAD 분리하기
      + HEAD를 분리한다는 것은 HEAD를 브랜치 대신 커밋에 붙이는 것을 의미합니다.
    
    - ```git branch -f master HEAD~3```
      + (강제로) master 브랜치를 HEAD에서 세번 뒤로 옮겼습니다.
    - ```git checkout HEAD~4```
    - ```git cherry-pick <Commit1> <Commit2> <...>```
      + 일련의 커밋들에대한 복사본을 만들겠다는 것을 간단히 줄인 말입니다.
      + git cherry-pick C2 C4
    - ```commit --amend```
      + 명령으로 커밋 내용을 정정합니다
      
    - [인터렉티브 리베이스 대화창]: git rebase -i HEAD~4
      1. 적용할 커밋들의 순서를 UI를 통해 바꿀수 있습니다(여기서는 마우스 드래그앤 드롭으로 가능합니다)
      2. 원하지 않는 커밋들을 뺄 수 있습니다. 이것은 pick을 이용해 지정할 수 있습니다(여기서는 pick토글 버튼을 끄는것으로 가능합니다)
      3. 마지막으로, 커밋을 스쿼시(squash)할 수 있습니다. 불행히도 저희 레벨은 몇개의 논리적 문제들 때문에 지원을 하지 않습니다. 요약하자면 커밋을 합칠 수 있습니다
      
    - **원격 Git**
      1. git clone 
      2. 원격 저장소 이름을 대부분 origin 이라고 지음. git은 우리를 분리된 HEAD 모드로 만들고 새로운 커밋을 추가해도 o/master를 갱신하지 않습니다. 이것은 o/master가 원격 저장소가 갱신될때만 갱신되기 때문입니다.
      3. git fetch: 원격 저장소에서 데이터를 가져오는 방법
          * 원격 저장소에는 있지만 로컬에는 없는 커밋들을 다운로드 받습니다.
          * 우리의 원격 브랜치가 가리키는곳을 업데이트합니다.
          * 그러나, 여러분의 로컬 상태는 전혀 바꾸지 않는습니다.
      4. git pull
          * git fetch; git merge o/master 와 같음
      5. git fakeTeamwork : 기본 행동은 원격 master에 간단히 하나의 커밋을 하는것 입니다.
          * git fakeTeamwork foo 3
      6. git push
      7. **git pull --rebase; git push** == **git pull; git push** ```remote7...??```
      
      ``` push 나중에 필요할 때 고고고 ```
      

4. ~~Zsh + Oh My Zsh  (구글에서 Oh My Zsh 검색)~~
    - Zsh 에 Oh My Zsh 설정 적용
    
***


