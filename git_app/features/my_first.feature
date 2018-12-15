Feature: Git Projects

  Scenario: List all pull request
    When I found the project "spring-boot"
    Then a list all pull requests and stars
    When click in the project
    Then a list all commits
