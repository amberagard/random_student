class StudentsController < ApplicationController
  def new
  end

  def create
    student = Student.new(student_params)
    if student.save
      redirect_to :root , notice: "#{student.name} was added to the list."
    else
      flash.alert = "Student name cannot be blank."
      render :new
    end
  end

  protected

  def student_params
    params.require(:student).permit(:name)
  end
end
