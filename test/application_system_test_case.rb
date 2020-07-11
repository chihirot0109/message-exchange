class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :headless_chrome
end
