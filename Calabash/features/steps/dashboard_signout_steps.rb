Then (/^I Sign Out$/) do
	steps %Q{
		Then I scroll down
		Then I touch the "SIGN OUT" text
		Then I'm on main page
	}
end


