#import "../../components/rem/index.typ": rem
#import "../../components/title-section/index.typ": title-section
#import "../../components/two-column-section/index.typ": two-column-section
#import "./0_cover/index.typ": cover
#import "./1_problem_of_math_school/index.typ": problem_of_math_school
#import "./2_problem_of_google_sheet_system/index.typ": problem_of_google_sheet_system
#import "./3_problem_of_client/index.typ": problem_of_client

#let problems_to_solve = [
    #cover
    #problem_of_math_school
    #problem_of_google_sheet_system
    #problem_of_client
]
