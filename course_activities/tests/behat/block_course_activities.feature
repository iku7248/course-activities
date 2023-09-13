@block @block_course_activities
Feature: Block course activities
  In order to view activity modules in a course
  As a manager
  I can add activities block in a course
  Scenario: Add activities block in a course
    Given the following "courses" exist:
      | fullname | shortname | format |
      | Course 1 | C1        | topics |
    And the following "activities" exist:
      | activity   | name                   | intro                         | course | idnumber    |
      | assign     | Test assignment name   | Test assignment description   | C1     | assign1     |
      | book       | Test book name         | Test book description         | C1     | book1       |
      | chat       | Test chat name         | Test chat description         | C1     | chat1       |
      | choice     | Test choice name       | Test choice description       | C1     | choice1     |
      | data       | Test database name     | Test database description     | C1     | data1       |
      | feedback   | Test feedback name     | Test feedback description     | C1     | feedback1   |
      | folder     | Test folder name       | Test folder description       | C1     | folder1     |
      | forum      | Test forum name        | Test forum description        | C1     | forum1      |
      | glossary   | Test glossary name     | Test glossary description     | C1     | glossary1   |
      | imscp      | Test imscp name        | Test imscp description        | C1     | imscp1      |
      | label      | Test label name        | Test label description        | C1     | label1      |
      | lesson     | Test lesson name       | Test lesson description       | C1     | lesson1     |
      | lti        | Test lti name          | Test lti description          | C1     | lti1        |
      | page       | Test page name         | Test page description         | C1     | page1       |
      | quiz       | Test quiz name         | Test quiz description         | C1     | quiz1       |
      | resource   | Test resource name     | Test resource description     | C1     | resource1   |
      | scorm      | Test scorm name        | Test scorm description        | C1     | scorm1      |
      | survey     | Test survey name       | Test survey description       | C1     | survey1     |
      | url        | Test url name          | Test url description          | C1     | url1        |
      | wiki       | Test wiki name         | Test wiki description         | C1     | wiki1       |
      | workshop   | Test workshop name     | Test workshop description     | C1     | workshop1   |

    When I log in as "admin"
    And I am on "Course 1" course homepage with editing mode on
    And I add the "Course Activities" block
    And I click on "Assignments" "link" in the "Course Activities" "block"
    Then I should see "Test assignment view page"
    And I am on "Course 1" course homepage
    And I click on "Chats" "link" in the "Course Activities" "block"
    And I should see "Test chat view page"
    And I am on "Course 1" course homepage
    And I click on "Choices" "link" in the "Course Activities" "block"
    And I should see "Test choice view page"
    And I am on "Course 1" course homepage
    And I click on "Databases" "link" in the "Course Activities" "block"
    And I should see "Test database view page"
    And I am on "Course 1" course homepage
    And I click on "Feedback" "link" in the "Course Activities" "block"
    And I should see "Test feedback view page"
    And I am on "Course 1" course homepage
    And I click on "Forums" "link" in the "Course Activities" "block"
    And I should see "Test forum view page"
    And I am on "Course 1" course homepage
    And I click on "External tools" "link" in the "Course Activities" "block"
    And I should see "Test lti view page"
    And I am on "Course 1" course homepage
    And I click on "Quizzes" "link" in the "Course Activities" "block"
    And I should see "Test quiz view page"
    And I am on "Course 1" course homepage
    And I click on "Glossaries" "link" in the "Course Activities" "block"
    And I should see "Test glossary view page"
    And I am on "Course 1" course homepage
    And I click on "SCORM packages" "link" in the "Course Activities" "block"
    And I should see "Test scorm view page"
    And I am on "Course 1" course homepage
    And I click on "Lessons" "link" in the "Course Activities" "block"
    And I should see "Test lesson view page"
    And I am on "Course 1" course homepage
    And I click on "Wikis" "link" in the "Course Activities" "block"
    And I should see "Test wiki view page"
    And I am on "Course 1" course homepage
    And I click on "Workshop" "link" in the "Course Activities" "block"
    And I should see "Test workshop view page"
    And I am on "Course 1" course homepage
    And I click on "Resources" "link" in the "Course Activities" "block"
    And I should see "Test book view page"
    And I should see "Test page view page"
    And I should see "Test resource view page"
    And I should see "Test imscp view page"
    And I should see "Test url view page"
