require "spec_helper"

describe RsakeysController do
  describe "routing" do

    it "routes to #index" do
      get("/rsakeys").should route_to("rsakeys#index")
    end

    it "routes to #new" do
      get("/rsakeys/new").should route_to("rsakeys#new")
    end

    it "routes to #show" do
      get("/rsakeys/1").should route_to("rsakeys#show", :id => "1")
    end

    it "routes to #edit" do
      get("/rsakeys/1/edit").should route_to("rsakeys#edit", :id => "1")
    end

    it "routes to #create" do
      post("/rsakeys").should route_to("rsakeys#create")
    end

    it "routes to #update" do
      put("/rsakeys/1").should route_to("rsakeys#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/rsakeys/1").should route_to("rsakeys#destroy", :id => "1")
    end

  end
end
