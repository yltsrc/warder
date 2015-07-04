Feature: check coffeescript style guide
  In order to check coffeescript style guide
  As a coffeescript developer
  I want to run warder with --coffee-lint option

  Scenario: run warder with enabled coffee lint option
    Given I have valid_coffee_lint file in directory
    When I run `warder --coffee-lint`
    Then warder detects coffee lint issues
    Then the exit status should be 0

  Scenario: run warder with enabled coffee lint option on invalid file
    Given I have invalid_coffee_lint file in directory
    When I run `warder --coffee-lint`
    Then warder detects coffee lint issues
    Then the exit status should be 1

  Scenario: run warder with enabled coffee lint option on valid file only
    Given I have valid_coffee_lint file in directory
    And I have invalid_coffee_lint file in directory
    When I run `warder --coffee-lint valid_coffee_lint.coffee`
    Then warder does nothing
    Then the exit status should be 0

  Scenario: run warder with disabled coffee lint option on invalid file
    Given I have invalid_coffee_lint file in directory
    When I run `warder --no-coffee-lint`
    Then warder does nothing
    Then the exit status should be 0
