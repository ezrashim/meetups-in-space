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
  @memberships = Membership.where(meetup_id: params[:id])

  unless @memberships.nil?
    erb :'meetups/show'
  else @memberships = []
    erb :'meetups/show'
  end

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
@user = User.find(session[:user_id])
@creator = @user.username

    new_meetup = Meetup.new(
      name: params[:meetup_name],
      description: params[:meetup_description],
      location: params[:meetup_location],
      creator: @creator
      )

  if new_meetup.save
    flash[:notice] = "You have just created a new meetup!"
    Membership.create(user_id: @user.id, meetup_id: new_meetup.id)
    redirect "/meetups/#{new_meetup.id}"
  else
    flash.now[:notice] ="Please fill in all the sections."
    erb :'/meetups/new'
  end
end

post '/meetups/:id' do
  if current_user
    @meetup = Meetup.find(params[:id]).name
    @user = User.find(session[:user_id]).id
    @new_membership = Membership.new(user_id: @user, meetup_id: params[:id])

    if @new_membership.save
      flash[:notice] = "You have joined the meetup #{@meetup}!"
      redirect "/meetups/#{params[:id]}"
    else
      flash[:notice] = "You are already a member of #{@meetup}!"
      redirect "/"
    end

  else
    flash[:notice] = "You need to sign in."
    redirect "/meetups/#{params[:id]}"
end
end
