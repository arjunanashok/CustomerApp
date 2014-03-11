class ConfirmationSection < SitePrism::Section
  element :reference, "#trade-reference"
  element :user_email, "#current-user_email"
  element :pay_now_button, "#pay-now-btn"
  element :sold_currency , "p#sell-ccy"
  element :brought_currency,"p#buy-ccy"
  element :brought_amount, "p#buy-amount-numbers"
  element :sold_amount, "p#sell-amount-numbers"


end

class QuoteSection <   SitePrism::Section
  element :amount_dropdown, "div.input-group.b-input__select.b-input__select--amount span.caret"
  elements :amount_dropdown_result, "div.btn-group.select.select-block ul.dropdown-menu li a span"
end



class Convert_page < SitePrism::Page
  set_url "#{$base_url}/convert/new"

  element :select_sell_currency, "div#s2id_sell_currency span.arrow.fui-triangle-down-small"
  element :select_buy_currency, "div#s2id_buy_currency span.arrow.fui-triangle-down-small"
  element :type_sell_currency, "div.select2-search > input.form-control"

  element :get_quote, "button#client-quote-btn"
  element :sell_currency_error_message, "span[data-bind='validationMessage: sellCcy']"
  element :buy_currency_error_message, "span[data-bind='validationMessage: buyCcy']"
  element :amount_error_message, "span[data-bind='validationMessage: amount']"
  element :search_results, "div.select2-result-label"
  element :amount, "input#amount"
  element :trade_confirm, "button#requote-btn"
  element :trade_reference, "p#trade-reference"
  element :trade_success_message, "div.alert.alert-success > h4"


  element :pay_now, ".input-group.b-input__select.b-input__select--amount input#amount"

  section :confirmation,ConfirmationSection, "#conversion-third-step"
  section :quote, QuoteSection,"#conversion-first-step"

end