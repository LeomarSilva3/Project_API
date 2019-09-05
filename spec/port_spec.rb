describe "post" do
    context "when new user" do
        before do
            @new_user = build(:user).to_hash
                
            @result = HTTParty.post(
                "http://localhost:3001/user",
                body: @new_user.to_json,
                headers: {
                    "Content-Type" => "application/json",
                },
            )    
        end
         
        it{expect(@result.response.code).to eql "200"}
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


    # it "Duplicate Email", :duplicateEmail do
    #    result =  HTTParty.post(
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
    #     expect(result.response.code).to eql "409"
        
    # end

    # it "Wrong Email" do
    #     result =  HTTParty.post(
    #          "http://localhost:3001/user",
    #          body: {
    #              full_name: "Fernando Papito",
    #              email: "emailerrado",
    #              password: "123456"
    #          }.to_json,
    #          headers: {
    #              "Content-Type" => "application/json",
    #          },
    #      )
    #      puts result
    #      expect(result.response.code).to eql "412"
         
    #  end

    #  it "Not Empty fields" do
    #     result =  HTTParty.post(
    #          "http://localhost:3001/user",
    #          body: {
    #              full_name: "",
    #              email: "",
    #              password: ""
    #          }.to_json,
    #          headers: {
    #              "Content-Type" => "application/json",
    #          },
    #      )
    #      puts result
    #      expect(result.response.code).to eql "412"
         
    #  end


    #  it "Not Null" do
    #     result =  HTTParty.post(
    #          "http://localhost:3001/user",
    #          body: {
                 
    #          }.to_json,
    #          headers: {
    #              "Content-Type" => "application/json",
    #          },
    #      )
    #      puts result
    #      expect(result.response.code).to eql "412"
         
    #  end
end