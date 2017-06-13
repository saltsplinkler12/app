class Expense
	attr_accessor :id, :username, :expenses, :cost

		#Allowing connection to db and heroku
	def self.open_connection
    if ENV['DATABASE_URL']
      PG.connect({
        dbname: ENV['DB_NAME'],
        user: ENV['DB_USER'],
        password: ENV['DB_PASSWORD'],
        host: ENV['DB_HOST'],
        port: ENV['DB_PORT']
      })
    else
      PG.connect(dbname: "expentra")
    end
  end

	#users is a new instance of class Expenses containing parameters which have been set by post_data
	def self.hydrate post_data
    users = Expense.new
    users.id = post_data['id']
    users.username = post_data['username']
    users.expenses = post_data['expenses']
    users.cost = post_data["cost"]

    users
  end
  
  #INDEX
  def self.all
  	conn = self.open_connection
		sql = "SELECT id,username,expenses,cost FROM luxexp ORDER BY id"
		results = conn.exec(sql)
		
		# create an array of post objects
    posts = results.map do |tuple| 
	    self.hydrate tuple
	  end
	  posts
 end

#SHOW
	def self.find id
		conn = self.open_connection
		sql = "SELECT id,username,expenses,cost FROM luxexp WHERE id = #{id}"
		result = conn.exec(sql)
		
		# create an array of post objects
    posts = result.map do |tuple| 
    self.hydrate tuple
   end
    posts[0]
	end

	#CREATE
	def save
		conn = Expense.open_connection
		sql = "INSERT INTO luxexp (username , expenses, cost) VALUES ( '#{self.username}', '#{self.expenses}','#{self.cost}')"
		conn.exec(sql)
	end

	#UPDATE
	def update
   	conn = Expense.open_connection
  	sql = "UPDATE luxexp SET username='#{self.username}', expenses='#{self.expenses}', cost='#{self.cost}'	 WHERE id = #{self.id}"
   	conn.exec(sql)
  end
	
  #DELETE
	def self.delete id
		conn = self.open_connection
		sql	= "DELETE FROM luxexp where id = #{id}"
		conn.exec(sql)
	end

	def self.total 
		total = 0
		self.all.each do |x|
			total += x.cost.to_f
		end
		total
	end
end