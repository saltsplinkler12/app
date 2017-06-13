require 'pg'
class DatabaseSetup
    def self.open_connection
        PG.connect({
            dbname: ENV['DB_NAME'], 
            host: ENV['DB_HOST'],
            port: ENV['DB_PORT'],
            user: ENV['DB_USER'],
            password: ENV['DB_PASSWORD']
        })
    end
    def self.go
        conn = self.open_connection
        sql = "CREATE TABLE luxexp (
           id SERIAL PRIMARY KEY, 
           username VARCHAR(20),
           expenses VARCHAR(20), 
           cost DECIMAL (18,2)
        );"
        conn.exec(sql)
    end
end
DatabaseSetup.go