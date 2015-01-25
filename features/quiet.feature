Feature: run warder in quiet mode
  In order to silent validators output
  As a ruby developer
  I want to run warder with --quiet option

  Scenario: run warder with enabled quiet option
    Given I have valid file in directory
    When I run `warder --quiet --magick-numbers`
    Then warder detects no magick numbers issues
    And the exit status should be 0
