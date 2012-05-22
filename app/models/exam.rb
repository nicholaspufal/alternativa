#encoding: utf-8

class Exam < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  has_many :assessments
  has_and_belongs_to_many :groups
  
  validates_presence_of :title, :start_time, :end_time
  validate :start_time_lower_than_end_time
  validates_with ExamValidator
  
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
  
  scope :ordered, order("LOWER(title) ASC")
  scope :upcoming_exams, lambda { where("start_time > ?", Time.now) }
  scope :current_exams, lambda { where("start_time <= :time_now AND end_time >= :time_now", :time_now => Time.now) } 
  
  def start_time_lower_than_end_time
    if start_time.present? && end_time.present?
      errors.add(:start_time, "não pode ser ser superior ou igual a data/hora fim") if start_time >= end_time
    end
  end            
end