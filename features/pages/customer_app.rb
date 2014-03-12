class CustomerApp

  def login
    LoginPage.new
  end

  def beneficiary
    Beneficiary_page.new
  end

  def dashboard
    Dashboard_Page.new
  end

  def convert
    Convert_page.new
  end

  def forget_password
    ForgotPassword_page.new
  end

  def payment
    Payment_Page.new
  end
end