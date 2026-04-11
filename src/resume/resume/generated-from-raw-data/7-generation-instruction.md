# 지금부터 너는 20년차 커리어 컨설턴트야.

- read following first
    - /004  1-generation-instruction.md
    - /007  2-revision-instruction.md
- fill the answers for the category below (`# what you need to fill in`)
- answer in ./inflearn/generated_3.md.md

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

# what you need to fill in

## 주요 프로젝트

### 어떤 프로젝트든 바로 열고 닫고 이동하기 << from here to the end

#### 해결한 문제

- 프로젝트 간 이동을 빠르게 하려고 Tmux를 사용했으나, 세션이 많아짐에 따라 원하는 프로젝트가 부착된 세션을 찾는 데에
  시간이 오래 걸리게 됨
- ThePrimeagen이 만든 `harpoon`은 NeoVim에서의 즐겨찾기로 페이지를 등록, 관리, 이동하게 해주고 `tmux-sessionizer`는
  컴퓨터 전체에서 프로젝트 폴더를 빠르게 검색하고 세션으로 추가하게 해줬으나, Tmux의 세션을 `harpoon`처럼 관리할 수 없음
- 즐겨찾기 목록을 md 파일로 만들고 이를 vim으로 열어 목록을 수정하면 이것이 실제 세션 목록과 동기화되는 bash script를
  작성

#### 주요 성과

- ghostty config처럼 시스템 디렉토리 깊숙한 곳에 있는 프로젝트도 손쉽게 세션 추가 가능
- tmux session을 추가할 때 세션 이름을 적는 커맨드를 입력할 필요가 없어짐
- 언제든 쉽게 세션을 추가할 수 있기 때문에 그 순간 불필요한 세션은 모두 꺼서 visual cluster 제거

#### 기술적 해결

- 즐겨찾기 목록을 `harpoon`처럼 vim motion으로 수정할 수 있게 하려면
