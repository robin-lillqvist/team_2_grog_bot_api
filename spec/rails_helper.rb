require "coveralls"
Coveralls.wear_merged!("rails")
require "webmock/rspec"
WebMock.enable!

ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../config/environment", __dir__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"
require "spec_helper"

ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/support/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
  config.include ResponseJSON
  config.before do
    stub_request(:get, %r{https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?}).
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Host'=>'www.thecocktaildb.com',
       	  'User-Agent'=>'rest-client/2.1.0 (darwin19.2.0 x86_64) ruby/2.5.1p57'
           }).
         to_return(status: 200, body: file_fixture("cocktails_api_lime_juice_response.json").read, headers: {})
  end
end
