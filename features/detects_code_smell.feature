Feature: detects code smell
  In order to find code smell
  As a ruby developer
  I want to run warder with --code-smell option

  Scenario: run warder with enabled code smell option
    Given I have valid file in directory
    When I run `warder --code-smell`
    Then warder detects code smell issues
    Then the exit status should be 0

  Scenario: run warder with enabled code smell option on invalid file
    Given I have invalid_code_smell file in directory
    When I run `warder --code-smell`
    Then warder detects code smell issues
    Then the exit status should be 1

  Scenario: run warder with enabled code smell option on valid file only
    Given I have valid file in directory
    And I have invalid_code_smell file in directory
    When I run `warder --code-smell valid.rb`
    Then warder does nothing
    Then the exit status should be 0

  Scenario: run warder with disabled code smell option on invalid file
    Given I have invalid_code_smell file in directory
    When I run `warder --no-code-smell`
    Then warder does nothing
    Then the exit status should be 0
