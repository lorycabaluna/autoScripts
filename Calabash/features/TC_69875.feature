Feature: TC 69875 - Digital Product (Auth)

  Scenario: TC 69875 - Digital Product (Auth)
	Then my test Id is "69875"
	Then I login
	Then I'm on main page
	Then I clear items in cart
	Then I Purchase "Download" item as "Default"
	Then I verify Checkout page with "DIGITAL DOWNLOAD"
	Then I Place Order