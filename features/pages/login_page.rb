class FormSection < SitePrism::Section
  element :login_id, "#username"
  element :password, "#password"
  element :security_answer, "#secret_question_answer"
  element :go_button, "#go-btn"
  element :secret_question_answer, "input[name='secret_question_answer']"
  element :login_button, "button[id='go-btn']"
  element :forgot_password, "a.b-login__form_pf"
  element :password_error_message, "span[data-bind='validationMessage: password']"
  element :username_error_message, "span[data-bind='validationMessage: username']"
  element :security_error_message, "span[data-bind='validationMessage: secretAnswer']"

end



class LoginPage < SitePrism::Page
  set_url "#{$base_url}/login"

  section :form, FormSection, "#login_form"
  element :authentication_error_message, "h4[data-bind='text: alertMsg']"

end
