class Api::UsersController < ApplicationController
  
  def create
    @name = params[:name]
    @email = params[:email]
    
    user = User.new(
      name: @name,
      email: @email,
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render 'show.json.jb', status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def index
    if current_user
      render 'show.json.jb'
    else
      render json: {}
    end
  end

end
