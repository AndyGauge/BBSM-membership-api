class CiviContactCreator < CiviAPI
  after_initialize :set_attributes

  def set_attributes
    self.entity = "Contact"
    self.action = "Create"
    self.json = {"contact_type" => "Individual"}
  end

  def contact_id
    if response
      JSON.parse(response)["values"].keys[0] rescue nil
    end
  end
end
