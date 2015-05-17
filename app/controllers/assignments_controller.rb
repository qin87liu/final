class AssignmentsController < ApplicationController

  def index
    @teachers = Teacher.all
  end

  def show
    @assignment = Assignment.find_by(id: params["id"])
    @teachers = Teacher.all
  end

  def new
    @assignment = Assignment.new
  end

  def create
  	Assignment.create(params["assignment"])
  	redirect_to assignments_url
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
  	redirect_to assignments_url
  end

end
