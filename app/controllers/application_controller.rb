class ApplicationController < ActionController::API
  private

  def authorize_login
    header = request.headers["Authorization"]
    token = header.split(" ").last if header

    puts "Token recebido no header Authorization: #{token.inspect}"

    if token.blank?
    render json: { error: "Token ausente" }, status: :unauthorized and return
    end

    begin
      decoded = JWT.decode(token, Rails.application.secret_key_base, true, { algorithm: "HS256" })[0]
    @current_user = decoded["name"]
      @current_user = decoded["name"]
    rescue JWT::DecodeError
      render json: { error: "token invalido" }, status: :unauthorized
    rescue JWT::ExpiredSignature
      render json: { error: "Token expirado" }, status: :unauthorized
    end
  end
end
