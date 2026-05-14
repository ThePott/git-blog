---
NOTE: 이 프롬프트를 복붙하기 전에 targets/ 폴더 안에 `url-list.md`가 채워져 있어야 함
---

# Update `target-array.ts` Based On Following Instructions

## General rules

- read `url-list.md`.
- go to url, and find `{회사명__직무명}` (consider this as "name").
    - all special characters must change to `_`.
- update `target-array.ts` with url and name of above.
- DO NOTE EDIT ANY OTHER FILES.

## url specific rules

- url must be url for one specific job application page.
    - [there are multiple applications here](https://toss.im/career/job-detail?job_id=4071101003)
    - [this is specific application page](https://toss.im/career/job-detail?job_id=4071101003&sub_position_id=4071101003&company=%ED%86%A0%EC%8A%A4)
- if there are multiple applications in the page, follow links and get urls for specific job application pages.

# Refuse any action if you are not in BUILD Mode
