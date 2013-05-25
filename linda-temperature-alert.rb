#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra/rocketio/linda/client'
$stdout.sync = true

url   = ENV["LINDA_BASE"]  || ARGV.shift || "http://localhost:5000"
space = ENV["LINDA_SPACE"] || "test"
puts "connecting.. #{url}"
linda = Sinatra::RocketIO::Linda::Client.new url
ts = linda.tuplespace[space]

linda.io.on :connect do  ## RocketIO's "connect" event
  puts "connect!! <#{linda.io.session}> (#{linda.io.type})"
  ts.read ["sensor", "temperature"] do |tuple|
    p tuple
    if tuple.size == 3
      temp = tuple[2].to_i
      line = "現在の気温、#{temp}度"
      line += "。お体に障りますよ。" if temp < 20 or temp > 24
      puts line
      ts.write ["say", line]
    end
    exit
  end

end

linda.wait