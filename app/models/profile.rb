class Profile < ActiveRecord::Base
  belongs_to :user

  validate :first_last_name_not_null, :male_name_not_Sue
  validates :gender, inclusion: { in: %w(male female)} 

  default_scope { order birth_year: :asc }

  def first_last_name_not_null
  	if first_name == nil and last_name == nil
  		errors.add(:first_name, "You should enter at least first name or last name!")
  	end
  end

  def male_name_not_Sue
  	if gender == "male" and first_name == "Sue"
  		errors.add(:first_name, "Sue is not allowed!")
  	end
  end

def self.get_all_profiles (min_birth_year, max_birth_year)
      self.where("birth_year BETWEEN :min_year AND :max_year", min_year: min_birth_year, max_year: max_birth_year)
end

end
