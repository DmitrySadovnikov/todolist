class Profile < ActiveRecord::Base
  belongs_to :user

  validate :names_not_null
  validates :gender, inclusion: ["male", "female"]
  validate :male_not_sue

  def names_not_null
    if first_name.nil? && last_name.nil?
      errors.add(:first_name, 'first name and last name cannot both be null!')
    end
  end

  def male_not_sue
    if first_name == 'Sue' and gender == 'male'
      errors.add(:first_name, 'Sue cannot be male')
    end
  end

  def self.get_all_profiles(min_year, max_year)
    Profile.where("birth_year BETWEEN ? AND ?", min_year, max_year).order(birth_year: :asc)
  end

end