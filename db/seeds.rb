require "csv"

Movie.delete_all
ProductionCompany.delete_all

filename = Rails.root.join("db/top_movies.csv")

puts "loading movies from the CSV file: #{filename}"

csv_data = File.read(filename)
movies = CSV.parse(csv_data, headers: true, encoding: "utf-8")

movies.each do |m|
    # puts m["original_title"]
    production_company = ProductionCompany.find_or_create_by(name: m["production_company"])

    if production_company && production_company.valid?
        # create movie here
    else    
        puts "Invalid Production Company, #{m['production_company']} for movie #{m['original_title']}"
    end
end
