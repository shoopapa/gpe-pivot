require "gpe-pivot/version"
require "sinatra"
require "json"
require "awesome_print"

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
    
    get "/list" do
        list
    end

    get "/pivot/time" do
        erb :time_pivot
    end

    get "/pivot/:data" do
        erb :general_pivot, :locals => {:data => params[:data]}
    end
    
    get "/data/galileo" do
       reformat("lib/public/tables/gal.json")
    end

    get "/data/time" do
        json_gen
    end

    def reformat(path)
        data = JSON.parse(File.read(path))
        head = data["column_headers"] 
        row_data = data["row_data"]
        data_format = []
        p = 0
        while p < row_data.length do
            data_format[p] = {}
            h = 0
            while h < head.length do
                data_format[p][head[h]] = row_data[p][h]
                h += 1
            end
           p += 1 
        end
        JSON.generate(data_format)
    end

    def list
        JSON.generate([
            {id: 1, value: "cars"},
            {id: 2, value:"weight"}, 
            {id: 3, value:"galileo"}
        ])
    end

    def time_json
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
    def json_test
        JSON.generate([
            {model: "pissat", year: "2014"},
            {model: "lexus", year: "2013"}
        ])
    end

  end

end
