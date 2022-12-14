# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Courses', type: :request do
  describe 'GET /index' do
    context 'without tutors attached' do
      before do
        FactoryBot.create_list(:course, 10)
        get '/api/v1/courses'
      end

      it 'returns all courses' do
        expect(json.size).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'with tutors attached' do
      before do
        @course = FactoryBot.create(:course)
        FactoryBot.create_list(:tutor, 10, course_id: @course.id)
        get '/api/v1/courses'
      end

      it 'returns the Name' do
        expect(json.first['name']).to eq(@course['name'])
      end

      it 'returns all tutors' do
        expect(json.first['tutors'].size).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:name) { Faker::Name.unique.name }
      let!(:description) { Faker::Lorem.paragraph }

      before do
        post '/api/v1/courses', params: {
          course: {
            name:,
            description:
          }
        }
      end

      it 'returns the name' do
        expect(json['name']).to eq(name)
      end

      it 'returns the description' do
        expect(json['description']).to eq(description)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with empty parameters' do
      before do
        post '/api/v1/courses', params: {
          course: {
            name: '',
            description: ''
          }
        }
      end

      it 'returns a no content status' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
