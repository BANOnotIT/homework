class TimeEntry < ApplicationRecord
  belongs_to :user
  after_initialize :init

  def init
    self.start ||= DateTime.now
    self.title ||= ''.freeze
  end

  def duration
    self.end - self.start
  end
end
