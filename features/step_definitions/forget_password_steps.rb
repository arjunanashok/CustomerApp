When(/^I submit the details in "(.*?)" page$/) do |page|
  case page
    when "forgot_password"
      @customer_app.forget_password.form.send_button.click
    when "payment"
      @customer_app.payment.form.make_payment_button.click

  end

end

And(/^I have submitted my user details "(.*?)"$/) do |user_details|
  enter_text(@customer_app.forget_password.form.username,user_details)
end
