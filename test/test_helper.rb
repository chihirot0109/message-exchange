<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> f21f061... tested index view
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

<<<<<<< HEAD
class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  include Devise::Test::IntegrationHelpers

end
=======
=======
>>>>>>> f21f061... tested index view
class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  include Devise::Test::IntegrationHelpers

end
<<<<<<< HEAD
Capybara.save_path = Rails.root.join('tmp/capybara')
Capybara.javascript_driver = :headless_chrome
>>>>>>> 43053ae... installed kaminari and paginate users
=======
>>>>>>> f21f061... tested index view
