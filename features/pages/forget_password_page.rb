class ForgotPasswordSection < SitePrism::Section
  element :send_button , "#send-btn"
  element :username, "#username"
  element :username_error_message, "span[data-bind='validationMessage: username']"
end


class ForgotPassword_page  < SitePrism::Page
  set_url "#{$base_url}/sessions/forgotten_password"
  section :form, ForgotPasswordSection, "#forgotten_password_form"

  element :mail_sent_message, "div.alert.alert-success > p"
end