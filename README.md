# API Call's
  # GET
  - /api/v1/courses - Get all courses list
  - /api/v1/courses/1/tutors - Get tutor based on course

  # POST
  - /api/v1/courses - Create courses
  - /api/v1/courses/1/tutors - Create tutor based on course


# Implementation
  - Created logic for the course and tutor mapping
  - Test cases for the controller api and model validation
  - Rubocop added for ruby style guide

# Setup the application
  - run the command: **rake db:setup** and **rake db:seed**
  - start the application: **rails s**

# Test the application
  - run the command: **rspec**

# Pending
  - Paginated api's not builded, assumption just few courses available in the institution
  - Continuos deployment
  - Heroku app and run
  - Rubycritic for code quality check
