class PaymentSection < SitePrism::Section
  element :currency_error_message, "span[data-bind='validationMessage: currency']"
  element :make_payment_button, "#client-quote-btn"
  element :drop_down, ".arrow.fui-triangle-down-small"
  element :amount, "#amount"
  element :amount_error_message, "span[data-bind='validationMessage: amount']"
  element :beneficiary_error_message, "span[data-bind='validationMessage: beneficiaryName']"

end

class DropDownResult < SitePrism::Section
  element :type_text, "input.form-control"
  element :type_result, ".select2-result-label"

end


class Payment_Page  < SitePrism::Page
  set_url "#{$base_url}/payments/new"

  section :form, PaymentSection, ".b-wizard__steps"


  section :drop_down_form, DropDownResult, "#select2-drop"

end