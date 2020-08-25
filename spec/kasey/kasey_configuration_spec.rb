describe Kasey do
  describe '#configure' do
    before do
      # start with a clean config
      initialize_kasey
    end

    after(:all) do
      initialize_kasey
      # clean up after ourselves
    end

    it 'raises an error if .auth_require is not boolean' do
      expect {
        Kasey.configure do |c|
          c.auth_required = "EXTERMINAAAAATE!"
        end
      }.to raise_error Kasey::ConfigurationError
    end

    it 'raises an error if .authenticate_function is not a Symbol or Proc' do
      expect {
        Kasey.configure do |c|
          c.authenticate_function = Math::PI
        end
      }.to raise_error Kasey::ConfigurationError
    end

    it 'raises an error if .authorize_function is not a Symbol or Proc' do
      expect {
        Kasey.configure do |c|
          c.authorize_function = nil
        end
      }.to raise_error Kasey::ConfigurationError
    end

    it 'raises an error if .authenticated_user_function is not a Symbol or Proc' do
      expect {
        Kasey.configure do |c|
          c.authenticated_user_function = 'user@email.com'
        end
      }.to raise_error Kasey::ConfigurationError
    end

    it 'configures Kasey when configured with Procs' do
      expect {
        Kasey.configure do |c|
          c.auth_required = true
          c.authenticate_function = Proc.new { :dummy_user }
          c.authorize_function = ->(user, kase) { true }
          c.authenticated_user_function = Proc.new { :same_dummy_user }
        end
      }.not_to raise_error

      expect(Kasey.configuration.auth_required).to eq(true)
      expect(Kasey.configuration.authenticate_function.call()).to eq(:dummy_user)
      expect(Kasey.configuration.authorize_function.call(nil,nil)).to eq(true)
      expect(Kasey.configuration.authenticated_user_function.call()).to eq(:same_dummy_user)
    end

    it 'configures Kasey when configured with Symbols' do
      expect {
        Kasey.configure do |c|
          c.auth_required = true
          c.authenticate_function = :authenticate_me
          c.authorize_function = :authorize_me
          c.authenticated_user_function = :me
        end
      }.not_to raise_error
      expect(Kasey.configuration.auth_required).to eq(true)
      expect(Kasey.configuration.authenticate_function).to eq(:authenticate_me)
      expect(Kasey.configuration.authorize_function).to eq(:authorize_me)
      expect(Kasey.configuration.authenticated_user_function).to eq(:me)
    end
  end
end
