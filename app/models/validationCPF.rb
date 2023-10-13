module ValidationCPF
  extend ActiveSupport::Concern

  included do
    validates :cpf, presence: true, uniqueness: true, format: { with: /\A\d{11}\z/, message: "Wrong length, just use numbers!" }

    validate :valid_cpf_format
  end

  private

  def valid_cpf_format
    return if cpf_valid?(cpf)
    errors.add(:cpf, 'is invalid!')
  end

  def cpf_valid?(cpf)
    num1 = cpf[0].to_i
    num2 = cpf[1].to_i
    num3 = cpf[2].to_i
    num4 = cpf[3].to_i
    num5 = cpf[4].to_i
    num6 = cpf[5].to_i
    num7 = cpf[6].to_i
    num8 = cpf[7].to_i
    num9 = cpf[8].to_i
    num10 = cpf[9].to_i
    num11 = cpf[10].to_i

    soma1 = num1 * 10 + num2 * 9 + num3 * 8 + num4 * 7 + num5 * 6 + num6 * 5 + num7 * 4 + num8 * 3 + num9 * 2
    resto1 = (soma1 * 10) % 11
    resto1 = 0 if resto1 == 10

    soma2 = num1 * 11 + num2 * 10 + num3 * 9 + num4 * 8 + num5 * 7 + num6 * 6 + num7 * 5 + num8 * 4 + num9 * 3 + num10 * 2
    resto2 = (soma2 * 10) % 11
    resto2 = 0 if resto2 == 10

    return (resto1 == num10) && (resto2 == num11)
  end
end
