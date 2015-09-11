require 'spec_helper'

describe MainBoard do
  before(:each) do
    @main_board = FactoryGirl.build :main_board
  end

  it 'is valid with valid attributes' do
    expect(@main_board).to be_valid
  end

  it 'is not valid without a title' do
    @main_board.title = nil
    expect(@main_board).not_to be_valid
  end

  it 'is not valid without an account' do
    @main_board.account = nil
    expect(@main_board).not_to be_valid
  end
end
# == Schema Information
#
# Table name: mainboard
#
#  threadid    :integer         not null, primary key
#  title       :string(128)
#  created     :datetime
#  lastupdated :datetime
#  userid      :integer(2)      default(0), not null
#
