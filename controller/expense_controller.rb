class ExpenseController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  set :public_folder, Proc.new {File.join(root,"public")}

  configure :development do
      register Sinatra::Reloader
  end
	# erb looks for erb file to the relative path from views folder 
	get '/' do
    @title = "EXPENTRA"
  	erb :'posts/index'
  end
  
	get '/new'  do
    @title = "NEW USER"
  	erb :"posts/new"  
	end

  get '/profile'  do
    @title = "Profile"
    @users = Expenses.all
    @amount = Expenses.total 
    erb :"posts/profile"  
  end
    
  get '/:id' do
    @title = "Current Expenses"
    id = params[:id].to_i
    @user = Expenses.find id
    erb :'posts/show'
  end

	#Param objects are taken from form of new.erb
	post '/' do
    users = Expenses.new
    users.username = params[:username]
    users.expenses = params[:expenses]
    users.cost = params[:cost]
    users.save
    redirect "/profile"
  end
 
 put '/:id'  do
   id = params[:id].to_i
   users = Expenses.find id

   users.username = params[:username]
   users.expenses = params[:expenses]
   users.cost = params[:cost]
   users.update
   redirect "/profile"
  end
  
  delete '/:id'  do
    id = params[:id].to_i
    Expenses.delete id
    redirect "/profile"
  end
    
  get '/:id/edit'  do
    @title = "EDIT USER"
    id = params[:id].to_i
    @users = Expenses.find id
    erb :'posts/edit'
  end

end