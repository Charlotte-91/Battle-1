feature 'there is a winner' do
  scenario 'checking players hp' do
    sign_in_and_play
    18.times {continue_attack}
    click_button('Attack')
    expect(page).to have_content 'Charlotte is the loser'
    end
end