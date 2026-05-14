# 지금부터 너는 20년차 커리어 컨설턴트야.

## 너의 할 것

- 너는 {인프런}에 신입 {프론트엔드 개발자}으로 지원한 이력서들을 보고 있어.
- 주어진 재료로 좋은 이력서 기준을 충족하는 이력서를 만들어(그 기준이 무엇인지도 서술해)
    - "./raw.md"
    - 밑의 채용 공고
    - 밑의 키워드
    - "../../applied/2026-04-03-oz-coding-school-consult/resume/"
    - "../../applied/2026-04-03-oz-coding-school-consult/portfolio/"
- {"./inflearn/generated.md"}에 작성하고 그 이외의 어떤 파일도 수정하지 마.
- 지원 동기는 주어진 자료를 바탕으로 작성해.

### 형식

- 개발자 이력서답게 간결하게 적을 것
    - bullet point
    - 짧은 문장 내지는 어절
- xyz formula에 맞춰서 적을 것
    - X (Accomplishment): The positive outcome, improvement, or accomplishment, not just a task.
    - Y (Measurement): Data, numbers, percentages, or dollar amounts that measure success.
    - Z (Method): The specific actions, skills, or tools you used to achieve the result.
    - Examples of the XYZ Formula
        - Weak: "Managed social media accounts."
        - Strong (XYZ): "Increased brand visibility by 30% (X & Y) by implementing a new social media strategy (Z)".
        - Weak: "Helped with customer support."
        - Strong (XYZ): "Reduced average client onboarding time from 1 day to 1 hour (X & Y) by designing a new training
          module program (Z)".
- 자기소개를 상단에 5~10줄 가량 적을 것

### 주의사항: 대답 형식

1. 없는 사실을 만들지 말아줘
2. raw.md에 있는 내용 중, 이력서에 들어갈 필요가 없다고 판단하면 제외해
3. raw.md에 보완되어야 할 내용이 있으면 물어봐.
4. "../../applied/2026-04-03-oz-coding-school-consult/1-consulting-questions.md"을 읽고 여기의 조언을 따라.

# 채용 공고

https://www.linkedin.com/posts/sjpark11_%EC%9D%B8%ED%94%84%EB%9E%A9-%EC%9D%B8%ED%94%84%EB%9F%B0-%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EA%B0%9C%EB%B0%9C%EC%9E%90-%EC%B1%84%EC%9A%A9-%EB%9E%A0%EB%A6%BF-share-7438135067236876288-hfUi?utm_source=share&utm_medium=member_desktop&rcm=ACoAAF2FGPIBQUl7gw0Xx4oyCU4QZnUuwSUrsdg

# 키워드

## 1. Core JavaScript & Language

1. ES6+
2. TypeScript
3. Event Loop
4. Closure
5. Hoisting
6. Prototype
7. This Binding
8. Promise / async-await
9. Execution Context
10. Garbage Collection

## 2. React & State Management

11. Virtual DOM
12. React Hooks
13. Custom Hooks
14. Context API
15. State Management (Zustand/Recoil)
16. Server State (TanStack Query)
17. Client State vs Server State
18. Component Composition
19. Hydration
20. Reconciliation

## 3. Browser & Web Technology

21. Critical Rendering Path
22. Web Vitals (LCP, FID, CLS)
23. SEO (Search Engine Optimization)
24. CORS
25. Event Bubbling / Capturing
26. Browser Storage (Local/Session/Cookie)
27. Debounce & Throttle
28. PWA (Progressive Web Apps)
29. Lazy Loading / Code Splitting
30. Semantic Markup

## 4. Development Environment & Collaboration

31. Webpack / Vite
32. CI/CD (GitHub Actions)
33. Monorepo (Turborepo/Nx)
34. Unit Test (Jest/Cypress)
35. ESLint / Prettier
36. Git Flow
37. Code Review
38. Agile / Scrum
39. Design System (Storybook)
40. RESTful API / GraphQL

## 5. Growth & Soft Skills

41. Growth Mindset
42. User-Centric
43. Technical Writing
44. Performance Optimization
45. Refactoring
46. Problem Solving
47. Design Tokens
48. Open Source
49. Architecture
50. Shared Value

# 추가 정보

- Next.js 경험: 채용공고에서 Next.js(Pages Router) 기반 개발을 언급하는데, 해당 경험이 있나요?
    - Next.js의 입문 강의를 들은 상태.
    - 구체적 프로젝트 경험은 없음
- React Native 경험: 모바일 앱 개발 경험이 있나요?
    - Swift,SwiftUI를 이용한 iOS 개발 경험만 있음 (8개 앱 배포, 실사용자는 없는 수준)
- 모노레포 경험: pnpm, Turborepo 등 모노레포 환경 경험이 있나요?
    - pnpm 사용 경험 있음. 다만, npm 명령어를 pnpm으로 바꿔서 사용하는 정도
    - 모노 레포 경험 없음. 항상 client, api 서버를 다른 레포로 관리
- 테스트 코드 작성 경험: 구체적인 테스트 경험이 있나요?
    - bun test를 이용한 유닛 테스트 학습 시작함. 없다고 봐도 무방.
- 웹접근성/웹표준 경험: 관련 경험이 있나요?
    - 웹 표준 경험 있음(이게 맞아?)
        - html로 구조 잡고 css(tailwind)로 스타일링 (inline style 최소화)
        - 브라우저 api 중 주요 브라우저들에 모두 호환되는 것만 사용
    - 웹접근성 경험 있음(이거 말고 더 있나?)
        - semantic tag 최대한 사용 (heading 목적은 h1~6 사용)
        - img 태그 사용시 alt 속성 부여
- A/B 테스트, 기능 플래그 경험: 관련 경험이 있나요?
    - A/B 테스트 경험 있음
        - Arbor The Tree
            - pdf generation time comparison (typst vs react-pdf)
            - while improving server response time
    - 기능 플래그 경험 없음(이게 뭐야?)
