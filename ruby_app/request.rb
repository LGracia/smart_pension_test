# frozen_string_literal: true

# Class to describe the object that is loaded from the log
class Request
  attr_reader :url, :ip

  def initialize(url, ip)
    @url = url
    @ip = ip
  end
end
