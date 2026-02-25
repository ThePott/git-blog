# type union이 아니라 조건부 타입을 쓰고 싶을 때

## 조건부 return type

```ts
type Fruit = "apple" | "banana"
function extractFruit(input: "apple"): number
function extractFruit(input: "banana"): string
function extractFruit(input: Fruit) {
    // ...
}
// NOTE: input이 무엇이냐에 따라 return type이 명확히 정해짐
// NOTE: number | string 이 아니라 정확히 number 혹은 정확히 string
// NOTE: function overload를 위해선 arrow function이 아니라 function 키워드를 사용해야 함
```

## 조건부 component props type using Discriminated Union

- also called "Tagged Union" or "Disjoint Union"
- The key characteristic is that it has a discriminant property (also called a "tag") - in your case, forWhat - that
  allows TypeScript to narrow the entire type.

### Terminology Breakdown

```ts
type CheckboxProps = SyllabusCheckboxProps | AssignmentCheckboxProps
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//                   Discriminated Union

type SyllabusCheckboxProps = {
    forWhat: "syllabus" // ← Discriminant (or "tag")
    source: JoinedQuestion
}

type AssignmentCheckboxProps = {
    forWhat: "assignment" // ← Discriminant (or "tag")
    source: ExtendedReviewAssignmentQuestion
}
```

### Why It "Acts Differently"

#### Regular union (what you had before):

```ts
type CheckboxSource = JoinedQuestion | ExtendedReviewAssignmentQuestion
// NOTE: TypeScript can't tell which one you have without manual type guards
```

#### Discriminated union (what you have now):

```ts
type CheckboxProps = SyllabusCheckboxProps | AssignmentCheckboxProps

// NOTE: TypeScript automatically narrows based on the discriminant:
if (props.forWhat === "syllabus") {
    // NOTE: TypeScript knows: props is SyllabusCheckboxProps
    props.source.session_id // ✅ Works!
}
```

### Related Terms

- Discriminant/Tag: The property that differentiates union members (forWhat)
- Discriminated Union: The union type with a discriminant
- Type Narrowing: What TypeScript does when it refines the type based on the discriminant
- Exhaustiveness Checking: TypeScript can verify you handled all cases

- This pattern is also called "variant types" in some languages (like Rust's enum or OCaml's variant types).
