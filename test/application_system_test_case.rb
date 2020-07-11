<<<<<<< HEAD
<<<<<<< HEAD
require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
=======
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :headless_chrome
>>>>>>> 43053ae... installed kaminari and paginate users
=======
require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
>>>>>>> f21f061... tested index view
end
