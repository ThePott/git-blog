# 대량의 pdf 생성도 빠르게 해낼 수 있어야

## 기존 오답 과제 생성 흐름

- 학생이 제출한 오답 목록을 구글 시트에 입력
- 파이썬으로 복습 안 된 오답 추출
- 쪽, 문제 번호만 적혀 있는 빈 학습지 PDF 생성

### 이 과정에서 개선해야 했던 것

- pdf 생성 속도 줄여야
    - 기존 시스템은 한 학생당 pdf 생성에 10초 소요
    - v2에서는 한 반의 모든 학생의 오답과제를 한 번에 생성할 계획

## 후보 기술 스택

- React PDF(client side): 브라우저 메인 스레드 점유. 30쪽 이상의 pdf 생성 시에는 Web Worker 사용 권장.
- Puppeteer(server side): 브라우저 가상화 도구에 pdf 생성 기능이 딸려있을 뿐. 불필요한 부분이 거대해서 제외.
- Typst(server side): LaTex보다 빠르고 문법이 쉬운 문서 조판 언어.

## 문제의 본질

- pdf를 생성하는 것
    - pdf는 브라우저와 무관하다.

### 해결

- request -> create typst template -> compile to pdf -> response
- npm install로 해결되지 않는 typst compiler, font를 설치하기 위한 빌드 스크립트(bash) 작성

## 성과

- 8쪽 생성 시간 4.7% 단축
- 80쪽 생성 시간 30.7% 단축
- 800쪽 생성 시간 61.3% 단축
- PDF 생성이 브라우저 메인 스레드를 점유하지 않아 사용자 조작에 반응
