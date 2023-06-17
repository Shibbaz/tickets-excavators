require "faker"

FactoryBot.define do
  factory :contact do
    id { SecureRandom.uuid }
    name { "John Doe" }
    phone { "1115552345" }
    email { "example@example.com" }
  end
end
