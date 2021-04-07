require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/contacts' do	
	erb :contacts
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	hh = {:username => 'Введите ваше имя',
		  :phone => 'Введите ваш номер телефона',
		  :datetime => 'Введите удобный вам день и время'}

	#hh.each do |key, value|
	#	if params[key] == ''
	#		@error = hh[key]
	#	end
	#end

	@error = hh.select {|key,_| params[key] == ""}.values.join(", ")

	if @error != ''
		return erb :visit
	end	


	erb "OK, username is #{@username}, your phone is #{@phone}, you come to us  at #{@datetime}, your hairdresser is #{@barber}, #{@color}" #BUG UNFIXED
end
