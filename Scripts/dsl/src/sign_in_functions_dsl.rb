module SignInFunctionsDSL
  extend self

  def close_new_user_dashboard_tutorial
    $log.trace("SigninFunctionsDSL: #{__method__}")

      if exists{new_user_tutorial}
        new_user_tutorial.click
      end


  end

  def sign_in_as_authenticated_user(e_mail, pass_word)
    # $log.trace("SignInFunctionsDSL: #{__method__}: #{e_mail}, #{pass_word}")
    # $log.trace("Click hamburger menu")
    sleep 5
    hamburger_menu.click
    #home_header_to_tap('search')
    #$log.trace("Click Sign-in option")
    sign_in_option.click
    sleep 7
    email.click
    email.clear
    enter_text(email, e_mail)
    #press_tab
    enter_text(pass, pass_word)
    sleep 10
    $log.trace("click sign-in button")
    sign_in_button.click
    $log.trace("Close enable fingerprint pop-up")
    close_enable_fprint_dboard



  end

  def sign_in_as_authenticated_user_preprod(e_mail, pass_word)
    # $log.trace("SignInFunctionsDSL: #{__method__}: #{e_mail}, #{pass_word}")
    # $log.trace("Click hamburger menu")
    sleep 5
    hamburger_menu.click
    #home_header_to_tap('search')
    #$log.trace("Click Sign-in option")
    sign_in_option.click
    sleep 7
    email.click
    email.clear
    enter_text(email_preprod, e_mail)
    #press_tab
    enter_text(pass_preprod, pass_word)
    sleep 10
    $log.trace("click sign-in button")
    sign_in_button_preprod.click
    $log.trace("Close enable fingerprint pop-up")
    close_enable_fprint_dboard



  end


  def log_out
    $log.trace("SigninFunctionsDSL: #{__method__}")
    $log.trace("Click hamburger menu")
    hamburger_menu.click
    close_new_user_dashboard_tutorial
    sleep 10
    $log.trace("Click sign out option")
    #scroll_to('SIGN OUT')
    page_scroll_down(0.90,0.30)
    #sleep 5
    # if exists{sign_out_option}
    #   sign_out_option.click
    # else
      tap_object(150,1691)
    sleep 5

  end

  def log_out_user_account


      sleep 5
      hamburger_menu.click
      close_new_user_dashboard_tutorial
      sleep 5
      scroll_to('SIGN OUT')
      sign_out_option.click



  end




  def close_enable_fprint_dboard
    $log.trace("SignInFunctionsDSL: #{__method__}")
    sleep 7

    # signin_message_exists = exists{sign_in_message}
    # if signin_message_exists
    #   # signin_message = sign_in_message
    #   signin_message_text = sign_in_message.text
    #   if signin_message_text.include?('fingerprint') then
    #     no_or_cancel_link.click
    #   else
    #     fail(signin_message_text)
    #   end
    # else
    #   fail("#{sign_in_error.text}") if exists{sign_in_error}
    # end
    #
    if exists{sign_in_message}
      no_or_cancel_link.click
    end


    sleep 10


  end

  def close_all_recent_app
    $log.trace("SignInFunctionsDSL:  #{__method__}")
    press_keycode(187)
    sleep 5
    until close_recent_app_button == nil
      close_recent_app_button[0].click
      sleep 3
    end
    sleep 10
  end

  # def restart_app
  #   $log.trace("SignInFunctionsDSL:  #{__method__}")
  #   restart
  # end

    def user_login_and_sku_search(user_type,sku_number, isClearCartTrueFalse)

      #puts user_type

      case user_type.upcase


        when "GUEST"
                # No need to login
        when "AUTHENTICATED"
              sign_in_as_authenticated_user('auto_user_04@qagsecomprod.oib.com','Testing123')

        when "PURPRO"
              sign_in_as_authenticated_user('auto_user_07@qagsecomprod.oib.com','Testing123')
        when "NONPUR"
              sign_in_as_authenticated_user('auto_user_02@qagsecomprod.oib.com','Testing123')
        when "PURBASIC"
              sign_in_as_authenticated_user('auto_user_03@qagsecomprod.oib.com','Testing123')
        when "PURELITE"
              sign_in_as_authenticated_user('elitetestcard02_@qagsecomprod.oib.com','Testing123')
        when "ECPNONPUR"
              sign_in_as_authenticated_user('lnonpur@qagsecomprod.oib.com','Testing123')
        when "ECPPLAYER"
              sign_in_as_authenticated_user('lplayer@qagsecomprod.oib.com','Testing123')
        when "ECPPRO"
              sign_in_as_authenticated_user('lpro@qagsecomprod.oib.com','Testing123')

        when "PREPRO"
              sign_in_as_authenticated_user('sfccpro2@qagsecomprod.oib.com','Testing123')

        when "PREPLAYER"
              sign_in_as_authenticated_user('sfccplayer2@qagsecomprod.oib.com','Testing123')

        when "PREELITE"
              sign_in_as_authenticated_user('prodelitefornativeapp1@qagsecomprod.oib.com','Testing123')

        when "PRENONPUR"
              sign_in_as_authenticated_user('bf_gsdc32@qagsecomprod.oib.com','Testing123')

        else
             puts "Invalid user!... Please enter a valid user."


      end


      sleep 5

        if isClearCartTrueFalse
          clear_cart
          sleep 5
        end

        sku_item_search(sku_number)


    end

    def user_login_only(user_type)

      case user_type.upcase

      when 'GUEST'
        # No need to login
      when 'AUTHENTICATED'
        sign_in_as_authenticated_user('auto_user_04@qagsecomprod.oib.com','Testing123')
      when 'PURPRO'
        sign_in_as_authenticated_user('auto_user_07@qagsecomprod.oib.com','Testing123')
      when 'NONPUR'
        sign_in_as_authenticated_user('auto_user_02@qagsecomprod.oib.com','Testing123')
      when 'PURBASIC'
        sign_in_as_authenticated_user('auto_user_03@qagsecomprod.oib.com','Testing123')
      when 'PURELITE'
        sign_in_as_authenticated_user('elitetestcard02_@qagsecomprod.oib.com','Testing123')
      when 'PLAYER'
        sign_in_as_authenticated_user('bf_gsdc355@qagsecomprod.oib.com','T3sting1')
      when 'ECPNONPUR'
        sign_in_as_authenticated_user('lnonpur@qagsecomprod.oib.com','Testing123')
      when 'ECPPLAYER'
        sign_in_as_authenticated_user('lplayer@qagsecomprod.oib.com','Testing123')
      when 'ECPPRO'
        sign_in_as_authenticated_user('lpro@qagsecomprod.oib.com','Testing123')

      when "PREPRO"
        sign_in_as_authenticated_user('sfccpro2@qagsecomprod.oib.com','Testing123')

      when "PREPLAYER"
        sign_in_as_authenticated_user('sfccplayer2@qagsecomprod.oib.com','Testing123')

      when "PREELITE"
        sign_in_as_authenticated_user('prodelitefornativeapp1@qagsecomprod.oib.com','Testing123')

      when "PRENONPUR"
        sign_in_as_authenticated_user('bf_gsdc32@qagsecomprod.oib.com','Testing123')

      else
        puts "Invalid user!... Please enter a valid user."


      end



    end


    def guest_user_only(sku_number,isClearCartTrueFalse)
      if isClearCartTrueFalse
        clear_cart
        sleep 5
      end

      sku_item_search(sku_number)

      # search_icon.click
      # search_field.send_keys(sku_number)
      # keypad_search_button_tap
      # sleep 8
      #
      # sku_item_search
      # ### Click again if item selected still exist #####
      #
      # @countItem = 0
      # while exists{search_result_list_item} and @countItem <= 7
      # search_result_list_item.click
      # @countItem += 1
      # sleep 10
      # end
      #
      # ### Check if item is not displayed ####
      #
      # @count = 0
      # while exists{unable_to_search_item} and @count <= 7
      #   search_field.click
      #   keypad_search_button_tap
      #   @count+=1
      #
      #   sleep 3
      #
      # end


    end


    def search_for_item(sku_number)

      # search_icon.click
      # search_field.send_keys(sku_number)
      # keypad_search_button_tap
      # sleep 8

      sku_item_search(sku_number)

      # ### Check if item is not displayed ####
      #
      # @count = 0
      # while exists{unable_to_search_item} and @count <= 7
      #   search_field.click
      #   keypad_search_button_tap
      #   @count+=1
      #
      #   sleep 3
      #
      # end
      #
      #
      # ### Click again if item selected still exist #####
      #
      # @countItem = 0
      # while exists{search_result_list_item} and @countItem <= 7
      #   search_result_list_item.click
      #   @countItem += 1
      #   sleep 10
      # end


    end


    def user_login_and_logout(user_type)



      case user_type.upcase


      when 'AUTHENTICATED'
        sign_in_as_authenticated_user('auto_user_04@qagsecomprod.oib.com','Testing123')

      when 'PURPRO'
        sign_in_as_authenticated_user('auto_user_07@qagsecomprod.oib.com','Testing123')
      when 'NONPUR'
        sign_in_as_authenticated_user('auto_user_02@qagsecomprod.oib.com','Testing123')
      when 'PURBASIC'
        sign_in_as_authenticated_user('auto_user_03@qagsecomprod.oib.com','Testing123')
      when 'PURELITE'
        sign_in_as_authenticated_user('elitetestcard02_@qagsecomprod.oib.com','Testing123')
      when 'ECPNONPUR'
        sign_in_as_authenticated_user('lnonpur@qagsecomprod.oib.com','Testing123')
      when 'ECPPLAYER'
        sign_in_as_authenticated_user('lplayer@qagsecomprod.oib.com','Testing123')
      when 'ECPPRO'
        sign_in_as_authenticated_user('lpro@qagsecomprod.oib.com','Testing123')

      when "PREPRO"
        sign_in_as_authenticated_user('sfccpro2@qagsecomprod.oib.com','Testing123')

      when "PREPLAYER"
        sign_in_as_authenticated_user('sfccplayer2@qagsecomprod.oib.com','Testing123')

      when "PREELITE"
        sign_in_as_authenticated_user('prodelitefornativeapp1@qagsecomprod.oib.com','Testing123')

      else
        puts "Invalid user!... Please enter a valid user."


      end

      clear_cart
      sleep 5
      back_to_home_page
      #log_out_user_account
      log_out


    end

  def pre_prod_user_login_and_sku_search(user_type,sku_number, isClearCartTrueFalse)

    #puts user_type

    case user_type.upcase


    when "GUEST"
      # No need to login

    when "PREPRO"
          sign_in_as_authenticated_user_preprod('sfccpro2@qagsecomprod.oib.com','Testing123')

    when "PREPLAYER"
          sign_in_as_authenticated_user_preprod('sfccplayer2@qagsecomprod.oib.com','Testing123')

    when "PREELITE"
          sign_in_as_authenticated_user_preprod('prodelitefornativeapp1@qagsecomprod.oib.com','Testing123')

    when "PRENONPUR"
          sign_in_as_authenticated_user_preprod('bf_gsdc32@qagsecomprod.oib.com','Testing123')

    else
      puts "Invalid user!... Please enter a valid user."


    end


    sleep 5

    if isClearCartTrueFalse
      clear_cart_preprod
      sleep 5
    end

    sku_item_search_preprod(sku_number)


  end


end

