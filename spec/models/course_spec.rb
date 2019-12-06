require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe 'methods' do
    it "can count how many students it has" do
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

      student_1.courses << course_1
      student_2.courses << course_1
      student_3.courses << course_1
      student_4.courses << course_1

      expect(course_1.number_of_students).to eq(4)
    end
  end

end
