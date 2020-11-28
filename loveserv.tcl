####################################################
# Author : TALES 18-01-2003                        #
# File name: loveserv.tcl                          #
# version script : v1                              #
# Script info : This script is an loveserv.c made  #
#               to loveserv.tcl.I have made this   #
#               script for irc servers who dont    #
#               have the loveserv or eggdrop owners#
#               who want this in there bots :)     #
#               all the help is in the script      #
#               with /msg botnick help and see all #
#               the help you need.                 #
####################################################
#         if you got any questions you             #
#         can find me @ irc.chatcity.nl            #
#         http://www.cb3rob.net/~tales/            #
####################################################
#     this script is made for eggdrop 1.6.13       #
# could work on lower versions but did not test it #
#    use of this script is for your own risk!      #
####################################################
# Credits : NeoStats                               #
#           IRC Statistical Services               #
#           Copyright (c) 1999-2002                #
#           NeoStats Group Inc.                    #
#           Copyright (c) 1999-2002                #
#           Adam Rutter, Justin Hammond            #
#           http://www.neostats.net/               #
####################################################


#set btnck to the nick of your bot 
set btnck "yourbotnick"

#code starts here
bind msg - help not_help
bind msg - kiss not_kiss
bind msg - rose not_rose
bind msg - tonsil not_tonsil
bind msg - hug not_hug
bind msg - admirer not_admirer
bind msg - chocolate not_chocolate
bind msg - candy not_candy
bind msg - lovenote not_lovenote
bind msg - thankyou not_thankyou
bind msg - apology not_apology
bind msg - version not_version

proc not_help {nick uhost hand rest} {
    global botnick
    set cmd [string tolower [lindex $rest 0]]
    if {$cmd == ""} {
	putnot $nick "------------------ loveserv help ------------------"
        putnot $nick "Commands :"
        putnot $nick "  ROSE       KISS     TONSIL     HUG       ADMIRER"
        putnot $nick "  CHOCOLATE  CANDY    LOVENOTE   APOLOGY"
        putnot $nick "  THANKYOU   VERSION"
        putnot $nick "   "
        putnot $nick "  For Additional Help on each command type:"
        putnot $nick "  EXAMPLE: /msg $botnick HELP ROSE"
        putnot $nick "---------------------------------------------------"
	#putlog "$nick ask for loveserv help"
	return 0}
    if {$cmd == "rose"} {
	putnot $nick "-----rose help-----"
        putnot $nick "Send a rose to a loved one on IRC."
        putnot $nick "SYNTAX: /msg $botnick ROSE NICK"
	#putlog "$nick ask for loveserv help rose"
	return 0}
    if {$cmd == "kiss"} {
        putnot $nick "-----kiss help-----"
        putnot $nick "Send a kiss to that special someone on IRC."
        putnot $nick "SYNTAX: /msg $botnick KISS NICK"
        #putlog "$nick ask for loveserv help kiss"
        return 0}
    if {$cmd == "tonsil"} {
        putnot $nick "-----tonsil help-----"
        putnot $nick "Send a deep tonsil penitrating kiss to someone on IRC."
        putnot $nick "SYNTAX: /msg $botnick tonsil NICK"
        #putlog "$nick ask for loveserv help tonsil"
        return 0}
    if {$cmd == "hug"} {
        putnot $nick "-----hug help-----"
        putnot $nick "Send a hug to someone on IRC."
        putnot $nick "SYNTAX: /msg $botnick hug NICK"
        #putlog "$nick ask for loveserv help hug"
        return 0}
    if {$cmd == "admirer"} {
        putnot $nick "-----admirer help-----"
        putnot $nick "Tell someone on IRC they have a SECRET Admirer!"
        putnot $nick "SYNTAX: /msg $botnick admirer NICK"
        #putlog "$nick ask for loveserv help admirer"
        return 0}
    if {$cmd == "chocolate"} {
        putnot $nick "-----chocolate help-----"
        putnot $nick "Send a big yummy box of candy to someone on IRC."
        putnot $nick "SYNTAX: /msg $botnick chocalate NICK"
        #putlog "$nick ask for loveserv help chocolate"
        return 0}
    if {$cmd == "candy"} {
        putnot $nick "-----candy help-----"
        putnot $nick "Send someone a box of yummy heart shaped candies."
        putnot $nick "SYNTAX: /msg $botnick candy NICK"
        #putlog "$nick ask for loveserv help candy"
        return 0}
    if {$cmd == "thankyou"} {
        putnot $nick "-----thankyou help-----"
        putnot $nick "Send someone a thankyou note."
        putnot $nick "SYNTAX: /msg $botnick thankyou NICK here the message you want to send"
        #putlog "$nick ask for loveserv help thankyou"
        return 0}
    if {$cmd == "apology"} {
        putnot $nick "-----apology help-----"
        putnot $nick "Send an Apology to someone."
        putnot $nick "SYNTAX: /msg $botnick APOLOGY NICK here the message you want to send"
        #putlog "$nick ask for loveserv help apology"
        return 0}
    if {$cmd == "lovenote"} {
        putnot $nick "-----lovenote help-----"
        putnot $nick "Send that special someone a love note."
        putnot $nick "SYNTAX: /msg $botnick LOVENOTE NICK I love you dearly"
        #putlog "$nick ask for loveserv help lovenote"
        return 0}
    if {$cmd == "version"} {
        putnot $nick "-----version help-----"
        putnot $nick "Show $botnick current version."
        putnot $nick "SYNTAX: /msg $botnick version"
        #putlog "$nick ask for loveserv help version"
        return 0}
    }
proc putnot {nick msg} { putserv "NOTICE $nick :$msg" }

proc not_kiss {nick uhost hand rest} {
  global botnick btnck
    set cmd [string tolower [lindex $rest 0]]
    if {$cmd == $btnck} {
        putnot $nick "Surley we have better things to do with our time than make a service message itself?"
        return 0}
    if {$cmd != ""} {
        putnot $nick "You have virtually kissed $rest"
        putnot $rest "$nick has virtually kissed you!"
        return 0}
    }

proc not_rose {nick uhost hand rest} {
  global botnick btnck
    set cmd [string tolower [lindex $rest 0]]
    if {$cmd == $btnck} {
        putnot $nick "Surley we have better things to do with our time than make a service message itself?"
        return 0}
    if {$cmd != ""} {
        putnot $nick "Your rose has been sent to $rest"
        putnot $rest "$nick has sent you this beautiful rose! 3--<--<--<4@"
        return 0}
    } 

proc not_tonsil {nick uhost hand rest} {
  global botnick btnck
    set cmd [string tolower [lindex $rest 0]]
    if {$cmd == $btnck} {
        putnot $nick "Surley we have better things to do with our time than make a service message itself?"
        return 0}
    if {$cmd != ""} {
        putnot $nick "You have virtually tonsilly kissed $rest"
        putnot $rest "$nick would like to send a SLoW..LoNG..DeeP..PeNeTRaTiNG..ToNSiL-TiCKLiNG.. HaiR STRaiGHTeNiNG..Toe-CuRLiNG..NeRVe-JaNGLiNG..LiFe-aLTeRiNG.. FaNTaSY-CauSiNG..i JuST SaW GoD!..GoSH, DiD MY CLoTHeS FaLL oFF?.. YeS, i'M GLaD i CaMe oN iRC..KiSS oN Da LiPS!!!"
        return 0}
    }

proc not_hug {nick uhost hand rest} {
  global botnick btnck
    set cmd [string tolower [lindex $rest 0]]
    if {$cmd == $btnck} {
        putnot $nick "Surley we have better things to do with our time than make a service message itself?"
        return 0}
    if {$cmd != ""} {
        putnot $nick "$rest has received your hug! :)"
        putnot $rest "$nick has sent you a *BIG WARM HUG*!"
        return 0}
    }

proc not_admirer {nick uhost hand rest} {
  global botnick btnck
    set cmd [string tolower [lindex $rest 0]]
    if {$cmd == $btnck} {
        putnot $nick "Surley we have better things to do with our time than make a service message itself?"
        return 0}
    if {$cmd != ""} {
        putnot $nick "Anonymous admire sent to $rest"
        putnot $rest "You have a secret admirer! ;)"
        return 0}
    }

proc not_chocolate {nick uhost hand rest} {
  global botnick btnck
    set cmd [string tolower [lindex $rest 0]]
    if {$cmd == $btnck} {
        putnot $nick "Surley we have better things to do with our time than make a service message itself?"
        return 0}
    if {$cmd != ""} {
        putnot $nick "A box of cholocates has been sent to $rest"
        putnot $rest "$nick would like you to have this YUMMY box of chocolates!"
        return 0}
    }

#please leaf this for credit for my work making loveserv.c to loveserv.tcl tnx
proc not_version {nick uhost hand rest} {
  global botnick
        putnot $nick "My version of loveserv is v1 made by TALES on 18-01-2003"
        return 0
    }

proc not_candy {nick uhost hand rest} {
  global botnick btnck
    set cmd [string tolower [lindex $rest 0]]
    if {$cmd == $btnck} {
        putnot $nick "Surley we have better things to do with our time than make a service message itself?"
        return 0}
    if {$cmd != ""} {
        putnot $nick "A bag of yummy heart shaped candies has been sent to $rest"
        putnot $rest "$nick would like you to have this big YUMMY bag of heart shaped candies!"
        return 0}
    }

proc not_lovenote {nick uhost hand text} {
 global botnick btnck
 set rest [lindex $text 0]
 set msg [lrange $text 1 end]
   if {$rest == $btnck} {
      putnot $nick "Surley we have better things to do with our time than make a service message itself?"
      return 0}
   if {$msg == ""} {
      puthelp "NOTICE $nick :You need a message to send."
      return 0}
     putnot $nick "Your lovenote to $rest has been sent! :)"
     putnot $rest "$nick has sent you a LoveNote which reads:"
     putnot $rest "$msg"
     return 0
   }

proc not_thankyou {nick uhost hand text} {
 global botnick btnck
 set rest [lindex $text 0]
 set msg [lrange $text 1 end]
   if {$rest == $btnck} {
      putnot $nick "Surley we have better things to do with our time than make a service message itself?"
      return 0}
   if {$msg == ""} {
      puthelp "NOTICE $nick :You need a message to send."
      return 0}
     putnot $nick "Your Thank You has been sent to $rest"
     putnot $rest "$nick wishes to thank you for:"
     putnot $rest "$msg"
     return 0
   }

proc not_apology {nick uhost hand text} {
 global botnick btnck
 set rest [lindex $text 0]
 set msg [lrange $text 1 end]
   if {$rest == $btnck} {
      putnot $nick "Surley we have better things to do with our time than make a service message itself?"
      return 0}
   if {$msg == ""} {
      puthelp "NOTICE $nick :You need a message to send."
      return 0}
     putnot $nick "Your apology has been sent to $rest"
     putnot $rest "$nick is sorry, and would like to apologise for:"
     putnot $rest "$msg"
     return 0
   }
 
putlog "loveserv script v1 By TALES is loaded ..... 18-01-2003"