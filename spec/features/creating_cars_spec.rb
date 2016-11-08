require 'rails_helper'

feature 'Creating Cars' do
  scenario 'can create a car' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang created')
  end
  # scenario 'Car has been created' do
  #   car = Car.FactoryGirl.create(:car)
  #
  #   visit '/'
  #
  #   expect(page).to have_content(car.make)
  #   expect(page).to have_content(car.model)
  #   expect(page).to have_content(car.year)
  #   expect(page).to have_content(car.price)
  # end
end
