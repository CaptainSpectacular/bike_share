FactoryBot.define do
  factory :admin, class: User do
    id 1
    username "admin"
    password "admin_password"
    role 2
  end
  factory :user, class: User do
    id 2
    username "normal_user"
    password "normal_user_password"
    role 1
  end
end
