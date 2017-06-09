class Expenses
	attr_accessor :id, :username, :expenses, :cost

	def self.open_connection
		PG.connect(dbname:"expentra")
	end


	def self.hydrate post_data
    user = Expenses.new
    user.id = post_data['id']
    user.username = post_data['username']
    user.expenses = post_data['expenses']
    user.cost = post_data["cost"]

    user
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
		conn = Expenses.open_connection
		sql = "INSERT INTO luxexp (username , expenses, cost) VALUES ( '#{self.username}', '#{self.expenses}','#{self.cost}')"
		conn.exec(sql)
	end

	#UPDATE
	def update
   	conn = Expenses.open_connection
  	sql = "UPDATE luxexp SET username='#{self.username}', expenses='#{self.expenses}', cost='#{self.cost}'	 WHERE id = #{self.id}"
   	conn.exec(sql)
  end
	
  #DELETE
	def self.delete id
		conn = self.open_connection
		sql	= "DELETE FROM luxexp where id = #{id}"
		conn.exec(sql)
	end

end