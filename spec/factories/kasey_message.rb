FactoryBot.define do
  factory :message, class: Kasey::Message do
    kase { create(:intake).kase }
    body { '<div>a message</div>' }
    direction { :internal }
  end
end
