feature 'there is a winner' do
  scenario 'checking players hp' do
    sign_in_and_play
    19.times {continue_attack}
    expect(page).to have_content 'Charlotte is the looser'
    end
end