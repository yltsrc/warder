Feature: detects code smells
  In order to find code smells
  As a ruby developer
  I want to run warder with --code-smells option

  Scenario: run warder with enabled code smells option
    Given I have valid file in directory
    When I run `warder --code-smells`
    Then warder detects code smells
    Then the exit status should be 0

  Scenario: run warder with enabled code smells option on invalid file
    Given I have invalid_code_smells file in directory
    When I run `warder --code-smells`
    Then warder detects code smells
    Then the exit status should be 1

  Scenario: run warder with enabled code smells option on valid file only
    Given I have valid file in directory
    And I have invalid_code_smells file in directory
    When I run `warder --code-smells valid.rb`
    Then warder does nothing
    Then the exit status should be 0

  Scenario: run warder with disabled code smells option on invalid file
    Given I have invalid_code_smells file in directory
    When I run `warder --no-code-smells`
    Then warder does nothing
    Then the exit status should be 0
