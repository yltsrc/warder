Feature: detects code duplications
  In order to find code duplications
  As a ruby developer
  I want to run warder with --code-duplications option

  Scenario: run warder with enabled code duplications option
    Given I have valid file in directory
    When I run `warder --code-duplications`
    Then warder detects code duplications
    Then the exit status should be 0

  Scenario: run warder with enabled code duplications option on invalid file
    Given I have invalid_code_duplications file in directory
    When I run `warder --code-duplications`
    Then warder detects code duplications
    Then the exit status should be 1

  Scenario: run warder with disabled code duplications option on invalid file
    Given I have invalid_magick_numbers file in directory
    When I run `warder --no-code-duplications`
    Then warder does nothing
    Then the exit status should be 0
