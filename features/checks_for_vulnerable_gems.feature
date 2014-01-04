Feature: checks for vulnerable gems
  In order to find vulnerable gems
  As a ruby developer
  I want to run warder with --bundle-audit option

  Scenario: run warder with enabled bundle audit option
    Given I have valid gemfile in directory
    When I run `warder --bundle-audit`
    Then warder detects gem freshness issues
    Then the exit status should be 0

  Scenario: run warder with enabled bundle audit option on invalid file
    Given I have invalid gemfile in directory
    When I run `warder --bundle-audit`
    Then warder detects gem freshness issues
    Then the exit status should be 1

  Scenario: run warder with disabled bundle audit option on invalid file
    Given I have invalid gemfile in directory
    When I run `warder --no-bundle-audit`
    Then warder does nothing
    Then the exit status should be 0
