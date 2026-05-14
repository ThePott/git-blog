// TODO
// AI, Google AI Mode
// {회사명}에 신입 {직무명}로 지원하려고 하는데, 중요 키워드 50개를 코드 블록 안에 마크다운으로 정리해줘

// TODO: targets/list 안에 있는 파일명에서 회사명, 직무명 분리

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
    const keywordsDir = path.resolve(__dirname, "generated.keywords")
    return `${companyName}에 신입 ${jobName}로 지원하려고 해. 중요 키워드 50개를 정리해서 ${keywordsDir}에 ${fullName}.md 파일을 만들고 작성해. 만약 해당 파일이 이미 있으면 넘어가.`
}

const generateKeywordsPrompts = () => {
    const targetListDir = path.resolve(__dirname, "targets/list")
    const targetListFiles = fs.readdirSync(targetListDir).filter((f) => f.endsWith(".md"))
    const fullNameArray = targetListFiles.map((f) => f.replace(".md", ""))

    const keywordsPromptsDir = path.resolve(__dirname, "generated.keywords.prompts")

    fullNameArray.forEach((fullName) => {
        const targetPath = path.join(keywordsPromptsDir, `${fullName}.md`)
        if (fs.existsSync(targetPath)) return

        const prompts = makePrompt(fullName)
        fs.writeFileSync(targetPath, prompts)
    })
    console.log({ fullNameArray })
}

export default generateKeywordsPrompts

// TODO
// AI, Google AI Mode
// {회사명}에 신입 {직무명}로 지원하려고 하는데, 중요 키워드 50개를 코드 블록 안에 마크다운으로 정리해줘

// TODO: targets/list 안에 있는 파일명에서 회사명, 직무명 분리
