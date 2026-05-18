import { createInterface } from "node:readline"
import generateKeywordsPrompts from "./actions.generate-keywords-prompts.js"
import generateResumesPrompts from "./actions.generate-resumes-prompts.js"
import generateQnaPrompts from "./action.generate-qna.js"

const readline = createInterface({
    input: process.stdin,
    output: process.stdout,
})

const commandArray = ["help", "exit", "keywords", "resumes", "qna"]
const availableCommands = commandArray.join(", ")
type Command = (typeof commandArray)[number]
const commandToAction: Record<Command, () => void> = {
    help: () => {
        console.log(`Available commands: ${availableCommands}`)
    },
    exit: () => process.exit(0),
    keywords: generateKeywordsPrompts,
    resumes: generateResumesPrompts,
    qna: generateQnaPrompts,
}

const prompt = () => {
    readline.question("> ", (input) => {
        const command = input.trim() as Command
        const action = commandToAction[command]
        if (!action) {
            console.log("Unknown command")
            console.log(`Available commands: ${availableCommands}`)
        } else {
            action()
        }
        prompt()
    })
}

prompt()
