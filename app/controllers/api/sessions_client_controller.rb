module Api
  class SessionsClientController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      email = params[:email]
      client_password = params[:client_password]

      client = Client.find_by(email: email)
      if client && client.client_password == client_password
        # Las credenciales son válidas, se puede realizar cualquier lógica adicional aquí
        render json: { message: 'Inicio de sesión exitoso' }
      else
        render json: { error: 'Credenciales inválidas' }, status: 401
      end
    end

    def session_params
      params.require(:client).permit(:email, :client_password)
    end
  end
end