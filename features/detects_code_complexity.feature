Feature: detects code complexity
  In order to find code complexity
  As a ruby developer
  I want to run warder with --code-complexity option

  Scenario: run warder with enabled code complexity option
    Given I have valid file in directory
    When I run `warder --code-complexity`
    Then warder detects code complexity issues
    Then the exit status should be 0

  Scenario: run warder with enabled code complexity option on invalid file
    Given I have invalid_code_complexity file in directory
    When I run `warder --code-complexity`
    Then warder detects code complexity issues
    Then the exit status should be 1

  Scenario: run warder with enabled code complexity option on valid file only
    Given I have valid file in directory
    And I have invalid_code_complexity file in directory
    When I run `warder --code-complexity valid.rb`
    Then warder does nothing
    Then the exit status should be 0

  Scenario: run warder with disabled code complexity option on invalid file
    Given I have invalid_code_complexity file in directory
    When I run `warder --no-code-complexity`
    Then warder does nothing
    Then the exit status should be 0

