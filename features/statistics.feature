Feature: run warder in statistics mode
  In order to get results
  As a ruby developer
  I want to run warder with --stats option

  Scenario: run warder with enabled stats option
    Given I have valid file in directory
    When I run `warder --stats --magick-numbers`
    Then 0 magick numbers stats should be printed
    And the exit status should be 0

  Scenario: run warder with enabled stats option on invalid rails app
    Given I have invalid_rails_app project in directory
    When I run `warder --stats --sandi-rules`
    Then the output should contain "broken 3 out of 4 sandi rules"
    And the exit status should be 1

  Scenario: run warder with disabled stats option
    Given I have valid file in directory
    When I run `warder --no-stats --code-complexity`
    Then 0 code complexity stats should not be printed
    And the exit status should be 0
