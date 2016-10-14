require_relative 'config/environment'

class App < Sinatra::Base

	get '/reversename/:name' do
		params[:name].chars.reverse.join
	end 

	get '/square/:number' do
		"<p>#{params[:number].to_i*params[:number].to_i}</p>"
	end 

	get '/say/:number/:phrase' do
		params[:phrase].gsub(" ", "%20")
		say = ""
		params[:number].to_i.times {say << "#{params[:phrase]}\n"}
		say
	end

	get '/say/:word1/:word2/:word3/:word4/:word5' do
		params.values[1].join(" ") + "."
	end

	get '/:operation/:number1/:number2' do
		case params[:operation]
			when 'subtract'
				(params[:number1].to_i - params[:number2].to_i).to_s
			when 'add'
				(params[:number1].to_i + params[:number2].to_i).to_s
			when 'multiply'
				(params[:number1].to_i * params[:number2].to_i).to_s
			when 'divide'
				(params[:number1].to_i / params[:number2].to_i).to_s
		end	
	end

end