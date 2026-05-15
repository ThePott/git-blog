#import "./components/page_settings/index.typ": page_setting
#import "./components/dim_text/index.typ": dim_text
#import "./components/rem/index.typ": rem
#import "./components/hr/index.typ": hr
#import "./components/shadowed_round_box/index.typ": shadowed_round_box

#show: page_setting

#let additional_title(content) = text(size: rem(1.2), weight: "semibold", content)


// === HEADER ===
#grid(
    columns: (1fr, 100pt),
    column-gutter: 20pt,
    [
        = 하흥주
        #v(rem(0.5))
        // [수정] 포지션에 맞게 타이틀 변경: Frontend → Node.js + AI 자동화 강조
        #additional_title("반복 업무를 자동화하는 Node.js 개발자")
        #v(rem(2))
        #dim_text[nusilite\@gmail.com]
        #v(rem(1))
        문제를 정확히 정의하고, 단순한 해결책을 만듭니다
    ],
    [
        // Photo placeholder
        #shadowed_round_box[
            #image("assets/nusilite.jpg")
        ]
    ],
)

== 자기소개

// [수정] AI 자동화 경험 + 반복 업무 자동화 강조 (JD: "반복적인 업무 프로세스를 분석하고 자동화한 경험")
*반복 업무를 분석하고 자동화합니다*

입시 학원 강사 시절, 진도와 오답 관리에 학생당 5분, 수업당 최대 100분이 소요되었습니다. 파이썬과 구글 시트로 자동화 시스템을 만들어 이 시간을 크게 단축했고, 이후 웹앱으로 발전시켜 다른 강사도 사용할 수 있게 했습니다.

현재는 LLM을 활용한 문서 자동 생성 워크플로우를 구축하고 있습니다. 회사별 채용공고에서 키워드를 추출하고, 프롬프트를 생성하여 AI가 맞춤형 이력서를 작성하도록 하는 파이프라인입니다. 프롬프트 엔지니어링을 통해 일관된 품질의 출력물을 생성하고, 출력 결과를 파일로 저장하는 전체 과정을 자동화했습니다.

반복 업무의 본질을 파악하고 자동화하는 개발자가 되고자 합니다. 토스의 AI Agent 기반 업무 자동화 시스템 개발에 기여하고 싶습니다.

== 기술 스택

// [수정] Node.js AI 포지션에 맞게 백엔드 + AI 관련 기술 우선 배치
Node.js, TypeScript, Express, PostgreSQL, Prisma, REST API, Git, React

== 경력
=== 아르보 수학학원
#dim_text("중고등부 수학 | 강사 | 프리랜서\n2020. 02. ~ 2024. 07. (4년 6개월)")

- 파이썬과 구글 시트를 사용한 자체 제작 진도 및 오답 관리 시스템으로 체계적인 학생 관리
- 개념서 자체 제작, 100점 획득 학생 배출

=== 아르보 수학학원
#dim_text("(부서 없음) | 개발자 | 계약직\n2025. 11. ~ 2026. 04. (6개월)")

#additional_title("진도 및 오답 관리 시스템 제작")

==== 담당 업무

// [수정] 백엔드/자동화 관점 강조 (JD: "유지보수가 가능한 코드", "반복 업무 자동화")
- 반복 업무 자동화
    - 학생당 5분, 수업당 50~100분 소요되던 수기 동기화 작업을 시스템으로 자동화
    - 기존 파이썬 CLI 시스템의 한계점 분석 후 웹앱으로 재설계
- 백엔드 API 설계 및 개발
    - Express.js + TypeScript로 RESTful API 서버 구축
    - Prisma ORM으로 PostgreSQL 스키마 관리 및 마이그레이션 자동화
- 성과
    - 서버 응답 속도 7초 → 315ms (22배 향상): DB region 분석 후 API와 동일 네트워크에 배포
    - 서버 사이드 PDF 생성으로 80쪽 기준 30.7% 시간 단축, 브라우저 부담 제거

== 프로젝트

// [수정] AI 자동화 프로젝트 추가 (JD: "AI Agent나 LLM 기반 애플리케이션 설계/개발 경험")
=== LLM 기반 이력서 자동 생성 파이프라인
#dim_text("개인/기타\n2026. 05. ~ 현재")

#additional_title("프롬프트 엔지니어링으로 문서 자동화")

==== 해결한 문제
- 여러 회사에 지원할 때 각 포지션별 맞춤 이력서 작성에 많은 시간 소요
- 수작업으로 키워드 매칭 시 누락되는 요구사항 발생

==== 구현 내용
- 채용공고(JD)에서 핵심 키워드 자동 추출
- 추출된 키워드와 지원자 정보를 조합하여 프롬프트 생성
- LLM API를 통해 맞춤형 이력서 콘텐츠 생성
- 생성된 콘텐츠를 Typst 파일로 저장 후 PDF 컴파일

==== 기술적 해결
- 일관된 출력 품질을 위한 프롬프트 템플릿 설계
- 파일 I/O 자동화로 수동 개입 없이 전체 파이프라인 실행

=== Arbor The Tree 오답관리 시스템
#dim_text("아르보 수학학원\n2025. 11. ~ 2026. 04.")

// [수정] 백엔드 자동화 관점 강조
#additional_title("Node.js 백엔드 + 업무 자동화 시스템")

==== 해결한 문제
- 기존 파이썬 시스템의 느린 속도
    - 진도표와 오답 과제 현황을 수기로 동기화 (학생당 5분, 수업당 50~100분 소요)
- 강사의 기억에 의존하던 진도 추적
    - 자동화된 진도 관리로 전환

==== 주요 성과

// [수정] 백엔드 성능 최적화 + 모니터링 경험 강조 (JD: "모니터링해 본 경험")
- 서버 응답 속도 7초 → 315ms (22배 향상)
    - Neon DB의 cold start, region 문제 분석 후 Railway PostgreSQL로 교체
    - API와 DB를 동일 internal network에 배포하여 round-trip latency 최소화
- 서버 사이드 PDF 생성으로 80쪽 기준 30.7% 시간 단축
    - Typst 컴파일러 도입, 브라우저 메인 스레드 점유 없이 처리

==== 기술적 해결

- 커스텀 배포 스크립트: npm install로 설치되지 않는 Typst compiler, font 파일을 Railway 배포 시 자동 설치
- RESTful API 설계: Express.js + TypeScript로 #link("https://github.com/ThePott/api-of-arbor-the-tree", "API 서버 구축")
// [수정] Harpooning 프로젝트를 자동화 관점에서 재구성 (JD: "개발자 생산성 도구")
=== Harpooning Tmux 세션 관리자
#dim_text("개인/기타\n2026. 04. ~ 2026. 04.")

#additional_title("개발자 생산성 도구 - CLI 자동화")

==== 해결한 문제
- 프로젝트 간 이동 시 세션 검색에 평균 25초 소요
- 기존 도구들의 한계: 세션 순서 변경 불가, 즐겨찾기 관리 부재

==== 기술적 해결
- Bash 스크립트로 tmux 세션 관리 자동화
- fzf를 활용한 프로젝트 디렉토리 검색 및 세션 생성
- grep/sed를 이용한 텍스트 파싱으로 세션 목록과 실제 상태 양방향 동기화

==== 주요 성과
- 새 프로젝트 세션 등록 시간: 25.3초 → 0.8초 (31배 향상)
- 숫자 단축키(0~9)로 즉시 세션 이동

== 포트폴리오
=== 링크

#link("https://arbor-the-tree.com")[Arbor The Tree - 업무 자동화 웹앱 \ ]
#link("https://github.com/ThePott/api-of-arbor-the-tree")[API 서버 (Express.js + TypeScript) \ ]
#link("https://github.com/ThePott/harpooning")[Harpooning - CLI 자동화 도구]

== 교육
=== 고려대학교
#dim_text("졸업 | 대학교(학사) | 경제학과\n2013. 02. ~ 2020. 02.")

