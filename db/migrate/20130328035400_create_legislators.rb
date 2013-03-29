require_relative '../config'

class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :title
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :name_suffix
      t.string :party
      t.string :state
      t.string :gender
      t.string :phone
      t.string :fax
      t.string :website
      t.string :birthdate
      t.string :twitter_id
      t.string :in_office
      t.string :webform
      t.string :congress_office
      t.string :bioguide_id
      t.string :votesmart_id
      t.string :fec_id
      t.string :govtrack_id
      t.string :crp_id
      t.string :congresspedia_url
      t.string :youtube_url
      t.string :facebook_id
      t.string :official_rss
      t.string :senate_class
      t.string :district
      t.string :nickname
    end
  end
end

#Removed -- not necessary
