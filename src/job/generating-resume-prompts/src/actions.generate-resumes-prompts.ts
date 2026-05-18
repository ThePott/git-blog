import * as fs from "fs"
import * as path from "path"

import { fileURLToPath } from "node:url"
import { dirname } from "node:path"

const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename) // NOTE: ts project root

const makePrompt = (fullName: string): string => {
    const companyName = fullName.split("__")[0]
    const jobName = fullName
        .split("__")
        .filter((_, index) => index !== 0)
        .join("__")
    const resumesDir = path.resolve(__dirname, "generated.resumes")
    return `
# 지금부터 너는 20년차 커리어 컨설턴트야.

## 너의 할 것

- 너는 ${companyName}에 신입 ${jobName}으로 지원한 이력서들을 보고 있어.
- 주어진 재료로 좋은 이력서 기준을 충족하는 이력서를 만들어(그 기준이 무엇인지도 서술해)
    - ${__dirname}/resources/*
    - ${__dirname}/generated.keywords/${fullName}.md
    - ${__dirname}/../../general/portfolio/portfolio_v3
    - ${__dirname}/../../general/resume/resume_v2
- ${resumesDir}/${fullName}/ 에 작성하고 그 이외의 어떤 파일도 수정하지 마.
- 신입이기 때문에 지원 동기가 필요해. 지원 동기는 주어진 자료를 바탕으로 작성해.

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

### 파일 형식
- 먼저 ${__dirname}/../../general/resume/resume_v2 의 내용물을 ${resumesDir}/${fullName}/ 에 복사해
- 만들어져있는 컴포넌트, 페이지 구조는 수정하지 말고 내용물만 수정해
- default-resume에서 수정한 부분이 있으면 왜 그렇게 수정했는지 주석을 달아
- 그렇게 index.typ를 만들고 나면 해당 폴더에서 typst compile index.typ 명령어를 실행해

### 주의사항: 대답 형식

1. 없는 사실을 만들지 마
2. ${__dirname}/resources/* 에 있는 내용 중, 이력서에 들어갈 필요가 없다고 판단하면 제외해
3. ${__dirname}/resources/* 에 보완되어야 할 내용이 있으면 물어봐.
`
}

const generateResumesPrompts = () => {
    const targetListDir = path.resolve(__dirname, "targets")
    const targetListFiles = fs.readdirSync(targetListDir).filter((f) => f.endsWith(".md"))
    const fullNameArray = targetListFiles.map((f) => f.replace(".md", ""))

    const resumesPromptsDir = path.resolve(__dirname, "generated.resumes.prompts")

    fullNameArray.forEach((fullName) => {
        const targetPath = path.join(resumesPromptsDir, `${fullName}.md`)
        if (fs.existsSync(targetPath)) return

        const prompts = makePrompt(fullName)
        fs.writeFileSync(targetPath, prompts)
    })

    console.log("created resumes prompts")
}

export default generateResumesPrompts
