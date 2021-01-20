require 'rails_helper'

describe 'Kasey::KasesController', type: :request do
    let(:user) { User.create(email: 'admin@example.com') }

    before do
        allow_any_instance_of(Kasey::KasesController).to receive(:has_access?).and_return(true)
    end

    context 'index' do
        context 'open kases' do
            scenario 'do not display a close button' do
                intake = Intake.create(email: 'test+open@example.com')

                visit '/kasey/kases'

                expect(page).not_to have_content 'Close'
            end
        end

        context 'previously viewed kases' do
            scenario 'displays a close button' do
                intake = Intake.create(email: 'test+reviewed@example.com')
                intake.kase.review!

                sign_in(user)

                visit '/kasey/kases'

                expect(page).to have_content 'Close'
            end
        end
    end

    context 'closed' do
        let(:email) { 'test+closed@example.com' }

        scenario 'displays closed kases' do
            intake = Intake.create(email: email)
            intake.kase.review!
            intake.kase.close!

            sign_in(user)

            visit '/kasey/kases/closed'

            expect(page).to have_content email
        end

        scenario 'elides kases not closed' do
            intake = Intake.create(email: email)
            intake.kase.review!

            sign_in(user)

            visit '/kasey/kases/closed'

            expect(page).not_to have_content email
        end

    end
end