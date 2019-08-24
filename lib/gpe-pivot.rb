require "gpe-pivot/version"
require "sinatra"
require "json"

module GPEPivot
    
  class Error < StandardError; end

  class Viewer < Sinatra::Base
       
    configure do
      set :root, File.dirname(__FILE__)
      set :title, "Spectrum Protect Connect"
      set :static, true
      enable :corss_origin
    end
    
    before do
      response.headers['Access-Control-Allow-Origin'] = '*'
    end

    get "/" do
        erb :home
    end
    
    get "/galileo" do
        erb :galileo_pivot
    end

    get "/time" do
        erb :time_pivot
    end
    
    get "/galileo_data" do
        File.read("lib/public/gal.json")
    end

    get "/time_data" do
        json_gen
    end


    def json_gen
        JSON.generate([
            {  name: "joe",    weight: [
                {time: "2019.07.10", value: 170}, 
                {time: "2019.07.11", value: 169},
                {time: "2019.07.12", value: 169},
                {time: "2019.07.13", value: 168},
                {time: "2019.07.14", value: 167},
                {time: "2019.07.15", value: 166},
                {time: "2019.07.16", value: 165},
                {time: "2019.07.17", value: 166},
                {time: "2019.07.18", value: 167},
                {time: "2019.07.19", value: 166},
                {time: "2019.07.20", value: 167}
            ],
            age: 19  },
            {  name: "ben",    weight: [
                {time: "2019.07.20", value: 130}, 
                {time: "2019.07.21", value: 139},
                {time: "2019.07.22", value: 139},
                {time: "2019.07.23", value: 138},
                {time: "2019.07.24", value: 137},
                {time: "2019.07.25", value: 136},
                {time: "2019.07.26", value: 135},
                {time: "2019.07.27", value: 136},
                {time: "2019.07.28", value: 137},
                {time: "2019.07.29", value: 136},
                {time: "2019.07.30", value: 137}
            ],
            age: 17  }
        ])
    end

  end

end
