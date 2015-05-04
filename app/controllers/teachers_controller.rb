class TeachersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @teacher = Teacher.new
  end

  def create
  	Teacher.create(params["teacher"])
  	redirect_to teachers_url
  end

  def edit
  	@teacher = Teacher.find_by(id: params["id"])
  end

  def update
  	@teacher = Teacher.find_by(id: params["id"])
  	@teacher.update(params["teacher"])
  	redirect_to teachers_url  
  end

  def destroy
  	@teacher = Teacher.find_by(id: params["id"])
  	@teacher.delete
  	redirect_to teachers_url
  end

end
