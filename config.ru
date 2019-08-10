require 'rubygems'
require 'bundler'

Bundler.require

require 'gpe-pivot'

set :bind, '0.0.0.0'
set :port, 9292 #set your port!o

run GPEPivot::Viewer
