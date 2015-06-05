class AssignmentsController < ApplicationController

  def index
    @teachers = Teacher.all
  end

  def show
    @assignment = Assignment.find_by(id: params["id"])
    @teachers = Teacher.all
    if @assignment.assistant_id?
      @assistant = Assistant.find_by(id: @assignment.assistant_id).name
    else
      @assistant = "None"
    end
  end

  def new
    @assignment = Assignment.new
  end

  def create
  	Assignment.create(params["assignment"])
    teacher = Teacher.find_by(id: params["assignment"]["teacher_id"])
  	redirect_to teacher_url(teacher)
  end

  def edit
  	@assignment = Assignment.find_by(id: params["id"])
    @teachers = Teacher.all
  end

  def update
  	@assignment = Assignment.find_by(id: params["id"])
  	@assignment.update(params["assignment"])
  	redirect_to assignments_url  
  end

  def destroy
  	@assignment = Assignment.find_by(id: params["id"])
  	@assignment.delete
  	redirect_to :back
  end

end
