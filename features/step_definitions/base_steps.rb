Then("click {string}") do |string|
  page.click_on(string)
end

And /when I click '(.+)'/ do |string|
  page.click_on(string)
end