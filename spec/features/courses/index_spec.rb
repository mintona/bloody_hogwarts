require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit the courses index page" do
    it "I see a list of courses and the number of students enrolled in that course" do
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

      course_1 = Course.create!(name: "Defense Against the Dark Arts")
      course_2 = Course.create!(name: "Herbology")
      course_3 = Course.create!(name: "Potions")

      student_1.courses << course_1
      student_1.courses << course_2
      student_1.courses << course_3

      student_2.courses << course_1

      student_3.courses << course_1
      student_3.courses << course_2

      student_4.courses << course_1

      visit '/courses'

      expect(page).to have_content("#{course_1.name}: 4")
      expect(page).to have_content("#{course_2.name}: 2")
      expect(page).to have_content("#{course_3.name}: 1")
    end
  end
end
