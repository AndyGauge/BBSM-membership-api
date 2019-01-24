class CiviContributionCreator < CiviAPI
  after_initialize :set_attributes

  def set_attributes
    self.entity = "Contribution"
    self.action = "Create"
    self.json = {"financial_type_id" => "Donation"}
  end
end
