require 'spec_helper'

describe Github do
  let (:subject) { described_class.new }

  it "lists public activity" do
    resp = subject.public_activity
    expect(resp.size).to eq(10)

    expect(resp.first[:type]).to eq('PushEvent')
  end

  it "lists public source repositories only" do
    resp = subject.repositories

    resp.each do |repo|
      expect(repo[:fork]).to eq(false)
      expect(repo[:owner][:login]).to eq('wadtech')
    end
  end
end
