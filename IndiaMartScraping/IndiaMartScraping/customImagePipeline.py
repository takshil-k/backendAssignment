import scrapy
from scrapy.pipelines.images import ImagesPipeline
from scrapy.exceptions import DropItem
from PIL import Image # for image save, saving
import os # for directory related operations
from .settings import imageDirectory # getting image store path mentioned

class MyImagesPipeline(ImagesPipeline):

    def get_media_requests(self, item, info):
        for image_url in item['image_urls']:
            yield scrapy.Request(image_url)

    def item_completed(self, results, item, info):

        # getting all extra parameters passed when scraping images
        category = item['category']
        subCategory = item['subCategory']
        groupTableRef = item['groupTableRef']
        dbConnectionString = item['dbConnectionString']

        #initialze the tables used
        categoryTable = dbConnectionString['category']
        subCategoryTable = dbConnectionString['subCategory']

        categoryResetAutoCount = 'ALTER TABLE category AUTO_INCREMENT = 1;' # resetting category tables, same as mentioned in mainPageScraper.py
        
        dbConnectionString.query(categoryResetAutoCount)

        newSavePath = imageDirectory + "/" + category # define a new path to save compressed images
         
        if not os.path.exists(newSavePath):
            os.makedirs(newSavePath) # if path not exist, create one.
       
        for trueOk,obj in results:
            if trueOk: # if image is scraped properly i.e response 200
            
                pathToImage = imageDirectory +"/"+ obj['path'] # mention path to old image
                categoryImage = Image.open(pathToImage) # open image using PIL lib

                categoryImage = categoryImage.resize((categoryImage.size),Image.ANTIALIAS) 
                original_save_image = newSavePath + "/" + category + ".jpg" # save image path
                relativeImageSavePath =  "images/" + category + "/" + category + ".jpg" # realtive path to save to db
                categoryImage.save(original_save_image,optimize=True,quality=85) # compress image  save it to path mentioned
                
                categoryDict = {  # define dict with same structure as db
                    "name" : category,
                    "image" : relativeImageSavePath,
                    "idGroupRef" : groupTableRef + 1
                }
                
                categoryTable.upsert(categoryDict,['name']) # if present update or insert record

                categoryTablePresent = categoryTable.find_one(name=category)  # check if category present
                if categoryTablePresent:
                    categoryTableRef = categoryTablePresent.get('idcategory', None) # if present get it's primary key to add in subCategory table
                    subCategoryArray = []
                    for indexSubCategory,subCategoryValue in enumerate(subCategory):
                        tempSubCategoryDict = { # define dict with same structure as db
                            "name" : subCategoryValue,
                            "idCategoryRef" : categoryTableRef
                        }
                        subCategoryArray.append(tempSubCategoryDict) # add to array for insert many operation
                    
                    subCategoryPresent = subCategoryTable.find_one(idCategoryRef=categoryTableRef) # check if records of same category are present in subcategory
                    if subCategoryPresent:
                        subCategoryTable.delete(idCategoryRef=categoryTableRef) # delete only record which match category refrence
                        subCategoryTable.insert_many(subCategoryArray) # insert many subCategories in table, runs all times except the first time
                        pass
                    else:
                        subCategoryTable.insert_many(subCategoryArray) # insert many subCategories in table, runs 1st time

                
       