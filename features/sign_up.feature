@wip
Feature: User onboarding, sign up with email

  Scenario: User able to sign up with email
    Given I land on Start screen
    And I verify that message is displayed "Easily buy & sell"
    And I swipe right
    Then I verify that message is displayed "Find what you've been" and "Get the best deals delivered"
    And I swipe right
    Then I verify that message is displayed "Clean out your closet!" and "List your items and make extra cash"
    And I tap on button "Get Started"
    Then I Land on Sign up screen
    Then I tap on button "Email"
    Then Enter Email
    And Enter Password
    Then Enter User Name
    Then I select gender "N/A"
    Then I tap on button "Sign up"
    And I accept alerts if any
    Then Enter Phone Number
    And I tap on button "Next"
    And I tap on button "Complete sign up"


