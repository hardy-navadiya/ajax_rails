class StudentsController < ApplicationController
  def index 
    @students = Student.all
    @student = Student.new
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(s_params)
    @students = Student.all

    respond_to do |format|
      if @student.save
        @students = Student.all
        format.html { redirect_to students_url, notice: "Try was successfully created." }
        format.json { render :show, status: :created, location: @student }
        format.js
      else
        render 'new'
      end
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
     @students = Student.all
     @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])  

    respond_to do |format|
      if @student.update(s_params)
        @students = Student.all
        format.html { redirect_to 'students/index', notice: "Try was successfully updated." }
        format.js
      else
        format.html { render :edit}
        format.js
      end
    end
  end

  def destroy
    @student = Student.find_by(params[:id])
    @student.destroy
    respond_to do |format|
      format.html { redirect_to 'students_url', notice: "Try was successfully destroyed." }
      format.js
    end
  end

  private
  def s_params
    params.require(:student).permit(:name, :email)
  end
end
