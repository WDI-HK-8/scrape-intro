# Here, you are creating a new rake command, such as rake db:migrate

namespace :scrape do
  desc "Create all NASDAQ companies"
  task :create_companies => :environment do
    require 'open-uri'
    require 'csv'

    url = "http://s3.amazonaws.com/nvest/nasdaq_09_11_2014.csv"
    url_data = open(url) # open() is powered by 'open-uri'
    # csv is just a string that separate values using commas

    # we need to be able to PARSE csv files easy
    CSV.foreach(url_data, :headers => true) do |row|
      # create a new company
      Company.create(
        symbol: row[0],
        name: row[1],
        last_sale: row[2],
        market_cap: row[3],
        ardtso: row[4],
        ipo_year: row[5],
        sector: row[6],
        industry: row[7],
        summary_quote: row[8]
      )
    end
  end

  def scrape_one_company(company, html_doc, specific_format)
    annual_income_statement = html_doc.css(specific_format) # selecting elements based on the selector

    if not annual_income_statement.any?
      puts "-----------> No data <----------"
      return
    end

    new_income_statement = company.annual_incomes.new

    AnnualIncome.columns[3..52].each_with_index do |column, index|
      new_income_statement["#{column.name}"] = annual_income_statement[index].text.gsub(',', '')
    end

    new_income_statement.save
    puts "-> Success!"
  end

  desc "Scrape from Google Finance"
  task :google_finance => :environment do
    require 'open-uri'
    require 'nokogiri'

    Company.all.each do |company|
      puts "#{company.name}"

      url = "https://www.google.com/finance?q=NASDAQ:#{company.symbol}&fstype=ii"
      url_data = open(url).read # open and read HTML
      html_doc = Nokogiri::HTML(url_data) # parse the HTML, so that we can apply css selectors

      scrape_one_company(company, html_doc, "#incannualdiv tr > *:nth-child(2)")
      scrape_one_company(company, html_doc, "#incannualdiv tr > *:nth-child(3)")
      scrape_one_company(company, html_doc, "#incannualdiv tr > *:nth-child(4)")
      scrape_one_company(company, html_doc, "#incannualdiv tr > *:nth-child(5).rm")
    end
  end
end
