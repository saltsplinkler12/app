DROP TABLE IF EXISTS luxexp;

CREATE TABLE luxexp (

  id SERIAL PRIMARY KEY,
  username VARCHAR(255),
  expenses VARCHAR(255),
  cost DECIMAL(18, 2)


);

INSERT INTO luxexp (username , expenses, cost) VALUES ('omar' , 'gym', '20.00');
