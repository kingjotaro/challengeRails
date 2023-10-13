module ValidationEmail
    extend ActiveSupport::Concern
    
    included do
      validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "inválido" }
    end
end