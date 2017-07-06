class StartScreen < ScreenActions

  def displayed?
    displayed = wait_for_id_to_exist 'com.mercariapp.mercari:id/button_next'
    logger.info "Start Screen: 'GET STARTED' button is displayed? = #{displayed}"
    return displayed
  end


end

