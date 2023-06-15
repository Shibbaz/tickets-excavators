RSpec.describe TicketsController, type: :controller do
    describe "POST request" do
        let(:ticket) do
            file = File.read(Rails.root.join("spec/ticket.json"))
            data = JSON.parse(file)
            data
        end
        
        it "expects the same json params" do
            post :create, params: {data: ticket}
            expect(JSON.parse(response.body)["data"].keys).to eq(ticket.keys)
            expect(response.status).to eq(200)
        end

        it "expects error" do
            post :create, params: {data: {}}
            json_response = JSON.parse(response.body)
            expect(json_response["error"]).to eq("Not Enough Params, Please check your params")
            expect(json_response["status"]).to eq(400)
            
        end
    end
end
    
    