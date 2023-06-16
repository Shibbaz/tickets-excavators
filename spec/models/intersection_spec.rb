require 'rails_helper'

RSpec.describe Intersection, type: :model do
  context 'create method' do
    let(:intersection) {
      create(:intersection)
    }
    it 'passes validation' do
      expect(intersection).to be_valid
    end

    it 'expects presence of itois' do
      expect{ Itoi.find(intersection.itoi_ids) }.to_not raise_error
    end
  end
end
