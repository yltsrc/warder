Feature: checks for Sandi Metz rules violations
  In order to find Sandi Metz rules violations
  As a ruby developer
  I want to run warder with --sandi-rules option

  Scenario: run warder with enabled sandi rules option
    Given I have valid_rails_app project in directory
    And I am on project directory
    When I run `warder --sandi-rules`
    Then warder detects sandi rules violations
    Then the exit status should be 0

  Scenario: run warder with enabled sandi rules option on invalid project
    Given I have invalid_rails_app project in directory
    And I am on project directory
    When I run `warder --sandi-rules`
    Then warder detects sandi rules violations
    Then the exit status should be 1

  Scenario: run warder with disabled sandi rules option on invalid project
    Given I have invalid_rails_app project in directory
    And I am on project directory
    When I run `warder --no-sandi-rules`
    Then warder does nothing
    Then the exit status should be 0
