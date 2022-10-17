# API Call's
  # GET
  - /api/v1/courses - Get all courses list
  - /api/v1/courses/{course_id}/tutors - Get tutor based on course

  # POST
  - /api/v1/courses - Create courses
  - /api/v1/courses/{course_id}/tutors - Create tutor based on course


# Implementation
  - Created logic for the course and tutor mapping
  - Assumption unique email for tutor and unique name for course
  - No authentication done, all are open api's, no CSRF checks added
  - Test cases for the controller api and model validation
  - Rubocop added for ruby style guide

# Setup the application
  - **bundle install**
  - run the command: **rake db:setup**

# Start the application
  - **rails s**

# Test the application
  - run the command: **rspec**

# Pending
  - Paginated api's not builded, assumption just few courses available in the institution
  - Active check for tutor available or not check not added
  - Continuos deployment
  - Heroku app and run
  - Rubycritic for code quality check
  - Security checks not done

# Ruby version and Rails version
  - ruby 3.1.0p0
  - Rails 7.0.4
