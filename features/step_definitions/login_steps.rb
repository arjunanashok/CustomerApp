Given(/^I am in login page$/) do
  @customer_app = CustomerApp.new
  @customer_app.login.load
end

When(/^I submit login details$/) do
  @customer_app.login.form.go_button.click
end

And(/^I have entered userid "(.*?)"$/) do |user_name|
  enter_text(@customer_app.login.form.login_id,user_name)
  @customer_app.login.form.go_button.click
  @customer_app.login.form.wait_for_password
end

And(/^I have entered password "(.*?)"$/) do |password|
  enter_text(@customer_app.login.form.password,password)
end

And(/^I have entered security answer "(.*?)"$/) do |security_answer|
  enter_text(@customer_app.login.form.security_answer,security_answer)
end


Then(/^am shown "(.*?)" message in "(.*?)" page$/) do |expected_error_message, page|
  case expected_error_message
    when "Please Enter Login ID"
      if page == "login"
        verify_error_message(@customer_app.login.form.username_error_message, expected_error_message)
      else
        verify_error_message(@customer_app.forget_password.form.username_error_message, expected_error_message)
      end

    when "Please Enter Password"
      verify_error_message(@customer_app.login.form.password_error_message, expected_error_message )
    when "Please Enter Security Answer"
      verify_error_message(@customer_app.login.form.security_error_message, expected_error_message )
    when "Authentication failed with the supplied credentials"
      verify_error_message(@customer_app.login.authentication_error_message, expected_error_message )
    when "Please Select Currency to Sell"
      verify_error_message(@customer_app.convert.sell_currency_error_message, expected_error_message)
    when "Please Select Currency to buy"
      verify_error_message(@customer_app.convert.buy_currency_error_message, expected_error_message)
    when "Minimum Value is 1"
      if page == "login"
        verify_error_message(@customer_app.convert.amount_error_message, expected_error_message)
      else
        verify_error_message(@customer_app.payment.form.amount_error_message, expected_error_message)
      end
    when "You will receive an email to reset your security details"
      verify_error_message(@customer_app.forget_password.mail_sent_message, expected_error_message)
    when "Select Currency"
      verify_error_message(@customer_app.payment.form.currency_error_message, expected_error_message)
    when "Select Beneficiary Name"
      verify_error_message(@customer_app.payment.form.beneficiary_error_message,expected_error_message)
    when "Select Beneficiary Account"
      verify_error_message(@customer_app.payment.form.account_error_message,expected_error_message)
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

  enter_text(@customer_app.login.form.login_id,user_id)
  @customer_app.login.form.go_button.click

  @customer_app.login.form.wait_for_password
  enter_text(@customer_app.login.form.password,'test')
  enter_text(@customer_app.login.form.security_answer,'test')
  @customer_app.login.form.go_button.click
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


When(/^I select forgot password$/) do
  @customer_app.login.form.forgot_password.click
end