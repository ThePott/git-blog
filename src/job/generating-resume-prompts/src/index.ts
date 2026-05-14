import { createInterface } from "node:readline"

const readline = createInterface({
    input: process.stdin,
    output: process.stdout,
})

const commandArray = ["help", "exit", ""]
const availableCommands = commandArray.join(", ")
type Command = (typeof commandArray)[number]
const commandToAction: Record<Command, () => void> = {
    help: () => {
        console.log(`Available commands: ${availableCommands}`)
    },
    exit: () => process.exit(0),
    test: () => console.log("Generating..."),
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
