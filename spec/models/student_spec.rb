require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'methods' do
    it "can calculate average age of students" do
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

      expect(Student.average_age).to eq(13.5)
    end

    it "can sort students in alphabetical order" do
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

      expect(Student.alphabetical).to eq([student_1, student_4, student_2, student_3])
    end
  end

end
