class Api::V1::UsersController < ApplicationController

  # before_action :validate_email_update, only: :update
  wrap_parameters :user, include: [:email, :password, :first_name, :last_name]

  def create
    user = User.new(user_params)
    # binding.pry
    if user.save
      # render json: {status: 'User created successfully'}, status: :created
      login
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])

    # binding.pry

    if(user)
      render json: user
    else
      render json: {errors: user.errors.full_messages}
    end

  end

  def confirm
    token = params[:token].to_s

    user = User.find_by(confirmation_token: token)

    if user.present?
      user.mark_as_confirmed!
      render json: {status: 'User confirmed successfully'}, status: :ok
    else
      render json: {status: 'Invalid token'}, status: :not_found
    end
  end

  def login
    # binding.pry
    user = User.find_by(email: params[:email].to_s.downcase)

    if user && user.authenticate(params[:password])
      # if user.confirmed_at?
        auth_token = JsonWebToken.encode({user_id: user.id})

        # binding.pry
        # render json: {status: "hello"}
        render json: {auth_token: auth_token, user:{id: user.id, first_name: user.first_name, last_name: user.last_name}}
      # else
      #   render json: {error: 'Email not verified' }, status: :unauthorized
      # end
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end

  def find_current_user
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last
    current_user_id = JsonWebToken.decode(token)[0]["user_id"]
    current_user = User.find_by(id: current_user_id)
    # binding.pry
    if(current_user)
      render json: {user: {id: current_user.id, first_name: current_user.first_name, last_name: current_user.last_name}}
    else
      render json: {error: "User does not exist"}
    end
  end

  def update
    if current_user.update_new_email!(@new_email)
      # SEND EMAIL HERE
      render json: { status: 'Email Confirmation has been sent to your new Email.' }, status: :ok
    else
      render json: { errors: current_user.errors.values.flatten.compact }, status: :bad_request
    end
  end

  def email_update
    token = params[:token].to_s
    user = User.find_by(confirmation_token: token)

    if !user || !user.confirmation_token_valid?
      render json: {error: 'The email link seems to be invalid / expired. Try requesting for a new one.'}, status: :not_found
    else
      user.update_new_email!
      render json: {status: 'Email updated successfully'}, status: :ok
    end
  end

  private

  def validate_email_update
    @new_email = params[:email].to_s.downcase

    if @new_email.blank?
      return render json: { status: 'Email cannot be blank' }, status: :bad_request
    end

    if  @new_email == current_user.email
      return render json: { status: 'Current Email and New email cannot be the same' }, status: :bad_request
    end

    if User.email_used?(@new_email)
      return render json: { error: 'Email is already in use.' }, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
