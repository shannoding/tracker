every 7.days do
  rake "ts:rebuild"
end

every :hour do
  rake "slack:notify"
end
