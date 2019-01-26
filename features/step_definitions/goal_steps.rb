Given /the following goals for the current week exists:/ do |goals_table|
  Goal.create(goals_table.hashes)
end

Then /I can see the list of goals/ do |goals_table|
  goals_table.hashes.each do |goal|
    expect(page).to have_content(goal[:description])
  end
end

Then /I can see a field to add a new goal/ do
  expect(page).to have_selector("input.new-goal-description")
end