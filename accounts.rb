=begin

require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "#sqlite3://#{Dir.pwd}/accountsdatabase.db")

class Account
    include DataMapper::Resource #mixin

    property :username, String
    property :password, String
end
DataMapper.finalize

class Accountinformation
    include DataMapper::Resource #mixin

    property :totalwin, Integer
    property :totalloss, Integer
    property :totalprofit, Integer
end
DataMapper.finalize
=end