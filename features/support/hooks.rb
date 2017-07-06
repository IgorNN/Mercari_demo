Before do |scenario|
  $driver.start_driver
 # if scenario != "User able to sign up with email"
   # appActivity = com.mercariapp.mercari/com.kouzoh.mercari.activity.HomeActivity
 # end
  logger.info("Scenario: #{scenario.name} Started..")
end

After do |scenario|
  system("adb logcat -d >> logcat_logs.txt")

  if scenario.failed?
    unless File.directory?("screenshots")
      FileUtils.mkdir_p("screenshots")
    end

    time_stamp = Time.now.strftime("%Y-%m-%d_at_%H.%M.%S")
    screenshot_name = "#{time_stamp}.png"
    screenshot_file = File.join("screenshots", screenshot_name)
    $driver.screenshot(screenshot_file)
    embed("screenshots/#{screenshot_file}", "image/png")
  end

  $driver.driver_quit
  if scenario.failed?
    logger.info("Scenario: #{scenario.name} Failed!")
  else
    logger.info("Scenario: #{scenario.name} Passed.")
  end
end

AfterConfiguration do
  FileUtils.rm_r("screenshots") if File.directory?("screenshots")
end