require 'rails_helper'

RSpec.describe Intake, type: :model do
  it { should have_one(:kase) }

  it 'creates a kase after creation' do
    expect {
      @intake = Intake.create(email: 'test@testing-kasey.com')
    }.to change { Kasey::Kase.count }.by(1)

    expect(@intake.kase).not_to be_nil

    expect(@intake.kase.intake).to eq(@intake)
  end
end
