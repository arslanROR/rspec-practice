RSpec.shared_context "shared stuff", :shared_context => :metadata do
  let(:user) { User.create!(name: 'arslan') }
  def do_test_response
    parsed_body = JSON.parse(response.body)
    expect(parsed_body['status']).to eq(200)
  end
end