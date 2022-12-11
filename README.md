# vector
Vector test exam

1. Use Terraform to create Linux VM Azure
	- update password
	- created vector folder
	- Install python3
	- sudo apt install python3-pip
	- cat > requirements.txt (create requirements file)

	Note: 
	Path full path: /home/azureuser/vector/api.py

2. Created the following files
    - api.service
    - api.sh
    - install.sh

3. Set the access permission to api.py file:

    - $ chmod 755 <api.py>

4. Then install the service with:

    - $ sudo bash ./install.sh

5. Then trigger the service with systemctl or restart machine if needed.

    - Then start service:

        $ sudo service api.service start

    - Check status:

        $ sudo service test status
