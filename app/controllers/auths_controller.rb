class AuthsController < ApplicationController
  def create
    name = params[:name]
    secret_key = Rails.application.secret_key_base

    if name.present?

      exp = Time.now.to_i + 2 * 3600
      payload = { name: name, exp: exp }
      token = JWT.encode(payload, secret_key, "HS256")

      render json: { token: token }
    else
      render json: { error: "nome é obrigado a colocar" }, status: :unprocessable_entity
    end
  end
end
