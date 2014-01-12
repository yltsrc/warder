Feature: checks for rails best practices advices
  In order to get rails advices
  As a ruby developer
  I want to run warder with --rails-advice option

  Scenario: run warder with enabled rails advice option
    Given I have valid_rails_app project in directory
    And I am on project directory
    When I run `warder --rails-advice`
    Then warder detects rails best practices issues
    Then the exit status should be 0

  Scenario: run warder with enabled rails advice option on invalid project
    Given I have invalid_rails_app project in directory
    And I am on project directory
    When I run `warder --rails-advice`
    Then warder detects rails best practices issues
    Then the exit status should be 1

  Scenario: run warder with disabled rails advice option on invalid project
    Given I have invalid_rails_app project in directory
    And I am on project directory
    When I run `warder --no-rails-advice`
    Then warder does nothing
    Then the exit status should be 0
