
require_relative "models/user_model"

FactoryBot.define do
    factory :user, class: UserModel do
        full_name {"Leomar Barbosa"}
        email {"eu@leomar.io"}
        password {"123456"}
    
        after(:build) do |user|
            Database.new.delete_user(user.email) 
        end
    end

    factory :duplicateEmail, class: UserModel do
        full_name {"Tony Stark"}
        email {"tony@stark.com"}
        password {"pwd123"}
    end

    factory :wrongEmail, class: UserModel do
        full_name {"Tony Stark"}
        email {"dvgdfgdfgdf"}
        password {"pwd123"}
    end

    factory :NotEmptyfields, class: UserModel do
        full_name {""}
        email {""}
        password {""}
    end

    factory :NotNull, class: UserModel do
        full_name {}
        email {}
        password {}
    end


    factory :Success_Authorization, class:UserModel do
        full_name {"Leomar Barbosa"}
        email {"eu@leomar.io"}
        password {"123456"}
    end

    factory :Unathorization, class:UserModel do
        full_name {"Leomar Silva"}
        email {"eu@ledfgdgd.io"}
        password {"123456"}
    end


end