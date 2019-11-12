module PURFunctionsDSL
  extend self

  def powerupRewards(userName)

    user_login_only(userName)
    sleep 5
    hamburger_menu.click
    if exists{new_user_tutorial}
      new_user_tutorial.click
      sleep 5
    else
      tap_object(540,960)
    end
    page_scroll_down(0.50,0.20)
    pur_option.click


  end

  def purAccountInfo

    pur_account_info.click
    sleep 4
    expect(exists{pur_account_name}).to eq(true)
    expect(exists{pur_account_pointsBalance}).to eq(true)
    expect(exists{pur_account_lifetimePoints}).to eq(true)
    expect(exists{pur_account_purRewardsID}).to eq(true)
    expect(exists{pur_account_tier}).to eq(true)
    expect(exists{pur_account_expiryDate}).to eq(true)
    expect(exists{pur_account_editInformation}).to eq(true)
    press_keycode(4)


  end

  def purMemberActivity

    pur_member_activity.click
    sleep 5
    expect(exists{pur_memberCard_activity}).to eq(true)
    expect(exists{pur_memberRewardRedemption_activity}).to eq(true)
    press_keycode(4)

  end

  def purActiveOffers
    pur_activeOffers.click
    sleep 5
    press_keycode(4)

  end

  def purCardDetails
    pur_cardDetails.click
    expect(exists{pur_cardDetails_info}).to eq(true)
    expect(exists{pur_cardDetails_barcode}).to eq(true)
    expect(exists{pur_cardDetails_payAndSaveToPhone}).to eq(true)
    expect(exists{pur_cardDetails_tradeCreditEasyAccess}).to eq(true)
    press_keycode(4)

  end

  def purRewardsCenter
    pur_rewardsCenter.click
    sleep 5
    expect(exists{pur_rewardsCenter_certificates}).to eq(true)
    expect(exists{pur_rewardsCenter_digitalCurrency}).to eq(true)
    expect(exists{pur_rewardsCenter_sweepstakes}).to eq(true)
    press_keycode(4)

  end

  def purGameInformer
    pur_gameInformer.click
    sleep 5
    expect(exists{pur_gameInformer_features}).to eq(true)
    expect(exists{pur_gameInformer_news}).to eq(true)
    expect(exists{pur_gameInformer_previews}).to eq(true)
    expect(exists{pur_gameInformer_reviews}).to eq(true)


  end

  def pur_GuestUsersPage
    expect(exists{pur_morePowerToThePlayersImage}).to eq(true)
    expect(exists{pur_shopTxtDisplay}).to eq(true)
    expect(exists{pur_scorePointsTxtDisplay}).to eq(true)
    expect(exists{pur_redeemForRewardsTxtDisplay}).to eq(true)
    expect(exists{pur_memberOffersTxtDisplay}).to eq(true)
    expect(exists{pur_learnMoreLink}).to eq(true)
    expect(exists{pur_memberSignInLink}).to eq(true)
    expect(exists{pur_readLatestNewsTxtDisplay}).to eq(true)
    expect(exists{pur_gameInformerImageLink}).to eq(true)

    #Click informer link
    pur_gameInformerImageLink.click
    sleep 5
    expect(exists{pur_gameInformer_features}).to eq(true)
    expect(exists{pur_gameInformer_news}).to eq(true)
    expect(exists{pur_gameInformer_previews}).to eq(true)
    expect(exists{pur_gameInformer_reviews}).to eq(true)
    press_keycode(4)

    #Click Sign In
    pur_memberSignInLink.click
    press_keycode(4)

    #Click Learn More
    pur_learnMoreLink.click



  end

  def pur_NonPurUsersPage
    expect(exists{pur_morePowerToThePlayersImage}).to eq(true)
    expect(exists{pur_shopTxtDisplay}).to eq(true)
    expect(exists{pur_scorePointsTxtDisplay}).to eq(true)
    expect(exists{pur_redeemForRewardsTxtDisplay}).to eq(true)
    expect(exists{pur_memberOffersTxtDisplay}).to eq(true)
    expect(exists{pur_learnMoreLink}).to eq(true)
    expect(exists{pur_readLatestNewsTxtDisplay}).to eq(true)
    expect(exists{pur_gameInformerImageLink}).to eq(true)

    #Click informer link
    pur_gameInformerImageLink.click
    sleep 5
    expect(exists{pur_gameInformer_features}).to eq(true)
    expect(exists{pur_gameInformer_news}).to eq(true)
    expect(exists{pur_gameInformer_previews}).to eq(true)
    expect(exists{pur_gameInformer_reviews}).to eq(true)
    press_keycode(4)


    #Click Learn More
    pur_learnMoreLink.click

  end


end

