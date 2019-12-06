require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit the students index page" do
    describe "I see a list of students" do
      it "name, age and house" do
        student_1 = Student.create!(name: "Casseopia Black",
                                    age: 14,
                                    house: "Slytherin")

        student_2 = Student.create!(name: "Harry Potter",
                                    age: 14,
                                    house: "Gryffindor")

        visit '/students'

        expect(page).to have_content(student_1.name)
        expect(page).to have_content(student_1.age)
        expect(page).to have_content(student_1.house)

        expect(page).to have_content(student_2.name)
        expect(page).to have_content(student_2.age)
        expect(page).to have_content(student_2.house)
      end
    end

    it "has the average age of all students" do
      student_1 = Student.create!(name: "Casseopia Black",
                                  age: 14,
                                  house: "Slytherin")

      student_2 = Student.create!(name: "Harry Potter",
                                  age: 14,
                                  house: "Gryffindor")

      student_3 = Student.create!(name: "Hermonie Granger",
                                  age: 12,
                                  house: "Gryffindor")

      student_4 = Student.create!(name: "Draco Malfroy",
                                  age: 14,
                                  house: "Slytherin")

      visit "/students"
save_and_open_page
      expect(page).to have_content("Average Age: 13.5")
    end
  end
end
