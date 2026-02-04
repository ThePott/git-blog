# 공통 컴포넌트가 상황에 따라 조금씩 다르게 쓰이는 온갖 경우를 어떻게 다루지?

- 발생 시각: 2026-02-03 14:19
- 문제: 공통 컴포넌트가 쓰이는 곳마다 조금씩 다르게 작동해야 하는 온갖 경우를 고려하기가 힘듦
- 해결 시각:

## 배경

- 여러 라우트에서 사용되는 사이드바를 레이아웃으로 분리해 공통 컴포넌트처럼 사용되게 함
- `/progress`일 때만 사용되는 작은 컴포넌트들이 있음
- `/review-check`일 땐 특정 컴포넌트들이 클릭 이벤트를 다르게 핸들링해야 함
- `pathname`에 따른 조건부 렌더링을 시도함 -> 온갖 if문 범벅이 되고 관심사 분리가 되지 않음
- sidebar의 목적: reading and writing search params -> need `const route = getRouteApi("/_sidebar-section")` -> 한
  컴포넌트에 몰아 넣어야 하지 않나?

## 분석

### 실패 원인

- 관심사 분리를 하지 않았기 때문
- configuration이 복잡해질 땐 composition 방법론을 따라라.

### 해결책

- `features/_sidebar-section/layout`: create sidebar components in small pieces
- `routes/_sidebar-section.tsx`: only set search params validation, render only `<Outlet />`
- `routes/_sidebar-section._progress_sidebar.tsx`: sidebar specifically for prgress
- `routes/_sidebar-section._review-check-sidebar.tsx`: sidebar specifically for review check

- 특정 라우트에서만 사용되는 컴포넌트 (실라버스 폼, 실라버스 삭제 버튼)은 해당 라우트의 레이아웃 폴더에 배치한다
