require "factory_girl"

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:all) do
    FactoryGirl.find_definitions if FactoryGirl.factories.count == 0 # I also tried FactoryGirl.reload here
  end
end
