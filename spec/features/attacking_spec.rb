feature 'attacking' do
  scenario 'be attacked by player1' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content "Yaz attacked Charlotte"
  end

  scenario 'reduces HP by 10' do
    sign_in_and_play
    click_button("Attack")
    click_button("OK")
    expect(page).not_to have_content 'Charlotte: 100 HP'
    expect(page).to have_content 'Charlotte: 90 HP'
  end

  scenario 'be attacked by player2' do
    sign_in_and_play
    click_button('Attack')
    click_button("OK")
    click_button("Attack")
    expect(page).to have_content "Charlotte attacked Yaz"
  end

  scenario 'reduces HP by 10' do
    sign_in_and_play
    click_button("Attack")
    click_button("OK")
    click_button("Attack")
    click_button("OK")
    expect(page).not_to have_content 'Yaz: 100 HP'
    expect(page).to have_content 'Yaz: 90 HP'
  end
end
