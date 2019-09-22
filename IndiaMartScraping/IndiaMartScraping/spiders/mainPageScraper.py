import scrapy # scraping lib
import dataset # Lib for db operations

class IndiaMartScraper(scrapy.Spider):
    name = "indiaMart" # Unique name for Spider

    def start_requests(self): # gets called internally by scrappy
        url="https://www.indiamart.com/" # url to scrape
        yield scrapy.Request(url=url, callback=self.detailsParser) #callback func is called when response is obtained

    def detailsParser(self, response):

        file1 = open("mysqlPassword.txt","r+")  # read root password from .txt file saved
        dbPassword = file1.read()

        dbConnectionString = dataset.connect('mysql+pymysql://root:{}@127.0.0.1:3306/indiamart'.format(dbPassword)) # establish a db connection string
        groupCategoryTable = dbConnectionString['mainGroups'] # connect with mainGroups table
        pageDetailsTable = dbConnectionString['pageDetails'] # connect with pageDetails table
        subCategoryTable = dbConnectionString['subCategory'] # connect with subCategory table

        subCategoryResetAutoCount = 'ALTER TABLE subCategory AUTO_INCREMENT = 1;' # used to reset auto incrementing primary key

        subCategoryTable.delete() # first delete the table so count is resetted from 1 & not the last used index + 1
        dbConnectionString.query(subCategoryResetAutoCount) # execute query to reset auto increment key

        ########################### Page Details ################################
        pageTitle = response.css('title::text').get()  # extract India Mart page title
        pageMainHeading = "".join(response.css('div#connect-buyer>div>h2 *::text').getall()) # get all the words written in different tags for page main heading
        pageSubHeading = response.css('div#connect-buyer>div>p::text').get() # getting sub heading
        
        pageMainTags = response.css('section#connect-buyer-wrapper div#connect-buyer>div>ul') # mark the parent node to loop over for page tags
        pageTagsArray = []
        for childLi in pageMainTags:
            pageTagsArray = response.css('li>p::text').getall() # getting all page tags 
     
        pageDetailsDict = {   # making a dict similar to db columns & then insert it
            "idpageDetails" : 1,
            "pageTitle" : pageTitle,
            "pageMainHeading" : pageMainHeading,
            "pageSubHeading" : pageSubHeading,
            "pageMainTag" : (pageTagsArray[0]+" | "+pageTagsArray[1]+" | "+pageTagsArray[2])
        }
        pageDetailsTable.upsert(pageDetailsDict,['idpageDetails']) # upsert will update if record present or if not present will insert it.

        ######################## Scrape Product & images ######################################
        parentProductDiv = response.css('div.product-sec-wrapper') # mark parent product div
        groupCategory = response.css('div.product-sec-wrapper>h2::text').getall()  # get all main category, will be referred as groupCategory

        groupCategoryDict = {}
        groupCategoryArray = []
        for index,value in enumerate(groupCategory): # enumerate gives index,value of current value from iterating variable
            groupCategoryDict = { # prepare a dict similar to db structure
                "idmainCategory" : index+1,
                "name" : value
            }
            groupCategoryArray.append(groupCategoryDict) # append the dict to array for insert many operation
        
        groupTablePresent = groupCategoryTable.find_one(name=groupCategory[0]) # check if db has record
        if groupTablePresent:
            groupCategoryTable.delete() # if present deletes all records
            groupCategoryTable.insert_many(groupCategoryArray) # after deletion inserts many
            pass
        else:
            groupCategoryTable.insert_many(groupCategoryArray) # if not present simply insert many


        for index, childDiv in enumerate(parentProductDiv): 
            categoryName = childDiv.css('div.product-item>div.product-meta>h3>a::text').getall() #get all category names under groupCategories
            categoryImg = childDiv.css('div.product-item>div.product-thumbnail>a>img::attr(data-original)').getall() # get all images in these category
            categoryParent = childDiv.css('div.product-item') # mark parent div to get subCatgories
            
            subCategoryArray = []
            for subcategoryIndex,subCategoryDiv in enumerate(categoryParent):
                subCategoryName = subCategoryDiv.css('div.product-meta>p>a::text').getall() # get all subCatgory corresponding to respective category
                subCategoryArray.append(subCategoryName) # insert into array to use it later for mapping
                
            
            for value in zip(categoryName,categoryImg,subCategoryArray): # zip will map all the given array/list provided.
                # value[0] - categoryName, value[1]- it's corresponding image, value[2]- it's corresponding sub category
                imgList = []
                imgList.append(value[1]) # we need to provide scrapy with list of image urls, str is not valid
                yield {
                  "image_urls" : imgList, # key image_urls is default to tell scrapy to download images mentioned in the array/list
                   "category" : value[0], # passing category,subcategory,etc for db operations in pipeline
                   "subCategory" : value[2],
                   "groupTableRef" : index,
                   "dbConnectionString" : dbConnectionString
                   }

