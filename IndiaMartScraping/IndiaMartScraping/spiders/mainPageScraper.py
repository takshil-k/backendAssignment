import scrapy
import dataset

class IndiaMartScraper(scrapy.Spider):
    name = "indiaMart"

    def start_requests(self):
        url="https://www.indiamart.com/"
        yield scrapy.Request(url=url, callback=self.detailsParser)

    def detailsParser(self, response):
        group = response.css('div.product-sec-wrapper>h2::text').get()
        print(group)
        # img = response.css('div.product-banner.pbnr1::attr(style)').get()
        # print(img,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
        img = response.css('div.product-item>div.product-thumbnail>a>img::attr(data-original)').get()
        print(img)