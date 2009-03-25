class AdmissionRequirement
  attr_reader :applicant
  def initialize(applicant)
    @applicant = applicant
  end
end

class MinimumTestScoreRequirement < AdmissionRequirement
  def to_proc
    # Really sophisticated code goes here...
    
    lambda { test_score >= 1200}
  end
end

class ExtraCurricularActivitiesRequirement < AdmissionRequirement
  def to_proc
    # Really sophisticated code goes here...
    
    lambda { extra_curricular_activities > 2}
  end
end

class ClassRankRequirement < AdmissionRequirement
  def to_proc
    # Really sophisticated code goes here...
    
    lambda { class_rank <= 10}
  end
end

class AdmissionsOffice
  ADMISSION_REQUIREMENTS = [MinimumTestScoreRequirement, ExtraCurricularActivitiesRequirement, ClassRankRequirement]
  attr_reader :applicants
  def initialize
    @applicants = []
  end

  def approved_applicants
    applicants.select do |applicant|
      ADMISSION_REQUIREMENTS.all? do |requirement|
        applicant.instance_eval(&requirement.new(applicant))
      end
    end
  end
end

require 'ostruct'
class Applicant < OpenStruct
end

qualified_applicant = Applicant.new(
  :name                        => 'Qualified Applicant', 
  :test_score                  => 1580, 
  :extra_curricular_activities => 5, 
  :class_rank                  => 1
)

unqualified_application = Applicant.new(
  :name                        => 'Unqualified Applicant', 
  :test_score                  => 1600, 
  :extra_curricular_activities => 3, 
  :class_rank                  => 11
)

admissions_office = AdmissionsOffice.new
admissions_office.applicants << qualified_applicant
admissions_office.applicants << unqualified_application

p admissions_office.approved_applicants




