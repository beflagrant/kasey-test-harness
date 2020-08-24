module KaseyConfigHelper
  def initialize_kasey
    Kasey.configure do |c|
      c.auth_required = true
      # from devise
      c.authenticate_function = :authenticate_user!
      c.authorize_function = ->(user, kase) { true }
      # from devise
      c.authenticated_user_function = :current_user
    end
  end
end
