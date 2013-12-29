Feature: detects magick numbers
  In order to find magick numbers
  As a ruby developer
  I want to run warder with --magick-numbers option

  Scenario: run warder with enabled magick numbers option
    Given I have valid file in directory
    When I run `warder --magick-numbers`
    Then warder detects magick numbers
    Then the exit status should be 0

  Scenario: run warder with enabled magick numbers option on invalid file
    Given I have invalid_magick_numbers file in directory
    When I run `warder --magick-numbers`
    Then warder detects magick numbers
    Then the exit status should be 1

  Scenario: run warder with enabled magick numbers option on valid file only
    Given I have valid file in directory
    And I have invalid_magick_numbers file in directory
    When I run `warder --magick-numbers valid.rb`
    Then warder does nothing
    Then the exit status should be 0

  Scenario: run warder with disabled style guide option on invalid file
    Given I have invalid_magick_numbers file in directory
    When I run `warder --no-magick-numbers`
    Then warder does nothing
    Then the exit status should be 0
