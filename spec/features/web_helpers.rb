def sign_in_and_play
  visit('/')
  fill_in :player1, with: 'Yaz'
  fill_in :player2, with: 'Charlotte'
  click_button('Submit')
end

def continue_attack
  click_button('Attack')
  click_button('OK')
end