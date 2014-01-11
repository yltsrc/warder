Feature: checks for rails related security issues
  In order to find security issues
  As a ruby developer
  I want to run warder with --rails-security option

  Scenario: run warder with enabled rails security option
    Given I have valid_rails_app project in directory
    And I am on project directory
    When I run `warder --rails-security`
    Then warder detects rails security issues
    Then the exit status should be 0

  Scenario: run warder with enabled rails security option on invalid project
    Given I have invalid_rails_app project in directory
    And I am on project directory
    When I run `warder --rails-security`
    Then warder detects rails security issues
    Then the exit status should be 1

  Scenario: run warder with disabled rails security option on invalid project
    Given I have invalid_rails_app project in directory
    And I am on project directory
    When I run `warder --no-rails-security`
    Then warder does nothing
    Then the exit status should be 0
