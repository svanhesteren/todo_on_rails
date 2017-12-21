require 'rails_helper'

feature 'Manage tasks', js: true do
  background do
     # Point your browser towards the todo path
    visit todos_path

    # Enter description in the text field
    fill_in 'todo_title', with: "Be Batman\n"

    # Wait for 1 second so the backend can come back with a response
    sleep(1)
  end

  scenario 'add a new task' do
    # Expect the new task to be displayed in the list of tasks
    expect(page).to have_content('Be Batman')
  end

  scenario 'counter changes' do
    expect( page.find(:css, 'span#todo-count').text ).to eq "1"
  end

  scenario 'complete a task' do
    check('todo-1')

    # Wait for 1 second so the counter can be updated
    sleep(1)

    expect( page.find(:css, 'span#todo-count').text ).to eq "0"
  end
end
