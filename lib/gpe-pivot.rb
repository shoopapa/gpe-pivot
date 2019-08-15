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
    
    get "/galileo" do
        erb :home
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
                {time:  1, value: 170}, 
                {time:  2, value: 169},
                {time:  3, value: 169},
                {time:  4, value: 168},
                {time:  5, value: 167},
                {time:  6, value: 166},
                {time:  7, value: 165},
                {time:  8, value: 166},
                {time:  9, value: 167},
                {time: 10, value: 166},
                {time: 11, value: 167}
            ],
            age: 19  },
            {  name: "ben",    weight: [
                {time:  1, value: 130}, 
                {time:  2, value: 139},
                {time:  3, value: 139},
                {time:  4, value: 138},
                {time:  5, value: 137},
                {time:  6, value: 136},
                {time:  7, value: 135},
                {time:  8, value: 136},
                {time:  9, value: 137},
                {time: 10, value: 136},
                {time: 11, value: 137}
            ],
            age: 17  }
        ])
    end

  end

end
