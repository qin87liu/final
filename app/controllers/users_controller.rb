class UsersController < ApplicationController
  skip_before_action :auth

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params["id"])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params["user"])
    
    if params["optionsRadios"] == "option1"
      if @user.valid?
        @teacher = Teacher.create
        @teacher.name = @user.name
        @teacher.save
        @user.teacher_id = @teacher.id
        @user.role = "Teacher"
        @user.save
        redirect_to home_index_path, notice: "Thanks for signing up!"
      else
        render "new"
      end
    else
      if @user.valid?
        @assistant = Assistant.create
        @assistant.name = @user.name
        @assistant.save
        @user.assistant_id = @assistant.id
        @user.role = "Teaching Assistant"
        @user.save
        redirect_to home_index_path, notice: "Thanks for signing up!"
      else
        render "new"
      end
    end
  end

  def edit
    @user = User.find_by(id: params["id"])
  end

  def update
    @user = User.find_by(id: params["id"])
    @user.update(params["user"])
    redirect_to users_path
  end

  def destroy
    @user = User.find_by(id: params["id"])
    @user.destroy
    redirect_to users_path
  end

end