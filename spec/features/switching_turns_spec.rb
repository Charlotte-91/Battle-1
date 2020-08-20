feature 'switching turns' do
    scenario 'player1 turn' do
     sign_in_and_play
     expect(page).to have_content "Yaz's turn!"
    end

    scenario 'player2 turn' do
     sign_in_and_play
     click_button('Attack')
     click_button('OK')
     expect(page).to have_content "Charlotte's turn!"
    end
end