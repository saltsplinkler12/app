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
		@user = Expenses.all
  	erb :'posts/index'
  end
  
	get '/new'  do
  	erb :"posts/new"  
	end
    
  get '/:id' do
    id = params[:id].to_i
    @user = Expenses.find id
    erb :'posts/show'
  end
	
	post '/' do
    user = Expenses.new
    user.username = params[:username]
    user.expenses = params[:expenses]
    user.cost = params[:cost]
    user.save
    redirect "/"
  end
 
 put '/:id'  do
   id = params[:id].to_i
   post = Expenses.find id

   user.username = params[:username]
   user.expenses = params[:expenses]
   user.cost = params[:cost]
   user.update
   redirect "/"
  end
  
  put '/:id'  do
   id = params[:id].to_i
   post = Expenses.find id

   user.username = params[:username]
   user.expenses = params[:expenses]
   user.cost = params[:cost]
   user.update
   redirect "/"
  end

  delete '/:id'  do
    id = params[:id].to_i
    Expenses.destroy id
    redirect "/"
  end
    
  get '/:id/edit'  do
    # id = params[:id].to_i
    # @user = Expenses.find id
    "edit"
    erb :'posts/edit'
  end



end