class StudentsController < ApplicationController
  def index
    @students = Student.all.alphabetical
  end

  def show
    @student = Student.find(params[:id])
  end
end
