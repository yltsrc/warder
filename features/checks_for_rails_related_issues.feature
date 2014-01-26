Feature: checks for rails related issues
  In order to find rails related issues
  As a ruby developer
  I want to run warder with --rails option

  Scenario: run warder with enabled rails option
    Given I have valid_rails_app project in directory
    And I am on project directory
    When I run `warder --rails`
    Then warder detects rails best practices issues
    Then warder detects rails security issues
    Then the exit status should be 0

  Scenario: run warder with enabled rails option on invalid project
    Given I have invalid_rails_app project in directory
    And I am on project directory
    When I run `warder --rails`
    Then warder detects rails best practices issues
    Then warder detects rails security issues
    Then the exit status should be 2

  Scenario: run warder with disabled rails option on invalid project
    Given I have invalid_rails_app project in directory
    And I am on project directory
    When I run `warder --no-rails`
    Then warder does nothing
    Then the exit status should be 0
