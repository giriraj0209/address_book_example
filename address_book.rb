require './contact'

class AddressBook

attr_reader :contacts

def initialize
	@contacts =[]
end

def print_contact_list
	contacts.each do |contact|
		puts contact.to_s('first_last')
	end
end
addressbook =AddressBook.new

giri=Contact.new
giri.first_name="Giriraj"
giri.last_name="Nagaraju"
giri.middle_name="Kashyap"
giri.add_phone_numbers("Home", "123-445-8686")
giri.add_phone_numbers("Public", "123-333-4444")
giri.add_addresses("Home", "street1", "street2","somewhere","somestate","123456")

addressbook.contacts.push(giri)
addressbook.print_contact_list
end