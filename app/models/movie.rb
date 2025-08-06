class Movie < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 20, message: "escreva no maximo 20 caracteres" }
  validates :description, presence: true
  validates :release_year, numericality: { only_integer: true, message: "O ano de lançamento deve ser um número inteiro válido." }, allow_nil: true
end
