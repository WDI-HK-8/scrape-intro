namespace :test_scrape do
  desc "OpenRice"
  task :openrice => :environment do
    require 'open-uri'
    require 'nokogiri'

    url = "http://www.openrice.com/en/hongkong/restaurants/type/sr1.htm?page=1&searchSort=31&region=0&amenity_id=1008"
    url_data = open(url).read
    html_doc = Nokogiri::HTML(url_data)

    restaurants = html_doc.css("div[id='sr1_restauantlisting'] > .rest_block.rel_pos")

    restaurants.each do |restaurant|
      puts restaurant.css(".poi_link").text
      puts restaurant.css(".sr1_info_item").text
      puts "======================"
    end
  end

  desc "OMDB"
  task :OMDB => :environment do
    require 'open-uri'
    require 'nokogiri'

    url = "http://www.imdb.com/chart/top?ref_=nv_ch_250_4"
    url_data = open(url).read
    html_doc = Nokogiri::HTML(url_data)

    movies = html_doc.css(".chart > .lister-list > tr") # in array, 250

    movies.each do |movie|
      name_of_movie = movie.css(".titleColumn > a").text
      year_of_movie = movie.css(".titleColumn > .secondaryInfo").text
      puts "#{name_of_movie} --- #{year_of_movie.gsub('(','').gsub(')','')}"
    end
  end
end










