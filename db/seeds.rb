
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
        name: "Claire",
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
        time:   nil,
        rating: nil
    },
    {
        teacher_id: Teacher.second.id,
        student_id: Student.second.id,
        review: "OKAY",
        time:   nil,
        rating: nil
    },
    {
        teacher_id: Teacher.second.id,
        student_id: Student.first.id,
        review: "Terrible",
        time:   nil,
        rating: nil
    }
])

5.times do

    Teacher.create(
        name: Faker::Name.name,
        subject: Faker::ProgrammingLanguage.name
    )

    TutoringSession.create(
        teacher_id: Teacher.all.sample.id,
        student_id: nil,
        review: nil,
        time: ["1","2","3","4","5"].to_a.sample
    )
end



#     Student.create(
#         name: Faker::Name.name,
#         age: (18..25).to_a.sample
#     )