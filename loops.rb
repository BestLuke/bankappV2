    require "json"
=begin
a = [1,2,5,nil,10,65]

sum = 0

for i in a do 
    sum += i unless i.nil?
end
puts sum
=end

#puts rand(100)

#num = Random.rand(100)
#puts num

nums = Array.new(100) {rand (0..100)} 
puts "nums Have successfully been generated"
puts "Random numbers lowest and Highest are " + nums.minmax.to_s

=begin
puts "How Old are you? "
age = gets
age = age.to_i
WELCOMED_AGE = 18
SWEET_SIXTEEN = 16

if age <= SWEET_SIXTEEN then
    puts "Sweet Sixteen, Too young kid"
elsif age <= WELCOMED_AGE then
    puts "Sorry, Your too young"
else
    puts "Welcome to the Casino"
end
=end


puts "Welcome to the banking app \n please sign in"
andy = 123
sarah = 456
billy = 789
guess = gets.chomp.to_i
balance = -1
details = {User: guess, Balance: balance, History: [1,2]}
playing = true
arrayhis = Array.new()
if guess == andy || guess == sarah || guess == billy
    if guess == andy
         File.open("andy_bank.txt").each do |line|
                #puts "line is: #{line.inspect}"
                puts "testing JSON"
                details = JSON.parse(line, {symbolize_names: true})
                puts "JSON worked"
            end
        elsif guess == sarah
            File.open("sarah_bank.txt").each do |line|
                details = JSON.parse(line, {symbolize_names: true})
            end
        elsif guess == billy
            File.open("billy_bank.txt").each do |line|
                details = JSON.parse(line, {symbolize_names: true})
             end
    end
    puts "details is #{details}"

    
  
    puts arrayhis.class
    balance =  details[:Balance].to_i
    puts "arr sym before is: #{details[:History].inspect}"
    puts "arr str before is: #{details["History"].inspect}"
    puts "arr is: #{details[:History].to_a.inspect}"

    arrayhis = details[:History].to_a
    puts arrayhis.class
    puts balance.class
    puts "balance is gathering" + balance.to_s
    puts "balance is #{details[:Balance].inspect}"
    details = details

    puts arrayhis.to_s
    puts balance.class
    puts arrayhis.to_s
        puts details
        puts arrayhis.to_s
   system "clear"
    while playing == true
        if guess == andy 
            puts "Hello Andy" 
        end
        if guess == sarah 
            puts "Hello Sarah" 
        end 
        if guess == billy 
            puts "Hello Billy" 
        end 
        puts "What would you like to do?\n Options:\n balance\n withdraw\n deposit\n history \n quit"
        task = gets.chomp.to_s
        balance1 = "balance"
        deposit = "deposit"
        withdraw = "withdraw"
        history = "history"
        quit = "quit"
        #puts arrayhis.to_s
        if task == "balance"
            system "clear"
            arrayhis.push("checked balance: " + balance.to_s)
            puts "Your balance is $" + balance.to_s
            

            elsif task == deposit
                puts "how much would you like to deposit?"
                user_input = gets.chomp.to_i
                balance = balance.to_i + user_input.to_i
                system "clear"
                arrayhis.push("deposited: " + user_input.to_s)
                puts "Your balance is $" + balance.to_s 
              
            elsif task == history
                system "clear"
          #puts arrayhis.to_s
                arrayhis.each { |c| puts c.to_s}
                puts "Your balance is $" + balance.to_s 
                #puts arrayhis.to_s

            elsif task == quit

                if(guess == andy)
                    File.open("andy_bank.txt", "w") do |line|
                        details = {User: guess, Balance: balance, History: arrayhis}
                        puts details
                        line.puts JSON.generate(details)
                    end
                 end
                    if(guess == sarah)
                        File.open("sarah_bank.txt", "w") do |line|
                            details = {User: guess, Balance: balance, History: arrayhis}
                            line.puts JSON.generate(details)
                        end
                    end
                        if(guess == billy)
                            File.open("billy_bank.txt", "w") do |line|
                                details = {User: guess, Balance: balance, History: arrayhis}
                                line.puts JSON.generate(details)
                            end
                        end
                system "clear"
                puts "bye bye"
                playing = false

            elsif task == withdraw
                puts "How much would you like to withdraw?"
                user_take = gets.chomp.to_i

                if user_take <= balance
                    balance = balance.to_i - user_take.to_i
                   system "clear"
                    arrayhis.push("withdrew: " + user_take.to_s)
                    puts "Your balance is $" + balance.to_s 
                   


                else
                puts "error, trying to take too much money!"
                end
     else
           puts "Invalid Option please start again"
        end
      
    end
end
=begin

four_letter_animals = Array["Calf", "Duck", "Elephant", "Goat", "Lamb", "Lion", "Mule", "Dog"]
four_letter_animals.push("Puma")
four_letter_animals.insert(4, "Joey")
four_letter_animals.delete("Dog")
four_letter_animals.reverse!
four_letter_animals[6].replace("Foal")
four_letter_animals.push("Bear")
four_letter_animals.reverse!

puts four_letter_animals.to_s

items = [{ customer: "John", item: "Soup", cost: 8.50}, {customer: "Sarah", item: "Pasta", cost: 12}, {customer: "John", item: "Coke", cost: 2.50}]
username = gets
username = username.to_s
puts items
items[]
user_active = false # THIS IS NOT COMPLETE CHANAGE THIS WITH VALUES WHEN ABLE

if user_active == true
    puts "it worked boi"
end
=end

=begin
items = Array.new

arrayitems = 0

while arrayitems < 3 do
    puts "what would you like to buy?"
    user_item = gets
    user_item.sub!("ice cream", "Broccoli")
    puts "How many would you like?"
    user_quantity = gets
    user_Hash = {item: user_item, quantity: user_quantity}
items.push(user_Hash)
puts "- " * 5
arrayitems += 1
end

puts "you have " + items.length.to_s + "items in your list\n" + "- " * 5

items.select { |e| e.is_a? Hash }
             .each { |h| h.each { |k,v| puts "#{k}=>#{v}" + "- " * 5 } }
#puts "#{:item}:#{:quantity}"
=end