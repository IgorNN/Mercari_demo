class SignUpScreen < ScreenActions

  def displayed?
    displayed = wait_for_static_text_to_exist 'Quickly Sign up with'
    logger.info "Sign Up Screen: 'Quickly Sign up with' message is displayed? = #{displayed}"
    return displayed
  end

  def register_user_name username
    fill_id('com.mercariapp.mercari:id/nick_name', username)
    logger.info "Sign Up Screen: user name = #{username}"
  end

  def register_email email
    fill_id('com.mercariapp.mercari:id/email', email)
    logger.info "Sign Up Screen: user email = #{email}"
  end

  def resister_pass pass
    fill_id('com.mercariapp.mercari:id/password', pass)
    logger.info "Sign Up Screen: user password = #{pass}"
  end

  def resister_phone phone_num
    fill_id('com.mercariapp.mercari:id/phone_number_et', phone_num)
    logger.info "Sign Up Screen: user phone number = #{phone_num}"
  end

end

