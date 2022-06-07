--------------------------------------------------------------------------------------------
COS 221 PA5
Group: PerfectStrangers
ReadMe File
--------------------------------------------------------------------------------------------

Please read and followung the instructions below to retrieve the database:

1. Download and save the sportsdb.sql file. Know the file path - it is crucial.

2. Open your MariaDB connection on MySQL Workbench.

3. Open your administration tab on your bottom left and choose "Data Import/Restore"

4. Choose the "Import from Self-Contained File" option. NOTE: Ensure that the file path on your right is the one from step 1! (the file path should end with: sportsdb.sql)

5. Ensure you have chosen the "Dump Structure and Data" option.

6. Click on the "Start Import" button.

The import should now run and the database is now on your workbench.

********************************************************************************************
Ensuring the database connection is configured correctly:

Due to multiple individuals working on the project at once, we had to use environment variables to connect to the database and we suggest the same for marking. 

Creating Environment Variables:

1. search environment variables in search bar, go to "Edit the system environment variables"

2. In "Advanced" tab, go into "Environment Variables" button

3. In user or system create the above environment variables (Click "New" and enter data) 

4. Enter the following details:

	SPORTS_DB_HOST 		127.0.0.1 //or the localhost address to be used to run the website

	SPORTS_DB_NAME		sportsdb
	
	SPORTS_DB_PASSWORD	***** (enter the password for your mariaDB connection)

	SPORTS_DB_USERNAME	root //ensure it is the name of your mariaDB connection on Workbench


THESE  ENVIROMENT VARIABLES ARE IMPORTNAT FOR THE CONFIG FILE, WHICH IS USED TO CONNECT THE WEBSITE TO THE DATABASE INSTANCE

********************************************************************************************

Please read and follow the instructions below to build and execute the website:

1. Download and save the file labeled "perfect_strangers_code"

2. Move the file from your local storage to your server folder (e.g: localhost file under xampp)

3. Ensure that your server is running on a recognisable port

4. Open your broswer and locate the folder through your server route

5. add "\index.php" to your file path in step 4, this must open the index page on your browswer

The index page has header tabs and in-screen tabs that will allow you to explore (and test) the rest of the website implemented. We recommend you login first before attempting to access any other tab.

********************************************************************************************

Default Login Details

NOTE: You are more than welcome to register and use your own login details thereafter, however, we are providing login details for demo (and marking) purposes.

	Email: tester@hotmail.com

	Password: test@Me.986

Now that you have logged in, the website should allow you to visit other tabs.

********************************************************************************************