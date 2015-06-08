class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params["email"])
    if @user.present?
      # Yes, the user exists
      if @user.role == "Teacher"
        if @user.authenticate(params["password"])
          session["user_id"] = @user.id
          teacher = Teacher.find_by(id: @user.teacher_id)
          redirect_to teacher_url(teacher)
        else
          redirect_to new_session_url, alert: 'No way!!!'
        end
      else
        if @user.authenticate(params["password"])
          session["user_id"] = @user.id
          assistant = Assistant.find_by(id: @user.assistant_id)
          redirect_to assistant_url(assistant)
        else
          redirect_to new_session_url, alert: 'No way!!!'
        end
      end
    else
      # No user with that email
      redirect_to new_session_url, alert: 'No way!!!'
    end

    # Redirect to the root_path
    # Display a notice that login was either successful or unsuccessful
  end

  def destroy
    session["user_id"] = nil
    redirect_to root_url, notice: "See ya later!"
  end

end