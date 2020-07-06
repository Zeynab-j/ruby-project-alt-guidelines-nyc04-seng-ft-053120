5.times do
    Student.create(
        name: Faker::Name.name,
        age: (18..25).to_a.sample
    )

    Teacher.create(
        name: Faker::Name.name,
        subject: Faker::ProgrammingLanguage.name
    )
end