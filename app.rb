require 'sinatra'
require_relative 'config/application'
require 'faker'
require 'pry'

helpers do
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all.order(:name)
  erb :'meetups/index'
end

get '/meetups/:id' do
  @meetup = Meetup.find(params[:id])
  erb :'meetups/show'
end

get '/new' do

  if current_user
    erb :'meetups/new'
  else
    flash[:notice] = "You need to sign in."
    redirect '/'
  end
end

post '/new' do
@name = params[:meetup_name]
@description = params[:meetup_description]
@location = params[:meetup_location]
@creator = User.find(session[:user_id]).username

unless @name.empty? || @description.empty? || @location.empty?
new_meetup = Meetup.create(
  name: params[:meetup_name],
  description: params[:meetup_description],
  location: params[:meetup_location],
  creator: User.find(session[:user_id]).username
  )
end

  if !new_meetup.nil?
    flash[:notice] = "You have just created a new meetup!"
    redirect "/meetups/#{new_meetup.id}"
  else
    if @name.empty?
      flash[:notice] ="Please fill in the 'Name' section."
    elsif @description.empty?
      flash[:notice] = "Please fill in the 'Description' section."
    elsif @location.empty?
      flash[:notice] = "Please fill in the 'Location' section."
    end
    erb :'meetups/new'
  end
end
