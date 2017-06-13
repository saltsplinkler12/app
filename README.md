#EXPENTRA 

##Description 
A user friendly web application to allow users to track their monthly expenditure. Current difficult financial times are the backdrop of "EXPENTRA", allowing individuals to check their outgoing expenses. 

Further developments of the MVP will, include users to compare their expenses with the products which may be cheaper than the ones they are using. 

## Approach
To create the app, a folder structure was firstly created using the following: directories 
>app as the root folder
>controller
>model
>public
>views
>>Files: config.ru
			Gemfile
			Gemfile.lock
			README.MD
			seed.sql
			
The first step was to obtain the required 'GEMS' and to install these running the bundle init and bundle commands, which automatically generates the Gemfile.lock file. 

Further the config.ru file was created to require the installed gems and the file directories. 

Thereafter a database was created using SQL, in POSTgres. A model was then created to obtain details from the database and then a controller was created to obtain the required RESTful routes from the model. 

The views and public folders were linked to allow for styling and user interaction pages. 

###Instructions 
•Step 1 > Type in url 

•Step 2 > Select New from Navigation bar at top.

•Step 3 > Enter required details in New form which should take you the MyProfile View.

•Step 4 > Click on any entered detail to edit or delete the items. 