class AssignmentsController < ApplicationController

  def index
    @teachers = Teacher.all
    @user = User.find_by(id: session["user_id"])
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
  	@user = User.find_by(id: session["user_id"])
    @assignment = Assignment.create(params["assignment"])
    if @assignment.valid?
      teacher = Teacher.find_by(id: @user.teacher_id)
      @assignment.teacher_id = teacher.id
      @assignment.status = "Open"
      @assignment.save
    	redirect_to teacher_url(teacher)
    else
      render "new"
    end
  end

  def edit
  	@assignment = Assignment.find_by(id: params["id"])
    @teachers = Teacher.all
  end

  def update
  	@assignment = Assignment.find_by(id: params["id"])
    @user = User.find_by(id: session["user_id"])
  	@assignment.update(params["assignment"])
    if@assignment.valid?
      teacher = Teacher.find_by(id: @user.teacher_id)
      redirect_to teacher_url(teacher)
    else
      render "new"
    end
  end

  def destroy
  	@assignment = Assignment.find_by(id: params["id"])
  	@assignment.delete
  	redirect_to :back
  end

end
