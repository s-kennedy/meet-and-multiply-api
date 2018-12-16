
desc "Generate an API key to access this app"

task :generate_api_key => :environment do
  api_key = ApiKey.create!

  puts "---------- New API Key ----------"
  puts api_key.access_token
  puts "---------------------------------"
end
