class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    # Validation de présence
    validates :user_name, :first_name, :last_name, :email_adress, presence: true

    # Validation d'unicité pour éviter les doublons d'email
    validates :email_adress, uniqueness: true

    # Validation de format pour l'email
    validates :email_adress, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  end
end
