Given /the following goals for the current week exists:/ do |goals_table|
  Goal.create(goals_table.hashes)
end

When /I'm lookin at at the current week/ do
  visit api_v1_weeks_path
end

Then /I can see the list of goals/ do |goals_table|
  goals_table.hashes.each do |goal|
    expect(page).to have_content(goal[:description])
  end
end
