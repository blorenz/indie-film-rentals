from lxml import etree
import os

UPS_API_KEY = '9C99127EB3122933'
UPS_SHIPPER_NUMBER = '72R97F'
UPS_LOGIN = 'fewdalism'
UPS_PASSWORD = 'Colonel1!'


def load_xml(fname):
    s = os.path.join(os.path.dirname(os.path.abspath(__file__)), '../../xml')
    f = open(os.path.join(s, fname), 'r')
    content = f.read()
    f.close()
    return content


def create_access_request(ar):
    doc = etree.fromstring(ar)
    doc.xpath('.//AccessLicenseNumber')[0].text = UPS_API_KEY
    doc.xpath('.//UserId')[0].text = UPS_LOGIN
    doc.xpath('.//Password')[0].text = UPS_PASSWORD
    return etree.tostring(doc)


def create_ship_confirm_request(scr, shipper, shipto, shipfrom):
    doc = etree.fromstring(scr)
    doc.xpath('.//Shipper/Name')[0].text = shipper['name']
    doc.xpath('.//Shipper/PhoneNumber')[0].text = shipper['phone']
    doc.xpath('.//Shipper/ShipperNumber')[0].text = shipper['shipper-number']
    doc.xpath('.//Shipper/TaxIdentificationNumber')[0].text = shipper['tax-id']

    doc.xpath('.//Shipper/Address/AddressLine1')[0].text = shipper['address']
    doc.xpath('.//Shipper/Address/City')[0].text = shipper['city']
    doc.xpath('.//Shipper/Address/StateProvinceCode')[0].text = shipper['state']
    doc.xpath('.//Shipper/Address/PostalCode')[0].text = shipper['postal-code']
    doc.xpath('.//Shipper/Address/CountryCode')[0].text = shipper['country-code']

    doc.xpath('.//ShipTo/CompanyName')[0].text = shipto['company-name']
    doc.xpath('.//ShipTo/AttentionName')[0].text = shipto['attention-name']
    doc.xpath('.//ShipTo/PhoneNumber')[0].text = shipto['phone']

    doc.xpath('.//ShipTo/Address/AddressLine1')[0].text = shipto['address']
    doc.xpath('.//ShipTo/Address/City')[0].text = shipto['city']
    doc.xpath('.//ShipTo/Address/StateProvinceCode')[0].text = shipto['state']
    doc.xpath('.//ShipTo/Address/PostalCode')[0].text = shipto['postal-code']
    doc.xpath('.//ShipTo/Address/CountryCode')[0].text = shipto['country-code']

    doc.xpath('.//ShipFrom/CompanyName')[0].text = shipfrom['company-name']
    doc.xpath('.//ShipFrom/AttentionName')[0].text = shipfrom['attention-name']
    doc.xpath('.//ShipFrom/PhoneNumber')[0].text = shipfrom['phone']

    doc.xpath('.//ShipFrom/Address/AddressLine1')[0].text = shipfrom['address']
    doc.xpath('.//ShipFrom/Address/City')[0].text = shipfrom['city']
    doc.xpath('.//ShipFrom/Address/StateProvinceCode')[0].text = shipfrom['state']
    doc.xpath('.//ShipFrom/Address/PostalCode')[0].text = shipfrom['postal-code']
    doc.xpath('.//ShipFrom/Address/CountryCode')[0].text = shipfrom['country-code']

    doc.xpath('.//PaymentInformation/Prepaid/BillShipper/AccountNumber')[0].text = shipper['shipper-number']
    return etree.tostring(doc)
