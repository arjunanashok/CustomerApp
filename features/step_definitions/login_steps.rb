Given(/^I am in login page$/) do
  @customer_app = CustomerApp.new
  @customer_app.login.load


end

When(/^I submit login details$/) do
  @customer_app.login.go_button.click
end

And(/^I have entered userid "(.*?)"$/) do |login_id|
  enter_text(@customer_app.login.login_id,login_id)
  @customer_app.login.go_button.click
  @customer_app.login.wait_for_password
end

And(/^I have entered password "(.*?)"$/) do |password|
  enter_text(@customer_app.login.password,password)
end

And(/^I have entered security answer "(.*?)"$/) do |security_answer|
  enter_text(@customer_app.login.security_answer,security_answer)
end


Then(/^am shown "([^"]*)" message$/) do |expected_error_message|
  case expected_error_message
    when "Please Enter Login ID"
      verify_error_message(@customer_app.login.username_error_message, expected_error_message)
    when "Please Enter Password"
      verify_error_message(@customer_app.login.password_error_message, expected_error_message )
    when "Please Enter Security Answer"
      verify_error_message(@customer_app.login.security_error_message, expected_error_message )
    when "Authentication failed with the supplied credentials"
      verify_error_message(@customer_app.login.authentication_error_message, expected_error_message )
    when "Please Select Currency to Sell"
      verify_error_message(@customer_app.convert.sell_currency_error_message, expected_error_message)
    when "Please Select Currency to buy"
      verify_error_message(@customer_app.convert.buy_currency_error_message, expected_error_message)
    when "Minimum Value is 1"
      verify_error_message(@customer_app.convert.amount_error_message, expected_error_message)
    else
      raise  "Undefinied error message : #{expected_error_message}"
  end
end


Then(/^am in dashboard page$/) do
  @customer_app.dashboard.title.should == 'TCC Direct'
end

Given(/^I have logged in with user_id "(.*?)"$/) do |user_id|
  @customer_app = CustomerApp.new
  @customer_app.login.load

  enter_text(@customer_app.login.login_id,user_id)
  @customer_app.login.go_button.click

  @customer_app.login.wait_for_password
  enter_text(@customer_app.login.password,'test')
  enter_text(@customer_app.login.security_answer,'test')
  @customer_app.login.go_button.click
  @customer_app.dashboard.wait_for_active_tab
  @customer_app.dashboard.title.should == 'TCC Direct'
end
Then(/^all elements in "([^"]*)"$/) do |page|
  require 'site_prism/element_checker'

  puts "going to verify the page all elements"
  sleep(5.to_i)
  puts "the result is #{@customer_app.login}"



  verify_all_elements(@customer_app.convert)

end