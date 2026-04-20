# ArrayList of struct vs MultiArrayList

- https://pedropark99.github.io/zig-book/Chapters/09-data-structures.html#how-to-use-a-doubly-linked-list

| Use ArrayList(Person)                    | Use MultiArrayList(Person)               |
| ---------------------------------------- | ---------------------------------------- |
| "Array of structs" - all fields together | "Struct of arrays" - each field separate |
| Iterate all fields together              | Iterate single field efficiently         |
| Whole-record access                      | Columnar storage (like column DB)        |

The benefit: cache efficiency

When you iterate only .age in MultiArrayList:

- Contiguous memory access to just age values
- No loading name strings or height floats you don't need
- Better cache locality = faster iteration
- SIMD-friendly for certain operations

When MultiArrayList wins:

- Many records, frequent iteration on single field
- Aggregations, analytics, data processing
- Game engines (transform arrays, position arrays)

When ArrayList wins:

- Need whole records together
- Random access by index
- Simpler code

For the book's simple example, ArrayList is simpler and fine. MultiArrayList is an optimization for data-heavy workloads
where you have thousands of records and mostly operate on one field at a time (e.g., computing average age across 1M
people).
