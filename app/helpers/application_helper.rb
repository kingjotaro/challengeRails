
module ApplicationHelper
    def format_phone(phone)
      return unless phone
  
      phone.gsub(/(\d{2})(\d{4,5})(\d{4})/, '(\1) \2-\3')
    end
    def formatted_cpf(cpf)
        return if cpf.blank?
    
        cpf.gsub(/(\d{3})(\d{3})(\d{3})(\d{2})/, '\1.\2.\3-\4')
      end
  end
  