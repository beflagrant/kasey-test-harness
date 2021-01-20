require 'rails_helper'

describe 'sstuff', type: :request do
    let(:user) { User.create(email: 'admin@example.com') }
    context 'open kases' do
        scenario 'do not display a close button' do
            intake = Intake.create(email: 'test+open@example.com')

            visit '/kasey/kases'

            expect(page).not_to have_content 'Close'
        end
    end

    context 'previously viewed kases' do
        scenario 'display a close button' do
            intake = Intake.create(email: 'test+reviewed@example.com')
            intake.kase.review!

            sign_in(user)

            visit '/kasey/kases'

            expect(page).to have_content 'Close'
        end
    end
end