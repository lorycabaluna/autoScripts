module DriverModules
  module LogOn
    extend self

    def email
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/signin_email_edittext",__method__)

    end

    def email_preprod
      FindersDef.new(self).find_element("id","com.gamestop.powerup.preprod:id/signin_email_edittext",__method__)

    end

    def pass
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/signin_pass_edittext",__method__)

    end

    def pass_preprod
      FindersDef.new(self).find_element("id","com.gamestop.powerup.preprod:id/signin_pass_edittext",__method__)

    end

    def sign_in_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/signin_signin_textview",__method__)
      # wait(20) { find_element(:id, 'signin_signin_textview') }
    end

    def sign_in_button_preprod
      FindersDef.new(self).find_element("id","com.gamestop.powerup.preprod:id/signin_signin_textview",__method__)
      # wait(20) { find_element(:id, 'signin_signin_textview') }
    end

    def create_account_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/signin_createaccount_textview",__method__)
      # wait(20) { find_element(:id, 'signin_createaccount_textview') }
    end

    def forgot_password_link
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/signin_forgotpassword_textview",__method__)
      # wait(20) { find_element(:id, 'signin_forgotpassword_textview') }
    end

    def sign_in_message
      # wait(20) { find_elements(:xpath, "//android.widget.TextView[contains(@resource-id,'message')]") }
      FindersDef.new(self).find_element("id","android:id/message",__method__)
    end

    def press_ok
      FindersDef.new(self).find_element("xpath","//android.widget.Button[@text='OK' ] | //android.widget.Button[@text='CONTINUE'][@index=1]",__method__)
    end

    def sign_in_error
      # wait(20) { find_elements(:xpath, "//android.widget.TextView[contains(@resource-id,'signin_error_textview')]") }
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/signin_error_textview",__method__)
    end

  end
end

# module Kernel
#   def logon
#     Pages::LogOn
#   end
# end