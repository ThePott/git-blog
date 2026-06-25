# reference

# commands

- p {variable}
    - prints value or pointing address
- p/d {variable}
    - print in decimal (useful for address)
- e {expression}
    - excecute expression
    - ex) `e test_number = 12`
    - this can be checked in SCOPE tab
    - but not synced with WATCH tab
- x/h {base 16 address AFTER initialization}
- x/d {base 10 address AFTER initialization}
- p {&variable}
    - prints address of the variable

# you can change value in SCOPE tab, with `s` key

- this is applied in WATCH tab in sync

# ai

```
Key links:
- LLDB Tutorial (command structure, breakpoints, stepping, frame inspection): https://lldb.llvm.org/use/tutorial.html
- GDB → LLDB command map (side-by-side cheat sheet): https://lldb.llvm.org/use/map.html
- Man page: https://lldb.llvm.org/man/lldb.html
In-REPL: help lists all commands, help <cmd> for details, apropos <keyword> to search.
Your most-used commands from your question:
Goal	LLDB command
Read variable	p var, expr var
Write variable	expr var = 27
Read memory at address	memory read 6171911110, or x 6171911110
Write to raw address	expr *(int *)6171911110 = 27
Read register	register read rax
Write register	register write rax 123
```
