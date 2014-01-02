Feature: detects code duplication
  In order to find code duplication
  As a ruby developer
  I want to run warder with --code-duplication option

  Scenario: run warder with enabled code duplication option
    Given I have valid file in directory
    When I run `warder --code-duplication`
    Then warder detects code duplication issues
    Then the exit status should be 0

  Scenario: run warder with enabled code duplication option on invalid file
    Given I have invalid_code_duplication file in directory
    When I run `warder --code-duplication`
    Then warder detects code duplication issues
    Then the exit status should be 1

  Scenario: run warder with enabled code duplication option on valid file only
    Given I have valid file in directory
    And I have invalid_code_duplication file in directory
    When I run `warder --code-duplication valid.rb`
    Then warder does nothing
    Then the exit status should be 0

  Scenario: run warder with disabled code duplication option on invalid file
    Given I have invalid_code_duplication file in directory
    When I run `warder --no-code-duplication`
    Then warder does nothing
    Then the exit status should be 0
