When /I go to (.+)/ do |resource_description|
  visit resolve_path resource_description
end

def resolve_path resource_description
  case resource_description
  when 'the current week'
    api_v1_weeks_path
  end
end