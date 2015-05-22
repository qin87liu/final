class TeachersController < ApplicationController

  def index
  end

  def show
    @teacher = Teacher.find_by(id: params["id"])
  end

  def new
    @teacher = Teacher.new
  end

  def create
  	@teacher = Teacher.create(params["teacher"])
  	if @teacher.valid?
      redirect_to teachers_url, notice: "Thanks for signing up!"
    else
      render "new"
    end
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
