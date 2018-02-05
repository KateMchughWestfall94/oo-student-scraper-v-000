require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    file = Nokogiri::HTML(open(index_url))
    students = []

    file.css("div.student-card").each do |card|
      student_info = {
        :name => card.css("h4.student-name").text,
        :location => card.css("p.student-location").text,
        :profile_url => card.css("a").attribute("href").value
      }
    students << student_info
    end
    students
  end
  binding.pry

  def self.scrape_profile_page(profile_url)

  end


end
