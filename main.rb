require 'sinatra'
require 'sinatra/reloader'
require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/accounts.db")

class Accounts
    include DataMapper::Resource
    property :id, Serial
    property :user, Text
    property :accountWin, Integer
    property :accountLoss, Integer
    property :accountProfit, Integer
end
DataMapper.finalize
Accounts.auto_upgrade!

configure do
    enable :sessions
    set :user, "yuan"
    set :password, "123"
end


get '/' do 
    erb :login
end

get '/login' do
    if session[:login]
        redirect '/gambleform'
    end
end

post '/loggedin' do
    if params[:user] == settings.user && params[:pass] == settings.password
        session[:login] = true
        session[:totalWin] = 0
        session[:totalLoss] = 0
        session[:totalProfit] = 0
        @account = Accounts.first

        redirect '/gamble'
    else
        session[:message] = "Username or Password is incorrect" #shortlived, called flash
        redirect '/'
    end
end

post '/logout' do
    account = Accounts.first

    account.accountWin += session[:totalWin]
    account.accountLoss += session[:totalLoss]
    account.accountProfit += session[:totalProfit]
    account.save

    session[:totalWin] = nil
    session[:totalLoss] = nil
    session[:totalProfit] = nil

    redirect '/'
end


get '/gamble' do
    @totalWin = session[:totalWin]
    @totalLoss = session[:totalLoss]
    @totalProfit = session[:totalProfit]
    
    account = Accounts.first
    if account
        @accountWin = account.accountWin
        @accountLoss = account.accountLoss
        @accountProfit = account.accountProfit
    end

    erb :gamble 
end

post '/betting' do
    @risk = params[:betamount].to_i
    number = params[:number].to_i
    roll = rand(1..6)

    if number == roll
        save_win(2*@risk)
        @message = "The dice landed on #{roll}, you win #{2*@risk} dollars!"
    else
        save_lost(@risk)
        @message = %{The dice landed on #{roll}, you lost #{@risk} dollars. <br>You've lost a total of #{session[:totalLoss]} dollars.}
    end

    account = Accounts.first
    if account
        @accountWin = account.accountWin
        @accountLoss = account.accountLoss
        @accountProfit = account.accountProfit
    end

    erb :gamble
end

def save_win(cash)
    session[:totalWin] = session[:totalWin] + cash
    session[:totalProfit] = session[:totalProfit] + cash

    @totalWin = session[:totalWin]
    @totalLoss = session[:totalLoss]
    @totalProfit = session[:totalProfit]
end

def save_lost(cash)
    session[:totalLoss] = session[:totalLoss] + cash
    session[:totalProfit] = session[:totalProfit] - cash

    @totalWin = session[:totalWin]
    @totalLoss = session[:totalLoss]
    @totalProfit = session[:totalProfit]
end