require 'rails_helper'
describe AvailLink do
  before(:each) do
    @avail_link = AvailLink.new
  end

  it 'is valid with valid attributes' do
    expect(@avail_link).to be_valid
  end

end
# == Schema Information
#
# Table name: avail_links
#
#  linknum   :integer         not null, primary key
#  linkname  :string(128)
#  descr     :text
#  html_code :text(255)
#  static    :text(255)
#
