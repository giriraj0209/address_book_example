require './contact'

class AddressBook

attr_reader :contacts

def initialize
	@contacts =[]
end

def find_by_name(name)
	results=[]
	search =name.downcase
	contacts.each do |contact|
		if contact.first_name.downcase.include? (search)
			results.push(contact) unless results.include? (contact)
		end
	end
	#puts results.inspect
	print_results("Name Search Results (#{search})", results)
end
def print_results(search, results)
	puts search
	results.each do |contact|
		puts contact.to_s('full_name')
		contact.print_phone_numbers
		contact.print_addresses
	end
end

def find_by_phone_number(number)
results=[]
search = number.gsub("-", "")
contacts.each do |contact|
	contact.phone_numbers.each do |phone_number|
		if phone_number.number.gsub("-","").include?(search)
			results.push(contact) unless results.include? (contact)
		end
	end
end
	#puts results.inspect
	#puts "Number Search Results (#{search})"
	print_results("Number Search Results (#{search})", results)
end
def print_contact_list
	contacts.each do |contact|
		puts contact.to_s('first_last')
	end
end
def find_by_address(query)
results = []
search = query.downcase
	contacts.each do |contact|
		contact.addresses.each do |address|
			if address.to_s('long').downcase.include?(search)
				results.push(contact)
			end
	end
end
print_results("address Search Results (#{search})", results)
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
#addressbook.print_contact_list
#addressbook.find_by_name('g')
#addressbook.find_by_phone_number('123')
addressbook.find_by_address("street1")
end