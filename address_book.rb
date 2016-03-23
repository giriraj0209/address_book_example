require './contact'

class AddressBook

attr_reader :contacts

def initialize
	@contacts =[]
end

def run
loop do
puts "Address Book"
puts "a: Add Contact"
puts "p: Print Contact List"
puts "e: Exit"
puts "Please Enter your input"
input = gets.chomp.downcase
	case input
	when 'a'
		add_contact
	when 'p'
		print_contact_list
	when 'e'
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