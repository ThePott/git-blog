// TODO
// 1. read `src/job/generating-resume-prompts/src/targets/list`
// 2. check if `Target` object is created inside of `src/job/generating-resume-prompts/src/targets/index.ts`
// 3. if not, append one (`name` must be file name without .md extension)

import * as fs from "fs"
import * as path from "path"

import { fileURLToPath } from "node:url"
import { dirname } from "node:path"

const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename) // NOTE: ts project root

const updateTargets = () => {
    const listDir = path.resolve(__dirname, "targets/list")
    const indexPath = path.resolve(__dirname, "targets/index.ts")
    // 1. Read list directory → get file names without .md
    const files = fs.readdirSync(listDir).filter((f) => f.endsWith(".md"))
    const names = files.map((f) => f.replace(".md", ""))
    // 2. Read index.ts content
    let indexContent = fs.readFileSync(indexPath, "utf-8")
    // 3. For each name, check if exists in targetArray
    for (const name of names) {
        if (indexContent.includes(`name: "${name}"`)) continue
        // Read .md file → extract url from `## url` section
        const mdPath = path.join(listDir, `${name}.md`)
        const mdContent = fs.readFileSync(mdPath, "utf-8")
        const urlMatch = mdContent.match(/## url\s*\n+- (https?:\/\/[^\s]+)/)
        const url = urlMatch?.[1] ?? ""
        // Append to targetArray
        const newTarget = `    { name: "${name}", url: "${url}", generatedKeywords: false, generatedResume: false, applied: false },`
        // Insert before `]` closing bracket
        indexContent = indexContent.replace(
            /const targetArray: Target\[\] = \[/,
            `const targetArray: Target[] = [\n${newTarget}`,
        )
    }
    // 4. Write back
    fs.writeFileSync(indexPath, indexContent)
    console.log(`Updated targets: ${names.length} checked`)
}
export default updateTargets
