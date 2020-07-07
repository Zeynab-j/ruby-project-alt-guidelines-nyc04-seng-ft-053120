
#Faker::Educator.subject
Student.destroy_all
Teacher.destroy_all
TutoringSession.destroy_all

Student.create([
    {
        name: "Jorge",
        age: 29
    },
    {
        name: "Jennifer",
        age: 25
    }
])

Teacher.create([
    {
        name: "CLaire",
        subject: "Java"
    },
    {
        name: "Saulious",
        subject: "Python",
    }
])

TutoringSession.create([
    {
        teacher_id: Teacher.first.id,
        student_id: Student.first.id,
        review: "Terrible",
        time:   "2pm",
    },
    {
        teacher_id: Teacher.second.id,
        student_id: Student.second.id,
        review: "OKAY",
        time:   "5pm",
    }
])

# 5.times do
#     Student.create(
#         name: Faker::Name.name,
#         age: (18..25).to_a.sample
#     )

#     Teacher.create(
#         name: Faker::Name.name,
#         subject: Faker::ProgrammingLanguage.name
#     )

#     TutoringSession.create(
#         teacher_id: (1..10).to_a.sample,
#         student_id: (1..10).to_a.sample,
#         review: ["great","bad","Terrible","super"].to_a.sample,
#         time: ["1","2","3","4","5"].to_a.sample
#     )
# end