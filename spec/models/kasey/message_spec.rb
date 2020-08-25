require 'rails_helper'

module Kasey
  RSpec.describe Message, type: :model do
    it { should belong_to(:kase) }

    describe '#sender' do
      context 'when internal' do
        let(:message) { create :message }

        it 'displays internal note if internal' do
          expect(message.sender).to eq('internal note')
        end
      end

      context 'when incoming' do
        let(:client_email) { 'client@testing-kasey.com' }
        let(:intake) { create(:intake, email: client_email) }
        let(:message) { create(:message, direction: :in, kase: intake.kase) }

        it 'displays intake email if incoming' do
          expect(message.sender).to eq(client_email)
        end
      end

      context 'when outgoing' do
        let(:client_email) { 'client@testing-kasey.com' }
        let(:message) { create(:message, direction: :out) }

        it 'displays sending user if outgoing' do
          expect(message.sender).to eq(message.sent_by)
        end
      end
    end
  end
end
