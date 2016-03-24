require './contact'
require "yaml"

class AddressBook

attr_reader :contacts

def initialize
	@contacts =[]
	open()
end

def open
	if File.exist?("contacts.yml")
		@contacts = YAML.load_file("contacts.yml")
	end
end

def save
	File.open("contacts.yml", "w") do |file|
		file.write(contacts.to_yaml)
	end

end

def run
loop do
puts "Address Book"
puts "a: Add Contact"
puts "p: Print Contact List"
puts "s: Search"
puts "e: Exit"
puts "Please Enter your input"
input = gets.chomp.downcase
	case input
	when 'a'
		add_contact
	when 'p'
		print_contact_list
	when 's'
		print  "Enter your search term:  "
		search = gets.chomp
		find_by_name(search)
		find_by_address(search)
		find_by_phone_number(search)
	when 'e'
		save()
		break  
	end
end
end

def add_contact
contact =Contact.new
print "First Name: "
contact.first_name = gets.chomp

print "Middle Name: "
contact.middle_name = gets.chomp

print "Last Name: "
contact.last_name = gets.chomp

loop do
puts "Add Phone number or address?"
puts "p: Add phone number"
puts "a: Add Address"
puts "Press any other key to exit"
response = gets.chomp.downcase
case response
	when 'p'
		phone_number =Phone_number.new
		print "Enter the kind: "
		phone_number.kind = gets.chomp
		print "Enter the number: "
		phone_number.number = gets.chomp
		contact.phone_numbers.push(phone_number)
	when 'a'
		address = Address.new
		print "Enter the kind: "
		address.kind = gets.chomp
		print "Enter the street1: "
		address.street_1 = gets.chomp
		print "Enter the street2 "
		address.street_2 = gets.chomp
		print "Enter the city"
		address.city = gets.chomp
		print "Enter the state: "
		address.state = gets.chomp
		print "Enter the postal code"
		address.postal_code = gets.chomp
		contact.addresses.push(address)
	else
		print "\n"
		break
	end

end

contacts.push(contact)
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
		puts contact.to_s('full_name')
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
addressbook.run

end