class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :field, :begin_date, :end_date, :participants_wanted, :gender, :description, :compensation, :time_needed, :user_id, :min_age, :max_age, :head, :location, :website, :study_id
end
