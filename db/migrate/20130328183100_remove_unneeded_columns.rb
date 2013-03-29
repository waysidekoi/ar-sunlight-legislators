require_relative '../config'

class RemoveUnneededColumns < ActiveRecord::Migration
  def change
    remove_column :legislators, :webform
    remove_column :legislators, :congress_office
    remove_column :legislators, :bioguide_id
    remove_column :legislators, :votesmart_id
    remove_column :legislators, :fec_id
    remove_column :legislators, :govtrack_id
    remove_column :legislators, :crp_id
    remove_column :legislators, :congresspedia_url
    remove_column :legislators, :youtube_url
    remove_column :legislators, :facebook_id
    remove_column :legislators, :official_rss
    remove_column :legislators, :senate_class
    remove_column :legislators, :district
    remove_column :legislators, :nickname
  end
end
