#import "./components/page-setting/index.typ": page-setting
#import "./components/title-body-box/index.typ": title-body-box
#import "./components/subtitle-body-box/index.typ": subtitle-body-box

#show: page-setting
// https://youtu.be/qeFJ6UwjxmU?t=528

#let personal-info-title = [
    #heading(depth: 1, "하흥주")
    #heading(depth: 3, "frontend developer")
]
#let personal-info-body = [
    #par(
        [
            입시 학원 강사로 재직하는 동안 수업 품질을 일관되게 유지하기 위해 사용한 시스템을, 더 여러 사람이 이용할 수
            있게 웹앱으로 개발했습니다.
        ],
    )
    #par("이제 더 많은 사람을 도우려 합니다.")
]
#title-body-box(
    personal-info-title,
    personal-info-body,
)

#title-body-box(heading(level: 2, "보유 기술"), [
    #heading(level: 3, "frontend development")
    - React.js를 이용한 프론트엔드 개발
    - TanStack Virtual을 이용한 성능 최적화
    - bun test, happy-dom을 이용한 테스트 환경 구축
    - 공통 컴포넌트를 npm package로 배포하여 초기 개발 시간 절약
    #heading(level: 3, "backend development")
    - Bun, Express를 이용한 서버 제작
    - prisma, PostgreSQL을 이용한 스키마 및 쿼리 작성
    #heading(level: 3, "deployment")
    - Railway, S3, CloudFront를 이용한 서비스 배포
    - 패키지 매니저만으로 설치되지 않는 것들을 Railway 리눅스 머신에 설치하는 배포 스크립트 작성
])

#title-body-box(heading(level: 2, "교육"), [
    #stack(dir: ltr, heading(level: 3, "고려대학교"), " / 경제학과")
    2013.03 \~ 2020.02
    #v(1em)
    #stack(dir: ltr, heading(level: 3, "오즈 코딩 스쿨"), " / 프론트엔드 코스")
    2025.05 \~ 2025.11
])

#title-body-box(is-empty: true, heading(level: 2, "경력"), [])

#subtitle-body-box(
    [
        #heading(level: 3, "진도 / 오답 관리 시스템")
        아르보 수학학원

        2025.11 \~ 2026.03
    ],
    [
        #heading(level: 4, "frontend development")
        - React를 이용한 프론트엔드 개발
        - TanStack 라이브러리를 이용한 낙관적 업데이트, 가상화로 사용자 경험 증진
        - Zustand를 이용해 컴포넌트별로 독립된 스토어를 제작, props-drilling, re-render 해결

        #heading(level: 4, "backend development")
        - Node.js, Express, prisma를 이용한 restful API 구축
        - 기존 Neon 데이터베이스 서버 응답 속도 개선을 위해, Railway와 PostgreSQL로 서버 교체, 응답 속도를 7초에서
            0.3초로 단축
        - typst compiler를 이용해 서버에서 pdf를 생성하여 브라우저 부담 최소화, 사용자 경험 증진
    ],
)


