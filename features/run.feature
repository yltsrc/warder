Feature: run warder
  In order to check project codebase
  I want to run warder

  Scenario: run warder with no options
    Given I have valid file in directory
    When I run `warder`
    Then warder does nothing
    And the exit status should be 0
