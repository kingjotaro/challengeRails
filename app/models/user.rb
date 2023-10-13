class User < ApplicationRecord
  include ValidationCPF
  include ValidationPhone
  include ValidationEmail 
end