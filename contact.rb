class Contact

attr_writer :first_name, :middle_name, :last_name

def first_name
@first_name
end

def middle_name
@middle_name
end

def last_name
@last_name
end

def last_first
full_name = last_name
full_name +=","
full_name+= first_name
if !middle_name.nil?
full_name +=" "+middle_name.slice(0,1)+"."
full_name
end

full_name 
end

def full_name
full_name = first_name
if !middle_name.nil?
full_name +=" "+middle_name
end
full_name +=" "+last_name
full_name 
end
def first_last
first_name+" "+last_name
end

def to_s(format = 'full_name')
case format
when 'full_name'
	full_name
when 'last_first'
	last_first
when 'first'
	first_name
when 'last'
	last_name
else
	first_last
end
end

giri=Contact.new
giri.first_name="Giriraj"
giri.last_name="Nagaraju"
giri.middle_name="Kashyap"
puts giri.to_s('something')
puts giri.last_first
mark=Contact.new
mark.first_name="marky"
mark.last_name="louie"
puts mark.full_name
puts mark.last_first
end
