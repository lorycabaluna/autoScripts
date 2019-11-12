Feature: Code Testing

  Scenario: Test Function
    Then I Sign in with user "bf_gsdc210@qagsecomprod.oib.com" and password "T3sting1"
	Then I Purchase "PreOwned" item with SKU "101344" for "PickupAtStore"
	Then I search store with zip "76501" then select "HoldPreOwned"
	Then I see "Your hold request has been sent!"
	