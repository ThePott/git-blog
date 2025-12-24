# 탭 전환에 따른 스켈레톤 보여주는 게 까다롭다

- 발생일: 2025-12-14 16:07
- 문제: 페이지를 로딩할 때 api 요청 -> 전체 페이지 스켈레톤을 보여주고 있는데 탭을 바꿀 때에는 부분의 스켈레톤을 보여줘야 하나?

## 시도1: 탭 아래만 스켈레톤

### 문제: suspense fallback ui 때문에 두 종류의 스켈레톤이 연달아 보이게 된다

## 시도2: 조건부 스켈레톤

### 시나리오

- suspense fallback: full page skeleton
- isPending while no data: full page skeleton
- isPending while data: partial skeleton

### 문제: 새 쿼리를 날리는 즉시 data가 undefined가 된다

## 시도 3: 페이지별 zustand store를 쓴다

- 페이지별 store provider로 감쌀 수도 있지만... 이건 방어적인 작성일 뿐이지 문제를 해결해주진 않으니까 넘어가자

### 제안: loader를 쓴다?

## 소요 시간:
