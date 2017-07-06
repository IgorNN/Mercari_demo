class MercariApp

## Instantiate screens in alphabetical order

  def sign_up_screen
    @sign_up_screen ||= SignUpScreen.new
  end

  def start_screen
    @start_screen ||= StartScreen.new
  end




end

