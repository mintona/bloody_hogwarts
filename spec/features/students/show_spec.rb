require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit a students show page" do
    it "I see a list of that students courses" do
      student_1 = Student.create!(name: "Casseopia Black",
                                  age: 14,
                                  house: "Slytherin")

      student_2 = Student.create!(name: "Harry Potter",
                                  age: 14,
                                  house: "Gryffindor")

      course_1 = Course.create!(name: "Defense Against the Dark Arts")
      course_2 = Course.create!(name: "Herbology")
      course_3 = Course.create!(name: "Potions")

      student_1.courses << course_1
      student_1.courses << course_2
      student_1.courses << course_3

      student_2.courses << course_1
      student_2.courses << course_3

      visit "/students/#{student_1.id}"

      expect(page).to have_content(course_1.name)
      expect(page).to have_content(course_2.name)
      expect(page).to have_content(course_3.name)

      visit "/students/#{student_2.id}"

      expect(page).to have_content(course_1.name)
      expect(page).to have_content(course_3.name)
      expect(page).to_not have_content(course_2.name)
    end
  end
end
