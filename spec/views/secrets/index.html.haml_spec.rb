require 'rails_helper'

describe 'secrets/index.html.haml' do
  before(:each) do
    assign(:secrets, [
      stub_model(Secret),
      stub_model(Secret)
    ])
  end

  it 'renders a list of secrets'
end
