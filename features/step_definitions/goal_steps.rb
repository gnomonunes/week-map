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

Then /I can see a button to delete each goal/ do
  page.all(".week-goals li").each do |li|
    expect(li).to have_selector(".delete-goal")
  end
end

And /when I click the delete button for '(.+)'/ do |goal|
  page.all(".week-goals li", text: "work out at least 3").first
    .find(".delete-goal").click
end

Then /I don't see '(.+)' in the goals list/ do |goal|
  expect(page).not_to have_content(goal)
end