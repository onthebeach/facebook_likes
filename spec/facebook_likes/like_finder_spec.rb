require 'spec_helper'

describe LikeFinder do
  it 'returns the number of likes we have on the facebook' do
    LikeFinder.new.likes.should be_a Fixnum
  end
end
