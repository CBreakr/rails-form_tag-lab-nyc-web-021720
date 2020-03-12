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
    if session[:updated_student_id] then
    # if params.has_key? ("format") then
      # student = Student.find(params["format"])
      # byebug
      student = Student.find(session[:updated_student_id])
      @first_name = student.first_name
      @last_name = student.last_name
      session[:updated_student] = nil
    end
  end

  def create
    @student = Student.create(first_name: params[:student][:first_name], last_name: params[:student][:last_name])
    session[:updated_student_id] = @student.id
    # redirect_to new_student_path(@student)
    redirect_to new_student_path
  end
end
