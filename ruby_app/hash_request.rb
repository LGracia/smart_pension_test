# frozen_string_literal: true

# Class to create a hash of Requests
class HashRequest
  attr_reader :hash

  def initialize
    @hash = {}
  end

  def to_array
    hash.map { |_k, v| v }
  end

  def add_request(request)
    key = hash_key(request)
    if hash[key].nil?
      hash[key] = new_hash(request.url, request.ip)
    else
      update_hash(key, request.ip)
    end
  end

  alias << add_request

  private

  def new_hash(url, ip)
    {
      views: 1,
      url: url,
      ips: [ip]
    }
  end

  def update_hash(key, ip)
    hash[key][:views] = hash[key][:views] + 1
    hash[key][:ips] << ip
  end

  def hash_key(request)
    request.url.gsub('/', '_').to_sym
  end
end
