# Database queries and database design Exam

# Technologies used

- Docker, MySQL Workbench

# How to run the assignments

**Warning:** All assignments are provided in Lithuanian.

## Preparation

- Download and install Docker.
- In Docker or any other terminal, run the command: `docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d -p 3306:3306 mysql:lts`
**Replace my-secret-pw with your chosen password (you will need it later).**
- Download and install MySQL Workbench Visual Database Designer.
- Create a new Connection. In the Password field, select Store in Vault and enter the password you used when creating the Docker container.
- Connect to your newly created virtual server.

# Running the assignments

- Clone the repository.
- Open MySQL Workbench and connect using your created connection.
- In the top-left corner, click Open a SQL script file in a new query tab.
- Select the 1 folder. Inside, you will find two files.
- First, run **banku_sistema_db.sql** — this will import the database used for the tasks.
- After opening the file, execute its code to import the database.
- Next, repeat the file‑opening steps in MySQL and open the other file named **banku_sistema_uzklausos_kleismantas.sql**, which contains the tasks and their solutions.
- Execute each task line separately so you can see the results at the bottom of the program.

- In the second DB design task, you need to open the designed database.
**Warning:** The DB design assignment in the Word file is provided in Lithuanian.
- Open it in MySQL Workbench by selecting File > Open Model… and choosing the file **mokyklos_kleismantas.mwb**.
- After opening the file, you will see the designed database.

# Additional information

- You can also see the designed database for the second task in the image located in the second task’s folder.
- The file mokyklos_kleismantas2.mwb was created at home after the exam to further improve DB design skills.
