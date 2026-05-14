type Target = {
    name: string // NOTE: 기업명__직무명 (모든 특수문자는 _으로 변환)
    url: string
    generatedKeywords: boolean // NOTE: default false
    generatedResume: boolean // NOTE: default false
    applied: boolean // NOTE: default false
}
const targetArray: Target[] = []

export default targetArray
