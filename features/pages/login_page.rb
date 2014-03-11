class FormSection < SitePrism::Section
  element :password, "input[id='password']"
  element :security_question, "input[id='security_answer']"
  element :go_button, "input[name='loginButtonGo']"
  element :secret_question_answer, "input[name='secret_question_answer']"


  #element :login_id, "input[id='username']"

  element :login_button, "button[id='go-btn']"


end

class LoginPage < SitePrism::Page
  set_url "#{$base_url}/login"


  section :form, FormSection, "#login_form"
  element :login_id, "form[id='login_form'] div[class='b-input form-group'] input[id='username']"
  element :password, "form[id='login_form'] div[class='b-input form-group'] input[id='password']"
  element :security_answer, "form[id='login_form'] div[class='b-input form-group'] input[id='secret_question_answer']"
  element :go_button , "button[id='go-btn']"

  element :password_error_message, "span[data-bind='validationMessage: password']"
  element :security_error_message, "span[data-bind='validationMessage: secretAnswer']"
  element :username_error_message, "span[data-bind='validationMessage: username']"
  element :authentication_error_message, "h4[data-bind='text: alertMsg']"


end

