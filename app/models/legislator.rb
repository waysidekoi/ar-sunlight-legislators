require_relative '../../db/config'

class Legislator < ActiveRecord::Base
  # attr_reader :title, :firstname, :middlename, :lastname, :state

  #Before create filter to parse phones and structure the way we want


  # PHONE_REGEX = /^[\\(]{0,1}([0-9]){3}[\\)]{0,1}[ ]?([^0-1]){1}([0-9]){2}[ ]?[-]?[ ]?([0-9]){4}[ ]*((x){0,1}([0-9]){1,5}){0,1}$/
  # validates :phone, :format => { :with => PHONE_REGEX }
end

