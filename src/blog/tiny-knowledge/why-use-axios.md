## it handles response type automatically

- client doesn't know what format of data server would send
    - json? text? blob?
- if you don't know it, it is hard to create wrapper function
    - cannot just `const json = await resonse.json()`
