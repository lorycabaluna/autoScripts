
class XMLManipulation
  attr_reader :login, :password, :card_data, :shipping_data

  def initialize(user_type,card_type)
    # puts 'XMLManipulation is started'
    get_user_details(user_type)
    get_card_details(card_type) if card_type != nil
  end

  def get_card_details(card_type)
    @card_data = Hash.new
    get_xml_data('creditcardinfo').each do |cc_info|
      if cc_info.xpath('cardtype').text == card_type.downcase
        card_data['type'] = cc_info.xpath('cardtype').text
        card_data['number'] = cc_info.xpath('carddetails/number').text
        card_data['expdate'] = cc_info.xpath('carddetails/expirationdate').text
        card_data['cvv'] = cc_info.xpath('carddetails/cvv').text
      end
    end
    @card_data
  end

  def get_user_details(user_type)
    return if user_type == nil
    @shipping_data = Hash.new
    get_xml_data('usercredential').each do |user_info|
      if user_info.xpath('useridentifier').text == user_type.downcase
        @login = user_info.xpath('userdata/loginemail').text
        @password = user_info.xpath('userdata/loginpassword').text
        shipping_data['firstname'] = user_info.xpath('userdata/shipfirstname').text
        shipping_data['lastname'] = user_info.xpath('userdata/shiplastname').text
        shipping_data['country'] = user_info.xpath('userdata/shipcountry').text
        shipping_data['address'] = user_info.xpath('userdata/shipaddress').text
        shipping_data['city'] = user_info.xpath('userdata/shipcity').text
        shipping_data['state'] = user_info.xpath('userdata/shipstate').text
        shipping_data['zip'] = user_info.xpath('userdata/shipzipcode').text
        shipping_data['phonenumber'] = user_info.xpath('userdata/shipphonenumber').text
        shipping_data['email'] = user_info.xpath('userdata/shipemail').text
      end
    end
    @shipping_data
  end

  def get_xml_data(xml_node)
    xml_file = File.read('C:\dev\GS.Automation.AndroidApp\Framework\Data\config\config.xml')
    doc = Nokogiri::XML.parse(xml_file)
    doc.xpath("//#{xml_node}")
  end
end