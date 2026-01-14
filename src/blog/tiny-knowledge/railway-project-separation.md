# railway project integration, separation

- railway에서는 한 프로젝트 안에 여럿을 배포할 수 있음
- 한 프로젝트에 있으면 internal network를 이용하기 때문에 속도가 빠름
- 그러나 환경변수가 분리되지 않음

## case 1: api + db => 하나록 관리

## case 2: client, api => 분리

- 서버 env가 client에 노출되어선 안 됨
- 클라이언트의 요청은 브라우저에서 이뤄지기 때문에 언제나 외부에서 일어나서 internal networking의 이점을 누릴 수 없음
