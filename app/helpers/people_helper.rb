module PeopleHelper
  def name(person)
    if person.gender.downcase == "m" or person.gender.downcase == "male"
      "Mr." + " " + person.first_name + " " + person.last_name
    else
      "Miss." + " " + person.first_name + " " + person.last_name
    end
  end
end