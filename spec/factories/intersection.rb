require "faker"

FactoryBot.define do
  factory :intersection do
    id { SecureRandom.uuid }
    itoi_ids {
      itoi = create(:itoi)
      extra_itoi = Itoi.create(id: SecureRandom.uuid, state: "ZZ", county: "COUNTY", place: "ATLANTA", prefix: "", name: "Jefferson", dig_type: "Ave", suffix: "SW")
      [itoi.id, extra_itoi.id]
    }
  end
end
