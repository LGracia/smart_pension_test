# frozen_string_literal: true

require './request'
require './hash_request'
require './print'

file = ''
ARGV.each do|a|
  file = a
end

begin
  raise StandardError.new 'No file found' if file.empty?
  hash_request = HashRequest.new

  File.foreach(file) do |line|
    arr = line.split
    request = Request.new(arr.first, arr.last)
    hash_request << request
  end

  list = hash_request.to_array.sort { |a, b| b[:views] <=> a[:views] }

  printer = Print.new
  printer.show(list)
rescue StandardError => e
  puts e.message
end
