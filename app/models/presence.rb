class Presence < ActiveRecord::Base
  belongs_to :course
  belongs_to :lecture

  named_scope :with_lecture_id, lambda {|lecture_id|
    return {} if lecture_id.nil?
    {:conditions => ['lecture_id = ?', lecture_id]}
  }
  named_scope :with_lecture_description, lambda {|lecture_description|
    return {} if lecture_description.nil?
    {:include => :lectures, :conditions => ['lectures.description = ?', lecture_description]}
  }
end
