class AssistantsController < ApplicationController

  def index
  end

  def show
    @user = User.find_by(id: session["user_id"])
    @assistant = Assistant.find_by(id: @user.assistant_id)
  end

  def new
    @assistant = Assistant.new
  end

  def create
  	@assistant = Assistant.create(params["assistant"])
  end

  def edit
  	@assistant = Assistant.find_by(id: params["id"])
  end

  def update
  	@assistant = Assistant.find_by(id: params["id"])
  	@assistant.update(params["assistant"])
  	redirect_to assistant_url(@assistant)
  end

  def destroy
  	@assistant = Assistant.find_by(id: params["id"])
  	@assistant.delete
  	redirect_to assistants_url
  end

end
