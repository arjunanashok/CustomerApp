When(/^I navigate to "(.*?)" page$/) do |page|

  case page
    when "convert"
      @customer_app.convert.load
    when "forgot_password"
      @customer_app.forget_password.load
    when "payment"
      @customer_app.payment.load
    else
      raise "The given navigation #{page} page is not defined "
  end
end

Then(/^am in "(.*?)" page$/) do |page|

  case page
    when "forgot password"
      @customer_app.forget_password.form.should have_send_button
      @customer_app.forget_password.form.should have_username
  end
end