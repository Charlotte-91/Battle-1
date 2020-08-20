feature 'see player hit points' do
  scenario 'points are displayed after player 2 name' do
    sign_in_and_play
    expect(page).to have_content 'Charlotte: 100 HP'
  end

  scenario 'points are displayed after player 1 name' do
    sign_in_and_play
    expect(page).to have_content 'Yaz: 100 HP'
  end
end
