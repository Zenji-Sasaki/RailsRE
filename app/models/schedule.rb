class Schedule < ApplicationRecord
 validates :title, presence: true
 validates :startDate, presence: true
 validates :endDate, presence: true

 validate :date_before_start
 validate :date_before_finish

 def date_before_start
  return if startDate.blank?
  errors.add(:startDate, "は今日以降の日付を選択してください") if startDate < Date.today
 end

 def date_before_finish
  return if endDate.blank? || startDate.blank?
  errors.add(:endDate, "は開始日以降の日付を選択してください") if endDate < startDate
 end
end


