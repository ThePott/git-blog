---
NOTE: 이 프롬프트를 복붙하기 전에 targets/list/ 폴더 안에 `{회사명}__{직무명}.md`가 채워져 있어야 함
---

# Update `` Based On Following Instructions

## General rules

- read `src/job/generating-resume-prompts/src/targets/`.
- go to url, and find `{회사명__직무명}` (consider this as "name").
    - all special characters must change to `_`.
- update `src/job/generating-resume-prompts/src/targets/target-array.ts` with url and name of above.
- DO NOTE EDIT ANY OTHER FILES.

## url specific rules

- url must be url for one specific job application page.
    - [there are multiple applications here](https://toss.im/career/job-detail?job_id=4071101003)
    - [this is specific application page](https://toss.im/career/job-detail?job_id=4071101003&sub_position_id=4071101003&company=%ED%86%A0%EC%8A%A4)
- if there are multiple applications in the page, follow links and get urls for specific job application pages.

## name specific rules

- follow {회사명} and {직무명} what the pages are saying. if korean, write it as Korean, if english then English.

# Refuse any action if you are not in BUILD Mode
