Feature: check style guide
  In order to check style guide
  As a ruby developer
  I want to run warder with --style-guide option

  Scenario: run warder with enabled style guide option
    Given I have valid file in directory
    When I run `warder --style-guide`
    Then warder detects style guide issues
    Then the exit status should be 0

  Scenario: run warder with enabled style guide option on invalid file
    Given I have invalid_style_guide file in directory
    When I run `warder --style-guide`
    Then warder detects style guide issues
    Then the exit status should be 1

  Scenario: run warder with enabled style guide option on valid file only
    Given I have valid file in directory
    And I have invalid_style_guide file in directory
    When I run `warder --style-guide valid.rb`
    Then warder does nothing
    Then the exit status should be 0

  Scenario: run warder with disabled style guide option on invalid file
    Given I have invalid_style_guide file in directory
    When I run `warder --no-style-guide`
    Then warder does nothing
    Then the exit status should be 0
