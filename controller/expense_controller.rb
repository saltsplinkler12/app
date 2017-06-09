class ExpenseController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") } 

  configure :development do
      register Sinatra::Reloader

  end
	
	get '/' do
     @title = "EXPENTRA"
		@users = Expenses.all
  	erb :'posts/index'
  end
  
	get '/new'  do
    @title = "NEW USER"
  	erb :"posts/new"  
	end
    
  get '/:id' do
     @title = "Current Expenses"
    id = params[:id].to_i
    @users = Expenses.find id
    erb :'posts/show'
  end
	
	post '/' do
    users = Expenses.new
    users.username = params[:username]
    users.expenses = params[:expenses]
    users.cost = params[:cost]
    users.save
    redirect "/"
  end
 
 put '/:id'  do
   id = params[:id].to_i
   users = Expenses.find id

   users.username = params[:username]
   users.expenses = params[:expenses]
   users.cost = params[:cost]
   users.update
   redirect "/"
  end
  
  put '/:id'  do
   id = params[:id].to_i
   post = Expenses.find id

   users.username = params[:username]
   users.expenses = params[:expenses]
   users.cost = params[:cost]
   users.update
   redirect "/"
  end

  delete '/:id'  do
    id = params[:id].to_i
    Expenses.delete id
    redirect "/"
  end
    
  get '/:id/edit'  do
    @title = "EDIT USER"
    id = params[:id].to_i
    @users = Expenses.find id
    erb :'posts/edit'
  end



end