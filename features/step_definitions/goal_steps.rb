Given /the following goals for the current week exists:/ do |goals_table|
  Goal.create(goals_table.hashes)
end

Then /I can see the list of goals/ do |goals_table|
  goals_table.hashes.each do |goal|
    expect(page).to have_content(goal[:description])
  end
end
