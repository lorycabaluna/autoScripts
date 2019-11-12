#!/bin/sh
FIRST_ARGUMENT="$1"


RETURN_CODE=0

cd /Users/s_teamcity/.calabash

export ANDROID_HOME="/Users/s_teamcity/Library/Android/sdk/"
export PATH=$ANDROID_HOME:$PATH

Calabash-android resign $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk

#Trades
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_40923.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_40923_Games.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_40924_Consoles.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_40925_Electronics.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_40926_Accessories.feature || RETURN_CODE=1

#Checkout
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_68498.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_68498_New.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_68498_PreOrder_CreditCard_Auth.feature || RETURN_CODE=1

#Payments
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_69231.feature || RETURN_CODE=1

#Promotions
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_69474.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_69474_Combo.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_69474_ItemLevel.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_69474_ShippingLevel.feature || RETURN_CODE=1


#others
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_40931.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_40935.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_40953.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_40953_CheckOtherStoreAvailability.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_40953_Guest.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_40953_HOPS_Auth.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_40953_PickupAtHomeStore.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_41273.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_41273_Dashboard.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_41273_NonPUR.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_41273_PUR.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_42420_Shop.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_42424_PreferredConsoles.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_66624.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_67322.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_68636.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_68705.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_68707.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_68804.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_69213.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_69231.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_69277.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_69277_Guest.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_69277_PreOwned_GiftCard_Guest.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_69593.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_69631.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_69659.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_69808.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_69875.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_81100.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_82323.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_82325.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_88482.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_HOPS.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_Non_PUR_login.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_PUR_Basic_login.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_PUR_PRO_login.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_SetHomeStore.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_SetHomeStore_Guest.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_SHOP.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_ViewMessages_Auth.feature || RETURN_CODE=1
calabash-android run $FIRST_ARGUMENT/Android_Dev/app/build/outputs/apk/app-release-unsigned.apk features/TC_ViewMessages_Guest.feature || RETURN_CODE=1

exit $RETURN_CODE
