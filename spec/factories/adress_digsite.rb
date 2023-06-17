require "faker"

FactoryBot.define do
  factory :adress_digsite do
    id { SecureRandom.uuid }
    adress_num { ["Adress 1", "Adress 2"] }
  end
end
