class TutorSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :course

  def course
    {
      id: object.course.id,
      name: object.course.name,
      description: object.course.description
    }
  end
end
