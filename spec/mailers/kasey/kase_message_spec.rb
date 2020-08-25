require "rails_helper"

RSpec.describe Kasey::KaseMessageMailer, type: :mailer do
  let(:kase) { create(:intake).kase }
  let(:message) { kase.messages.create(body: '<div>BODY</div>', direction: :out) }

  describe 'message' do
    let(:mail) { Kasey::KaseMessageMailer.with(kase: kase, message: message).message_email }

    it 'assigns a sender and receiver' do
      # expect(mail.subject).to eq("should this be configurable?")
      expect(mail.subject).to include(kase.token)
      expect(mail.from).to eq(["#{kase.token}@#{Kasey.configuration.email_domain}"])
      expect(mail.to).to eq([kase.intake.email])
    end
  end
end
