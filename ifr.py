urls = [
'http://www.ohiohdvideo.com/subcategory_new.php?scatid=657',
'http://www.ohiohdvideo.com/subcategory_new.php?scatid=9',
'http://www.ohiohdvideo.com/subcategory_new.php?scatid=660',
'http://www.ohiohdvideo.com/subcategory_new.php?scatid=19',
'http://www.ohiohdvideo.com/subcategory_new.php?scatid=18',
'http://www.ohiohdvideo.com/subcategory_new.php?scatid=658',
'http://www.ohiohdvideo.com/subcategory_new.php?scatid=10',
'http://www.ohiohdvideo.com/subcategory_new.php?scatid=659',
'http://www.ohiohdvideo.com/subcategory_new.php?scatid=12',
'http://www.ohiohdvideo.com/subcategory_new.php?scatid=14',
'http://www.ohiohdvideo.com/subcategory_new.php?scatid=20',
'http://www.ohiohdvideo.com/subcategory_new.php?scatid=33',
'http://www.ohiohdvideo.com/subcategory_new.php?scatid=36',
'http://www.ohiohdvideo.com/subcategory_new.php?scatid=34',
'http://www.ohiohdvideo.com/subcategory_new.php?scatid=689',
'http://www.ohiohdvideo.com/subcategory_new.php?scatid=15',
'http://www.ohiohdvideo.com/subcategory_new.php?scatid=35',
]

products = []


import csv, codecs, cStringIO

class UnicodeWriter:
    """
    A CSV writer which will write rows to CSV file "f",
    which is encoded in the given encoding.
    """
    
    def __init__(self, f, dialect=csv.excel, encoding="utf-8", **kwds):
        # Redirect output to a queue
        self.queue = cStringIO.StringIO()
        self.writer = csv.writer(self.queue, dialect=dialect, **kwds)
        self.stream = f
        self.encoder = codecs.getincrementalencoder(encoding)()

    def writerow(self, row):
        self.writer.writerow([s.encode("utf-8") for s in row])
        # Fetch UTF-8 output from the queue ...
        data = self.queue.getvalue()
        data = data.decode("utf-8")
        # ... and reencode it into the target encoding
        data = self.encoder.encode(data)
        # write to the target stream
        self.stream.write(data)
        # empty queue
        self.queue.truncate(0)

    def writerows(self, rows):
        for row in rows:
            self.writerow(row)
            

c = UnicodeWriter(open('ifr.csv','wb'))

c.writerow(['Name','Description','Image','Daily','Weekly','Monthly','Full Desc'])

for url in urls:
     d = PyQuery(requests.get(url).text).find('div.callout.left > a')
     for x in d:
         products.append('http://www.ohiohdvideo.com/' + PyQuery(x).attr('href'))
         

for url in products:
     page = PyQuery(requests.get(url).text)
     c.writerow([ page('#productName').text(),
     page('#productDescription').text(),
     page('.productCallout img').attr('src'),
     page('#p_daily').text(),
     page('#p_weekly').text(),
     page('#p_monthly').text(),
     page('#fullDesc').html(),])
