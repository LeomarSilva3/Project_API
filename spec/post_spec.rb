describe "post" do
    context "when new user", :teste do
        let(:result) { ApiUser.save( build(:user).to_hash) } 
        it{
            expect(result.response.code).to eql "200"
            puts result.parsed_response.to_json
        }

    end

    context "duplicate email" do
        let(:result) { ApiUser.save(build(:duplicateEmail).to_hash) } 
        it{expect(result.response.code).to eql "409"}
        it{expect(result.parsed_response["msg"]).to eql "Oops. Looks like you already have an account with this email address."}
    end

    context "wrong email" do
        let(:result) {ApiUser.save(build(:wrongEmail).to_hash)} 
        it{expect(result.response.code).to eql "412"}
        it{expect(result.parsed_response["msg"]).to eql "Oops. You entered a wrong email."}
    end

    context "not empty fields" do
        let(:result) { ApiUser.save(build(:NotEmptyfields).to_hash)}
        it{expect(result.response.code).to eql "412"}
        it{expect(result.parsed_response["msg"]).to eql "Validation notEmpty on full_name failed"}
    end

    context "not null" do
        let(:result) {ApiUser.save(build(:NotNull).to_hash)} 
        it{expect(result.response.code).to eql "412"}
        it{expect(result.parsed_response["msg"]).to eql "Users.full_name cannot be null"}
    end


    context "Success Authorization" do
         let(:result) { ApiUser.authorization(build(:Success_Authorization).to_hash)}
         it{expect(result.response.code).to eql "200"}
    end


    context "Unathorization" do
        let(:result) { ApiUser.authorization(build(:Unathorization).to_hash)}
        it{expect(result.response.message).to eql "Unauthorized"}   
    end



    # it "New user", :newuser do

    #     Database.new.delete_user("eu@leomar.io")

    #     result = HTTParty.post(
    #         "http://localhost:3001/user",
    #         body: {
    #             full_name: "Leomar da Silva Barbosa",
    #             email: "eu@leomar.io",
    #             password: "123456"
    #         }.to_json,
    #         headers: {
    #             "Content-Type" => "application/json",
    #         },
    #     )
    #     puts result
    #     expect(result.response.code).to eql "200"
    # end


end