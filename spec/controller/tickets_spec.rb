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
            expect(JsonDiff.diff(ticket, JSON.parse(response.body)["data"]).size).to eq(0)
        end

        it "expects error" do
            post :create, params: {data: {}}
            json_response = JSON.parse(response.body)
            expect(json_response["error"]).to eq("Please check your params")
            expect(json_response["status"]).to eq(400)
        end
    end

    describe "GET request" do
        let(:ticket) do
            create(:ticket)
        end

        let(:json) do
            file = File.read(Rails.root.join("spec/ticket.json"))
            data = JSON.parse(file)
            data
        end
        
        it "expects the same json params" do
            request.accept = "application/json"
            get :show, params: {id: ticket.id}
            expect(response.status).to eq(200)
            expect(JSON.parse(response.body)["data"].nil?).to be(false)
            JsonDiff.diff(json, JSON.parse(response.body)["data"])
        end

        it "expects error" do
            request.accept = "application/json"
            get :show, params: {id: SecureRandom.uuid}
            expect(JSON.parse(response.body)["error"]).to eq("Records Not Found")
        end
    end
end
    
    