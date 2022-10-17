class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :tutors

  def tutors
    object.tutors.map do |tutor|
      {
        id: tutor.id,
        name: tutor.name,
        email: tutor.email
      }
    end
  end
end
