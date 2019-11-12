module DriverModules
  module PUR
    extend self
    # class << self


    def pur_option

      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='POWERUP REWARDS']",__method__)
    end

    def pur_account_info

      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/rewards_purmain_puriconimageview",__method__)
    end

    def pur_account_name

      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/accountdetails_nametextview",__method__)
    end

    def pur_account_pointsBalance

      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='Points Balance']",__method__)
    end

    def pur_account_lifetimePoints

      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='Lifetime Points']",__method__)
    end

    def pur_account_purRewardsID

      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='PowerUp Rewards ID']",__method__)
    end

    def pur_account_tier

      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='Tier']",__method__)
    end

    def pur_account_expiryDate

      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='Expiration Date']",__method__)
    end

    def pur_account_editInformation

       FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/accountdetails_editlinktextview",__method__)

    end

    def pur_member_activity
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/rewards_purmain_memberactivitylayout",__method__)
    end

    def pur_memberCard_activity
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='CARD ACTIVITY']",__method__)
    end

    def pur_memberRewardRedemption_activity
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='REWARD REDEMPTIONS']",__method__)
    end

    def pur_activeOffers
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/rewards_purmain_redeemlayout",__method__)
    end

    def pur_cardDetails
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/rewards_purmain_cardlayout",__method__)
    end

    def pur_cardDetails_info
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/card_imageview",__method__)
    end

    def pur_cardDetails_barcode
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/card_scannable_imageview",__method__)
    end

    def pur_cardDetails_payAndSaveToPhone
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/save_to_wallet",__method__)
    end

    def pur_cardDetails_tradeCreditEasyAccess
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/loyaltycard_bottom_nosvs",__method__)
    end

    def pur_rewardsCenter
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/rewards_purmain_leftbannerimageview",__method__)
    end

    def pur_rewardsCenter_certificates
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='CERTIFICATES']",__method__)
    end

    def pur_rewardsCenter_digitalCurrency
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='DIGITAL CURRENCY']",__method__)
    end

    def pur_rewardsCenter_sweepstakes
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='SWEEPSTAKES']",__method__)
    end

    def pur_gameInformer
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/rewards_purmain_rightbannerimageview",__method__)

    end

    def pur_gameInformer_features
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='FEATURES']",__method__)

    end

    def pur_gameInformer_news
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='NEWS']",__method__)

    end

    def pur_gameInformer_previews
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='PREVIEWS']",__method__)

    end

    def pur_gameInformer_reviews
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='REVIEWS']",__method__)

    end

    #### For Guest and Non PUR users ####

    def pur_morePowerToThePlayersImage
      FindersDef.new(self).find_element("xpath","(//android.widget.ImageView[@content-desc='NO_RESOURCE_NAME'])[1]",__method__)

    end

    def pur_shopTxtDisplay
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='SHOP']",__method__)

    end

    def pur_scorePointsTxtDisplay
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='SCORE POINTS']",__method__)

    end

    def pur_redeemForRewardsTxtDisplay
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='REDEEM FOR REWARDS']",__method__)

    end

    def pur_memberOffersTxtDisplay
      FindersDef.new(self).find_element("xpath","(//android.widget.TextView[@content-desc='NO_RESOURCE_NAME'])[2]",__method__)

    end

    def pur_learnMoreLink
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='LEARN MORE']",__method__)

    end

    def pur_memberSignInLink
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='Already a Member? Sign in']",__method__)

    end

    def pur_readLatestNewsTxtDisplay
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='READ THE LATEST NEWS FROM']",__method__)

    end

    def pur_gameInformerImageLink
      FindersDef.new(self).find_element("xpath","//android.widget.ImageView[@content-desc='rewards_nonpurmain_news_center_image']",__method__)

    end








  end


end

