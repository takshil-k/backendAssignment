import scrapy
import dataset

class IndiaMartScraper(scrapy.Spider):
    name = "indiaMart"

    def start_requests(self):
        url="https://www.indiamart.com/"
        yield scrapy.Request(url=url, callback=self.detailsParser)

    def detailsParser(self, response):
        pageTitle = response.css('title::text').get()
        parentProductDiv = response.css('div.product-sec-wrapper')
        for childDiv in parentProductDiv:
            group = childDiv.css('h2::text').get()
            categoryName = childDiv.css('div.product-item>div.product-meta>h3>a::text').getall()
            categoryImg = childDiv.css('div.product-item>div.product-thumbnail>a>img::attr(data-original)').getall()
            print(group,"Group>>>>>>>>>>>>>>>>>>>>>>>>>>")
            print(categoryName,"BoldCategory>>>>>>>>>>>>>>>>>")
            print(categoryImg,"Images>>>>>>>>>>>>>>>>>>>>>")
            categoryParent = childDiv.css('div.product-item')
            for subCategoryDiv in categoryParent:
                subCategoryName = subCategoryDiv.css('div.product-meta>p>a::text').getall()
                print(subCategoryName,"subcategory >>>>>>>>>>>>>>>>>>")
        print(pageTitle)
        pageMainHeading = "".join(response.css('div#connect-buyer>div>h2 *::text').getall())
        pageSubHeading = response.css('div#connect-buyer>div>p::text').get()
        pageMainTags = response.css('section#connect-buyer-wrapper div#connect-buyer>div>ul')
        print(pageMainHeading,pageSubHeading)
        for childLi in pageMainTags:
            tags = response.css('li>p::text').getall()
            print(tags[0]+" "+tags[1]+" "+tags[2])