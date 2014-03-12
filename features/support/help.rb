module Helpers
  include RSpec::Matchers
  include SitePrism::ElementChecker

  def select_value(webelement, search_text)
    enter_text(webelement, search_text)
    webelement.native.send_keys(:return)
  end

  def enter_text(webelement, enter_text)
    webelement.set enter_text
    webelement.value.should match (enter_text)
  end

  def verify_error_message(webelement, expected_error_message)
    verify_message(webelement, expected_error_message)
  end

  def verify_tab(tab)
    @customer_app.dashboard.wait_for_active_tab
    @customer_app.dashboard.active_tab[:href].should match(tab)
  end

  def verify_all_elements(webelement)
    puts "the weblement is #{webelement.inspect}"
    #all_there?(webelement)
    webelement.all_there?
  end

  def verify_message(webelement, expected_error_message)
    actual_text = webelement.text.strip.downcase

    actual_text.should match(expected_error_message.downcase)
  end

  def select_from_list(webelement,select_text)
    obj = webelement.select{|obj| obj.text.downcase == select_text.downcase}[0]
    obj.click
  end

end