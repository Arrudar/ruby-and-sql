# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert new rows in companies table

companies = Company.all.count
puts "It starts with #{companies} companies"

new_company = Company.new
new_company["name"] = "Apple"
new_company["city"] = "Cupertino"
new_company["state"] = "CA"
new_company["url"] = "https://www.apple.com"
new_company.save

puts ""
puts new_company.inspect

puts ""
companies = Company.all.count
puts "There are now #{companies} companies in total"

puts ""
puts ""

new_company2 = Company.new
new_company2["name"] = "Amazon"
new_company2["city"] = "Seattle"
new_company2["state"] = "WA"
new_company2.save

puts ""
puts new_company2.inspect

puts ""
companies = Company.all.count
puts "There are now #{companies} companies in total"

puts ""
puts ""

new_company3 = Company.new
new_company3["name"] = "Google"
new_company3["city"] = "Mountainview"
new_company3["state"] = "CA"
new_company3["url"] = "http://google.com"
new_company3.save

puts ""
puts new_company3.inspect

puts ""
companies = Company.all.count
puts "There are now #{companies} companies in total"


# 3. query companies table to find all row with California company
puts ""
puts ""
cali_companies = Company.where({"state" => "CA"})
puts cali_companies.inspect
puts ""
puts "There are #{cali_companies.count} companies in CA"

# 4. query companies table to find single row for Apple

puts ""
puts ""
#apple = Company.where ({"name" => "Apple"})[0]
apple = Company.find_by ({"name" => "Apple"})
puts apple.inspect

# 5. read a row's column value
puts apple["url"]
# 6. update a row's column value
puts ""
amazon = Company.find_by({"name" => "Amazon"})
#puts amazon.inspect
amazon["url"] = "http://amazon.com"
#puts amazon.inspect
amazon.save
puts amazon.inspect
puts "You just edited #{amazon["name"]}"

# 7. delete a row

puts ""
puts ""

google = Company.find_by({"name" => "Google"})
#puts google.inspect
google.destroy
puts ""

puts "There are now #{Company.all.count} companies in total"