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
    @expenses = Expense.all
    @amount = Expense.total 
    erb :"posts/profile"  
  end
  
  #id is passed to find method which gets the row in the table. 
  get '/:id' do
    @title = "Current Expenses"
    id = params[:id].to_i
    @expense = Expense.find id
    erb :'posts/show'
  end

	# creating new user input, param objects are taken from form of new.erb form.
	post '/' do
    expense = Expense.new
    expense.username = params[:username]
    expense.expenses = params[:expenses]
    expense.cost = params[:cost]
    expense.save
    redirect "/profile"
  end

 #updating a user. 
 put '/:id'  do
   id = params[:id].to_i
   expense = Expense.find id #gets the whole row in the table. 
   expense.username = params[:username]
   expense.expenses = params[:expenses]
   expense.cost = params[:cost]
   expense.update
   redirect "/profile"
  end
  
  delete '/:id'  do
    id = params[:id].to_i
    Expense.delete id
    redirect "/profile"
  end
    
  get '/:id/edit'  do
    @title = "EDIT USER"
    id = params[:id].to_i
    @expense = Expense.find id
    erb :'posts/edit'
  end

end