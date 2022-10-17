require 'rails_helper'

RSpec.describe "Api::V1::Tutors", type: :request do
  describe 'GET /index' do
    before do
      course = FactoryBot.create(:course)
      FactoryBot.create_list(:tutor, 10, course_id: course.id)
      get "/api/v1/courses/#{course.id}/tutors"
    end

    it 'returns all tutors' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do

    context 'with valid parameters' do
      let!(:name) { Faker::Name.name }
      let!(:email) { Faker::Internet.email }

      before do
        course = FactoryBot.create(:course)
        post "/api/v1/courses/#{course.id}/tutors", params: {
          tutor: {
            name: name,
            email: email
          }
        }
      end

      it 'returns the Name' do
        expect(json['name']).to eq(name)
      end

      it 'returns the Email' do
        expect(json['email']).to eq(email)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end
  end
end
