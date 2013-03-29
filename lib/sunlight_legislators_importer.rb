require_relative '../app/models/legislator'
require 'csv'

class SunlightLegislatorsImporter
  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      # legislator = row.to_hash
      
      # legislator[:phone].gsub!(/\D*/, "") unless legislator[:phone] == nil || legislator[:phone].length == 10
      
      Legislator.create(row.to_hash)
      # row.each do |field, value|
      #   # TODO: begin
      #   raise NotImplementedError, "TODO: figure out what to do with this row and do it!"
      #   # TODO: end
      # end
    end
  end
end

# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
