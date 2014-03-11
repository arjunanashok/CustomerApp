class Beneficiary_page  < SitePrism::Page
  set_url "#{$base_url}/payments/add_bank_account"

  element :nickname, "input[id='bank_nickname']"
  element :currency, "input[id='bank_acct_ccy_input']"
  element :beneficiary_name, "input[id='bank_beneficiary_name']"
  element :destination, "input[id='bank_destination_country_code_input']"
  element :next_button, "input[id='add_bank_acct']"
end