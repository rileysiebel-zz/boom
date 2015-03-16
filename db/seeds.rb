# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Accounts

riley = Account.create!(name: 'Riley')
bank = Account.create!(name: 'Bank', parent: riley)
Account.create!(name: 'Wells Fargo Savings', parent: bank)
checking = Account.create!(name: 'Wells Fargo Checking', parent: bank)
Account.create!(name: 'Wells Fargo Credit Card', parent: bank)
Account.create!(name: '207 Guerrero St', parent: riley)
Account.create!(name: 'Audi A5', parent: riley)
Account.create!(name: 'C3 Energy')

siebel = Account.create!(name: 'Siebel Living Trust')
wells = Account.create!(name: 'Wells Fargo Mortgage')

# Flows
Flow.create!(name: 'Mortgage Payment to Siebel Trust', source: checking, sink: siebel, amount: 1300.68)
Flow.create!(name: 'Mortgage Payment to Wells Fargo', source: checking, sink: wells, amount: 4702.37)
Flow.create!(name: 'Income from C3 Energy', source: C3, sink: checking, amount: 6250)