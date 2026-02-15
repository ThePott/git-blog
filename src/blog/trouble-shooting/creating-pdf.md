# PDF 생성하기

- 발생 시각: 2026-02-13
- 문제: railway에서는 ssh가 안 되어 typst 컴파일러 설치를 어떻게 해야할지 모르겠음
- 해결 시각:

## 배경

- 오답 과제를 pdf로 만들어서 출력할 수 있게 해야 함
- 기존 접근법: react-pdf/renderer를 이용해서 react component -> pdf -> blob -> open in new tab

- 클라이언트 사이드 pdf 생성은 자원을 엄청 잡아먹는다
- 문제점: 공식 문서에서 30 페이지 이상을 만들려면 web worker를 이용해야 한다 함
- 하지만 내가 생성할 pdf는 복습할 문제들의 좌표만 적어두는 것으로 백지에 문제 이름, 쪽 번호 등 몇몇 텍스트만 적으면 되는
  간단한 형태
- 무엇보다 pdf 생성이 브라우저에 종속되어야 하는 작업이 아님 -> 굳이 클라이언트 사이드에서??
- client 오답 과제 생성 요청 -> api는 db에서 관련 데이터 쿼리 -> typst 파일 작성 -> compile typst to pdf -> pdf to blob
  -> respond blob -> client create url from blob and open in new tab

## 분석

### 실패 원인

- railway는 ec2와 달리 ssh가 안 됨

### 해결책

- railway 환경이 리눅스일 것이라 가정
- github release -> typst-x86_64-unknown-linux-musl.tar.xz 다운로드 -> decompress -> move to bin folder
- railway.json을 이용해 관련 명령어 명시
- railway.json 스키마는 다음 참고함: https://backboard.railway.app/railway.schema.json

```json
{
    "$schema": "https://railway.com/railway.schema.json",
    "build": {
        "builder": "RAILPACK",
        "buildCommand": "curl -L https://github.com/typst/typst/releases/download/v0.14.2/typst-x86_64-unknown-linux-musl.tar.xz | tar -xJ && mv typst-x86_64-unknown-linux-musl.tar.xz/typst /usr/local/bin/ && npm run build"
    }
}
```

- typst template을 만들어 pdf는 최대한 typst로 만들고 typst를 node로 작성하는 부분은 최소화
