require "colorize"
require "json"
balance = 0
gotaccount = true
inapp = true
ahis = Array.new()
details = {User: "", Balance: -1, History: ahis, Password: 0}
start_n = ""


puts "Create account? (yes/no)"
ans = gets.chomp
ans.downcase!
case ans
    when "yes"
        gotaccount = false
    when "y"
        gotaccount = false
    else
        gotaccount = true
end

system "clear"
if gotaccount == false
    puts "Please enter a username"
    user = gets.chomp
    user.downcase!
    puts "Please enter a password"
    pass = gets.to_i
    File.open("#{user}_bank.txt", "w") do |line|
        new_details = {User: user, Balance: balance, History: ahis, password: pass}
        details = new_details
        line.puts JSON.generate(details)
    end
end

system "clear"

puts "Please enter your username"
user_a = gets.chomp
user_a.downcase!
File.open("#{user_a}_bank.txt").each do |line|
    details = JSON.parse(line, {symbolize_names: true})
    start_n = details[:User]
end 
puts "Please enter your password"
pass_a = gets.to_i
system "clear"
balance = details[:Balance]
while inapp == true

    break if (user_a == details[:User] && pass_a == details[:Password])
        details[:User] = start_n
        balance = details[:Balance]
        puts " Welcome to banking United #{details[:User].capitalize}\n Your options today are\n Balance\n Deposit\n Withdraw\n History\n Quit" 
        choice = gets.chomp
        choice.downcase!
        ahis = details[:History]
            case choice
                when "balance"
                    system "clear"
                    puts "Your balance is $#{balance}"
                    puts "- " * 5
                    ahis.push("You checked your balance: $#{balance}")

                when "deposit"
                    system "clear"
                    puts "How much would you like to deposit?"
                    deposited = gets.to_i
                    balance = balance + deposited
                    system "clear"
                    puts "You have $#{balance} in your account"
                    puts "- " * 5
                    ahis.push("You deposited: $#{deposited}")

                when "withdraw"
                    system "clear"
                    puts "How much would you like to withdraw?"
                    withdrawn = gets.to_i

                    if withdrawn > balance
                        system "clear"
                        puts "Insuficient funds"
                        puts "- " * 5
                    else 
                        balance = balance - withdrawn
                        system "clear"
                        puts "You have $#{balance} in your account"
                        puts "- " * 5
                        ahis.push("You withdrew: $#{withdrawn}")
                    end

                when "history"
                    system "clear"
                    puts "Your last 10 tansactions are:"
                    puts "- " * 5
                    ahis.each{ |c| puts c}
                    puts "- " * 5

                when "quit"
                    system "clear"
                    File.open("#{details[:User]}_bank.txt", "w") do |line|
                        details = {User: details[:User], Balance: balance, History: ahis, password: details[:password]}
                        line.puts JSON.generate(details)
                    end
                    inapp = false
                when "transaction"
                    details = {User: user, Balance: balance, History: ahis, password: pass}
                    #Get a rough deposit system working between made accounts
                    puts "Who would you like to send money to?"
                    name = gets.chomp
                    name.downcase!
                    system "clear"
                    File.open("#{name}_bank.txt").each do |line|
                        send_details = JSON.parse(line, {symbolize_names: true})
                        system "clear"
                        puts "#{send_details[:User].capitalize} found\n How much would you like to send?"
                        amount = gets.to_i
                        balance_new = send_details[:Balance]
                        balance_old = details[:Balance]
                        balance_new + amount
                        balance_old - amount
                        system "clear"
                        puts "You sent #{amount} to #{send_details[:User]}"
                        puts "- " * 5
                        File.open("#{details[:User]}_bank.txt", "w") do |line|
                            send_details = {User: send_details[:User], Balance: balance_news, History: send_details[:History], password: send_details[:password]}
                            details = send_details
                            line.puts JSON.generate(details)
                        end
                    end
                else
                    system "clear"
                    "Invalid input, Please enter an above option"
            end
        if ahis.length > 10
           ahis.delete_at(0) 
        end
end