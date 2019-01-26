Given /the following goals for the current week exists:/ do |goals_table|
  week = Week.new
  goals = goals_table.hashes.map do |goal|
    goal['week'] = week
    goal
  end
  Goal.create(goals)
end

Then /I can see the list of goals/ do |goals_table|
  goals_table.hashes.each do |goal|
    expect(page).to have_content(goal[:description])
  end
end

Then /I can see a form to add a new goal/ do
  expect(page).to have_selector("form.new-goal input.description")
  expect(page).to have_selector("form.new-goal button.add")
end

And /when I fill the description field with '(.+)'/ do |goal|
  find("form.new-goal input.description").set(goal)
end

Then /I see '(.+)' in the goals list/ do |goal|
  expect(page).to have_content(goal)
end