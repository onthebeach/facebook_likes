require 'spec_helper'

describe FacebookLikes do
  subject { FacebookLikes.new }

  describe '#status' do
    it 'returns 200 success' do
      subject.status.should eq 200
    end
  end

  describe '#headers' do
    it 'prevents caching' do
      subject.headers.fetch('Cache-Control').should eq 'max-age=0, no-cache, no-store, must-revalidate'
    end
    it 'describes the image type' do
      subject.headers.fetch('Content-Type').should eq 'image/png'
    end
  end

  describe '#body' do
    it 'returns the contents of banner.png' do
      subject.body.should eq File.read('banner.png')
    end
  end
end
