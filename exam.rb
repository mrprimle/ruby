class Pearson
  attr_accessor :name
  attr_accessor :surname

  def initialize(name, surname)
    @name = name
    @surname = surname
  end
end

class BasicContacts < Pearson
  attr_accessor :phone
  attr_accessor :email

  def initialize(phone, email, name, surname)
    @phone = phone
    @email = email
    @name = name
    @surname = surname
  end
  
end

class Contacts < BasicContacts
  attr_accessor :skype
  attr_accessor :inst

  def initialize(phone, email, name, surname, skype, inst)
    @phone = phone
    @email = email
    @name = name
    @surname = surname
    @skype = skype
    @inst = inst
  end

  def to_s
    name + ", " + surname + ", " + phone + ", " + email + ", " + skype + ", " + inst
  end
end

class ContactsDatabase
  attr_accessor :contacts

  def initialize(contacts)
    @contacts = contacts
  end

  def selectBySurname(surname)
    @contacts.select { |contacts| contacts.surname == surname }
  end

  def selectByName(name)
    @contacts.select { |contacts| contacts.name == name }
  end

  def selectByEmail(email)
    @contacts.select { |contacts| contacts.email == email }
  end

  def selectByPhone(phone)
    @contacts.select { |contacts| contacts.phone == phone }
  end

  def append(value)
    contacts.append(value)
  end
end

contacts = ContactsDatabase.new([
  Contacts.new("+380 948 94 83", "some@email.com", "Mike", "Doroshenko", "mdoroshenko", "mdpoz"),
  Contacts.new("+1 948 94 83", "someName@email.com", "Anastasia", "Klymchuk", "aklymchuk", "nocomments"),
  Contacts.new("+353 948 94 83", "someOther@email.com", "Andrjey", "Polander", "apolander", "polishpower")
])


# Sample usage:
puts "All contacts: "
contacts.contacts.each { |contacts| print contacts.to_s + "\n" }
puts "Contacts with name Anastasia: "
contacts.selectByName("Anastasia").each { |contacts| print contacts.to_s + "\n" }
puts "Contacts with my phone: "
contacts.selectByPhone("+380 948 94 83").each { |contacts| print contacts.to_s + "\n" }
