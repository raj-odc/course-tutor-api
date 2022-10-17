class TutorSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :course

  def course
    object.course
  end
end
