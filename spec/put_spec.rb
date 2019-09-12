describe "put" do
    context "when registered a user", :atualizar do
        before(:all) do

            @original_user = build(:registered_user)
            token = ApiUser.token(@original_user.email, @original_user.password)
            @new_user = build(:user)
            @result_put = ApiUser.update(token, @original_user.id, @new_user.to_hash)
            @result_get = ApiUser.find(token, @original_user.id) 
             
         
        end
   
        it { expect(@result_put.response.code).to eql "200" } 
        it { expect(@result_get.parsed_response["full_name"]).to eql @new_user.full_name }
        it { expect(@result_get.parsed_response["email"]).to eql @new_user.email }
    end

    context "when email is duplicated" do 

        before(:all) do
            @original_user = build(:registered_user)
            token = ApiUser.token(@original_user.email, @original_user.password)
            @new_user = build(:duplicateEmail)
            @result_put = ApiUser.update(token, @original_user.id, @new_user.to_hash) 
        end
            it {expect(@result_put.response.code).to eql "409" }
            it {expect(@result_put.parsed_response["msg"]).to eql "Oops. Looks like you already have an account with this email address."}
        end

    context "when wrong email" do 

        before(:all) do
            @original_user = build(:registered_user)
            token = ApiUser.token(@original_user.email, @original_user.password)
            @new_user = build(:wrongEmail)
            @result_put = ApiUser.update(token, @original_user.id, @new_user.to_hash) 
        end
            it { expect(@result_put.response.code).to eql "412" }
            it { expect(@result_put.parsed_response["msg"]).to eql "Oops. You entered a wrong email."}
    end

    context "when noEmpty email" do 

        before(:all) do
            @original_user = build(:registered_user)
            token = ApiUser.token(@original_user.email, @original_user.password)
            @new_user = build(:NotNull)
            @result_put = ApiUser.update(token, @original_user.id, @new_user.to_hash) 
        end
            it { expect(@result_put.response.code).to eql "400" }
            it { expect(@result_put.parsed_response["msg"]).to eql "Users.full_name cannot be null"}
    end


    context "when noNull email" do 

        before(:all) do
            @original_user = build(:registered_user)
            token = ApiUser.token(@original_user.email, @original_user.password)
            @new_user = build(:NotNull)
            @result_put = ApiUser.update(token, @original_user.id, @new_user.to_hash) 
        end
            it { expect(@result_put.response.code).to eql "400" }
            it { expect(@result_put.parsed_response["msg"]).to eql "Users.full_name cannot be null"}
    end
end    