@lightning @api @lightning_api @with-module:api_tests
Feature: JSON API for decoupled applications

  @23138ee5
  Scenario: Viewing a content entity as JSON
    Given I am logged in as a user with the administrator role
    And page content:
      | title  |
      | Foobar |
    When I visit "/admin/content"
    And I click "View JSON"
    Then the response status code should be 200

  @160f8533
  Scenario Outline: Viewing a config entity as JSON
    Given I am logged in as a user with the administrator role
    When I visit "<url>"
    And I click "View JSON"
    Then the response status code should be 200

    Examples:
      | url                      |
      | /admin/structure/types   |
      | /admin/structure/views   |

  @c7366331
  Scenario: Accessing documentation on path alias
    Given I am logged in as a user with the administrator role
    When I visit "/api-docs"
    Then the response status code should be 200

  @5255d0d7
  Scenario: Viewing content type documentation
    Given I am logged in as a user with the administrator role
    When I visit "/admin/structure/types"
    And I click "View API documentation"
    Then the response status code should be 200
