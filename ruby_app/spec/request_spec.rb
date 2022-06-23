# frozen_string_literal: true

require 'spec_helper'
require_relative '../request'

describe Request do
  subject { Request.new('/test/1', '444.701.448.104') }

  it '#ip' do
    expect(subject.ip).to eq '444.701.448.104'
  end

  it '#url' do
    expect(subject.url).to eq '/test/1'
  end
end
