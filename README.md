# backendAssignment

## First Install mysql to your system if not present
Ubuntu - [For Ubuntu click here](https://support.rackspace.com/how-to/installing-mysql-server-on-ubuntu/)

Mac - [Click here](https://dev.mysql.com/doc/mysql-osx-excerpt/5.7/en/osx-installation-pkg.html)

Windows - [Click here](https://www.tutorialspoint.com/mysql/mysql-installation.htm)

## Install python 3.6 if not present 
[Ubuntu](https://askubuntu.com/questions/865554/how-do-i-install-python-3-6-using-apt-get)
[Official Site link](https://www.python.org/downloads/release/python-362/)

## Install pip3 after installing python 3.6
sudo apt install python3-pip
For any problems refer: [here](https://stackoverflow.com/questions/6587507/how-to-install-pip-with-python-3)

## Install pipenv 
pip3 install pipenv
[link](https://pypi.org/project/pipenv/)

## Install mysql workbench (Optional)
Follow instructions with the below links:
[Oracle link](https://docs.oracle.com/cd/E19078-01/mysql/mysql-workbench/wb-installing.html)

## Follow all the steps mentioned below in order to get scraped data.
To run Project:
1. Open your shell/terminal, crtl + shift + T for ubuntu, [MAC link](https://www.howtogeek.com/210147/how-to-open-terminal-in-the-current-os-x-finder-location/), [windows link](https://www.quora.com/How-do-I-open-terminal-in-windows)
2. ```git clone https://github.com/takshil-k/backendAssignment.git```
3. ```cd backendAssignment```
4. ```pipenv install```
5. ```pipenv shell```
6. ```cd IndiaMartScraping/IndiaMartScraping```
7. ```python mysqlRequestPassword.py```
8. mysql -u root -p indiamart < indiaMartWithoutData.sql ( If you don't want to import scraped data) or use mysql -u root -p indiamart < indiamartDbData.sql ( if you want to import with data )
9. Enter the command ```scrapy crawl indiaMart``` in your terminal shell
10. If installing steps & running steps are done properly, you will have scraped data from India Mart in your mysql db. If you have installed mySql workbench you can check it. Or you can use mysql from terminal to check it.
11. Execute ```exit``` to Exit from pipenv shell virtual environment

## Difficulties faced :
Could not scrape the background images of main products

## Improvements :
- [ ] Make readme more proper giving proper links for various OS
- [ ] Automate mysql queries of importing so it doesn't take an additional step
- [ ] Scrape the Reviews & youtube video links in the website
- [ ] Scraping the slider images, Trending now sections.
- [ ] Making scrapy follow individual product page links & scraping detailed product information.
- [ ] Better quality code handling errors, if proper inputs are not given.