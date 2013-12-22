Feature: check style guide
  In order to check style guide
  As a ruby developer
  I want to run warder with --style-guide option

  Scenario: run warder with enabled style guide option
    Given I have valid file in directory
    When I run `warder --style-guide`
    Then warder validates style guide
    Then the exit status should be 0

  Scenario: run warder with enabled style guide option
    Given I have invalid_style_guide file in directory
    When I run `warder --style-guide`
    Then warder validates style guide
    Then the exit status should be 1
