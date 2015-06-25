class Url < ActiveRecord::Base

	validate :validate_http
  before_create :convert_url

  def convert_url
  	short = "bitly."
  	abecedario = ("A".."Z").to_a + ("a".."z").to_a
  	short += abecedario.sample(3).join
  	self.short_url = short
  end


	def validate_http
    if !self.original_url.start_with? "http://" 
    	errors.add(:original_url, "No comienza con http://")
    end
  end

end