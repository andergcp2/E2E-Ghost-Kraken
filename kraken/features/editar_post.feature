Feature: Update Post escenario positivo

@user8 @web
Scenario: Update post
    Given I navigate to page "http://localhost:2368/ghost/#/signin"
    And I wait for 1 seconds
    When I enter email "<USERNAME1>"
    And I wait for 1 seconds
    And I enter password "<PASSWORD1>"
    And I click Sign in
    And I wait for 2 seconds
    And I click in Posts
    And I wait for 2 seconds
    And I select the first post at list
    And I wait for 2 seconds
    And I enter text "$name_1" into field post title
    And I wait for 2 seconds
    And I click into post body
    And I wait for 2 seconds
    And I enter text "$string_1" into post body
    And I wait for 2 seconds
    And I click span for publish
    And I wait for 2 seconds
    And I click on update button 
    And I wait for 2 seconds
    And I click link to return to Posts
    And I wait for 3 seconds
    And I click on User menu
    And I wait for 1 seconds
    And I click Sing Out
    And I wait for 2 seconds
    And I navigate to page "http://localhost:2368"
    And I wait for 2 seconds
    Then I search new post with title "$$name_1"

