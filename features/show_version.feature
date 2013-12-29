Feature: show version
  In order to check program version
  I want to run warder with --version option

  Scenario: run warder with enabled version option
    When I run `warder --version`
    Then warder shows version
    And the exit status should be 0
