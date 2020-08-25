require 'rails_helper'

RSpec.describe Kasey::Kase, type: :model do
  let(:kase) { create(:intake).kase }

  it { should belong_to :intake }
  it { should have_many :messages }

  it 'generates a token when created' do
    expect(kase.token).not_to be_nil
  end
end
