module Api
  class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      email = params[:email]
      password = params[:password]
      user = User.find_by(email: email)
      if user && user.valid_password?(password)
        render json: { message: 'Inicio de sesión exitoso' }
      else
        render json: { error: 'Credenciales inválidas' }, status: 401
      end
    end

    private

    def session_params
      params.require(:user).permit(:email, :password)
    end
  end
end