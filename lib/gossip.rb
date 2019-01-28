require 'csv'
class Gossip

	attr_accessor :author , :content , :nume

	def initialize(author , content , nume)
		@author=author
		@content=content
		@nume=nume
	end

	def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
			csv << [@author, @content]
		end
	end

	def edit
		i=nume.to_i
		i=i-1
		table=CSV.read("./db/gossip.csv")

		table[i]=[@author, @content]


		CSV.open("./db/gossip.csv", "w") do |csv|
			table.each do |x, y|
				csv << [x , y]
			end
		end

		
	end

	def self.all
		all_gossips = []
		CSV.read("./db/gossip.csv").each do |csv_line|
			all_gossips << Gossip.new(csv_line[0], csv_line[1],"")
		end

		return all_gossips
	end
end
