10.times do |proposal|
  Proposal.create!(
    customer: "Customer #{proposal}",
    portfolio_url: 'https://github.com/lmtien',
    tools: 'Ruby on Rails, Angular 4 and Postgresql',
    estimated_hours: (80 + proposal),
    hourly_rate: 120,
    weeks_to_complete: 12,
    client_email: 'tiduslmt@gmail.com'
  )
end