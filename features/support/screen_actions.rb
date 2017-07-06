class ScreenActions
  include RSpec::Matchers


  def rescue_exceptions
    begin
      yield
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
    rescue Selenium::WebDriver::Error::TimeOutError
      false
    end
  end

  def generate_random length
     SecureRandom.hex()[0..length]
  end

  def find_button button
    button_exact(button)
  end

  def wait_for_button_to_exist button
    rescue_exceptions { $wait.until { find_button(button).displayed? } }
  end

  def click_button button
    expect(wait_for_button_to_exist button).to be true
    button = find_button(button)
    expect(button.enabled?).to be true
    button.click
    sleep(*3)
  end

  def find_static_text text
     text_exact(text)
  end

  def wait_for_static_text_to_exist text
     rescue_exceptions { $wait.until { find_static_text(text).displayed? } }
  end

  def click_text_view text
    expect(wait_for_static_text_to_exist text).to be true
    element = find_static_text text
    element.click
  end

  def find_text_field text
     textfield_exact(text)
  end

  def wait_for_text_field_to_exist text
     rescue_exceptions { $wait.until { find_text_field(text).displayed? } }
  end

  def fill_text field, input
    expect(wait_for_text_field_to_exist field).to be true
    element = find_text_field field
    input_data element, input
    dont_show_keyboard
  end

  def find_secure_field text
     find_exact(text)
  end

  def wait_for_secure_field_to_exist text
     rescue_exceptions { $wait.until { find_secure_field(text).displayed? } }
  end

  def fill_password field, input
    expect(wait_for_secure_field_to_exist field).to be true
    element = find_secure_field field
    input_data element, input
    dont_show_keyboard
  end

  def dont_show_keyboard
    begin
      hide_keyboard
    rescue => e
    end
  end

  def input_data element, input
    element.clear
    element.send_keys input
  end

  def fill_first_text_field input
     element = first_textfield
     element.clear
     element.send_keys input
  end

  def first_element element_class
    first_ele element_class
  end

  def wait_for_id_to_exist element_id
    rescue_exceptions { $wait.until { id(element_id).displayed? } }
  end

  def fill_id element_id, text
    expect(wait_for_id_to_exist element_id).to be true
    id(element_id).clear
    id(element_id).send_keys text
    hide_keyboard
  end

  def click_id element_id
    expect(wait_for_id_to_exist element_id).to be true
    id(element_id).click
  end

  def text_view_value element_id
    expect(wait_for_static_text_to_exist element_id).to be true
    find_static_text(element_id).text
  end

  def swipe_up
    endX = startX = window_size[:width]/2
    startY = window_size[:height] * 0.80 ;
    endY = window_size[:height] * 0.40
    swipe(start_x: startX, start_y: startY, end_x: endX, end_y: endY, duration: 600).perform
  end

  def swipe_left
    endy = starty = window_size[:height]/2
    startx = window_size[:width] * 0.20 ;
    endx = window_size[:width] * 0.80
    swipe(start_x: startx, start_y: starty, end_x: endx, end_y: endy, duration: 600).perform
  end

  def swipe_right
    end_Y = start_Y = window_size[:height]/2
    start_X = window_size[:width] * 0.80 ;
    end_X = window_size[:width] * 0.40
    swipe(start_x: start_X, start_y: start_Y, end_x: end_X, end_y: end_Y, duration: 300).perform
  end

  def tap_enter
    #system "adb shell input keyevent 'KEYCODE_ENTER'"
    press_keycode(66)
  end

def tap_action
  Appium::TouchAction.new.tap( x:0.99, y:0.99, count: 1).perform
  #max x = 1080, max y = 1912,
end

  def tap_search
    x = window_size[:width] * 0.99
    y = window_size[:height] * 0.99
    Appium::TouchAction.new.tap( x: x, y: y, count: 1).release.perform
  end

  def accept_all_alerts
       id = find_element(:id, 'com.android.packageinstaller:id/permission_message')
      while id.displayed?
      alert_accept
    end
  end

end
