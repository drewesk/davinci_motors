require 'rails_helper'

feature 'Creating a Car' do
  scenario 'User creates car' do
    visit '/cars/new'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang created')
    end

  scenario 'User edits an existing car' do
    edited_car = FactoryGirl.create(:car)

    visit "/cars/#{edited_car.id}/edit"

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Update'

    expect(page).to have_content('Car was successfully updated')
  end

  scenario 'User views a car' do

    viewed_car = FactoryGirl.create(:car)

    visit "/cars/#{viewed_car.id}"

    expect(page).to have_content(viewed_car.make)
    expect(page).to have_content(viewed_car.model)
    expect(page).to have_content(viewed_car.year)
    expect(page).to have_content(viewed_car.price)
  end

  scenario 'User deletes a car' do

    deleted_car = FactoryGirl.create(:car)

    visit '/cars'

    click_link "Destroy"

    expect(page).to_not have_content(deleted_car.make)
    expect(page).to_not have_content(deleted_car.model)
    expect(page).to_not have_content(deleted_car.year)
    expect(page).to_not have_content(deleted_car.price)
  end
end

feature do
  'Creating a Second Car'
  scenario 'User creates and edits a second car' do
    visit '/cars/new'

    fill_in 'Make', with: 'Bugatti'
    fill_in 'Model', with: 'Veyron'
    fill_in 'Year', with: '2016'
    fill_in 'Price', with: '222300'

    click_button 'Create Car'

    expect(page).to have_content('2016 Bugatti Veyron created')

    click_link 'Edit'

    fill_in 'Make', with: 'Bugatti'
    fill_in 'Model', with: 'Veyron'
    fill_in 'Year', with: '2016'
    fill_in 'Price', with: '222300'

    click_button 'Update'

    expect(page).to have_content('Car was successfully updated')
  end
end


