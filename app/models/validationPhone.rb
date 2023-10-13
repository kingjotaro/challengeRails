module ValidationPhone
    extend ActiveSupport::Concern
  
    included do
        validates :phone, presence: true, format: { with: /\d{9,15}\z/, message: "inválid, just user numbers!" }
    end
end