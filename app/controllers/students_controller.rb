class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @first_name = ""
    @last_name = ""
    if params.has_key? ("format") then
      student = Student.find(params["format"])
      @first_name = student.first_name
      @last_name = student.last_name
    end
  end

  def create
    @student = Student.create(first_name: params[:student][:first_name], last_name: params[:student][:last_name])
    redirect_to new_student_path(@student)
  end
end
