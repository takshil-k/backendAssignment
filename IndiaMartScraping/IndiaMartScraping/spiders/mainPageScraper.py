import scrapy
import dataset

class IndiaMartScraper(scrapy.Spider):
    name = "indiaMart"

    def start_requests(self):
        url="https://www.indiamart.com/"
        yield scrapy.Request(url=url, callback=self.detailsParser)

    def detailsParser(self, response):
        None