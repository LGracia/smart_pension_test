# frozen_string_literal: true

require 'spec_helper'
require_relative '../hash_request'
require_relative '../request'

# rubocop:disable Metrics/BlockLength
describe HashRequest do
  subject { HashRequest.new }

  describe '#to_array' do
    context 'when the hash does not have requests' do
      it 'returns empty' do
        expect(subject.to_array).to be_empty
      end
    end

    context 'when the hash has requests' do
      context 'when the request comes with new url' do
        it 'returns an array with requests converted in hash' do
          request = Request.new('/test/1', '444.701.448.104')
          subject << request
          expect(subject.to_array.size).to eq 1
          expect(subject.to_array.first).to be_a Hash
        end
      end

      context 'when the request comes with a url that is ' \
        'already in the array' do
        it 'returns an array with 2 requests converted in hash' do
          request = Request.new('/test/1', '444.701.448.104')
          subject << request
          request = Request.new('/test/1', '444.701.448.103')
          subject << request
          expect(subject.to_array.first[:ips].size).to eq 2
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
