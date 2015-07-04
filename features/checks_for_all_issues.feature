Feature: checks for all issues
  In order to find all issues
  As a ruby developer
  I want to run warder with --all option

  Scenario: run warder with enabled all option
    Given I have valid_rails_app project in directory
    And I am on project directory
    When I run `warder --all`
    Then warder detects style guide issues
    Then warder detects magick numbers issues
    Then warder detects code complexity issues
    Then warder detects code duplication issues
    Then warder detects code smell issues
    Then warder detects sandi rules violations
    Then warder detects rails best practices issues
    Then warder detects rails security issues
    Then warder detects gem freshness issues
    Then warder detects coffee lint issues
    Then the exit status should be 0

  Scenario: run warder with enabled rails option on invalid project
    Given I have invalid_rails_app project in directory
    And I am on project directory
    When I run `warder --all`
    Then warder detects style guide issues
    Then warder detects magick numbers issues
    Then warder detects code complexity issues
    Then warder detects code duplication issues
    Then warder detects code smell issues
    Then warder detects sandi rules violations
    Then warder detects rails best practices issues
    Then warder detects rails security issues
    Then warder detects gem freshness issues
    Then warder detects coffee lint issues
    Then the exit status should be 10
