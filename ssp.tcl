####################################################
# Author : TALES 24-08-2003                        #
# File name: ssp.tcl                               #
# version script : v1                              #
# Script info : This is a little game for channel  #
#               hope you like the game.            #
#               cmd like: !choose scissor          #
#                         !choose stone            #
#                         !choose paper            #
####################################################
#         if you got any questions you             #
#         can find me @ irc.chatcity.nl            #
#         http://www.cb3rob.net/~tales/            #
####################################################
#     this script is made for eggdrop 1.6.13       #
#      but should work on al 1.6.* versions        #
#    use of this script is for your own risk!      #
####################################################
# Credits : Fr33man_, Ace^                         #
####################################################

bind pub - !choose msg_ssp

set ssp_list {
 "scissor"
 "stone"
 "paper"
}

proc msg_ssp {nick uhost hand chan rest} {
  global botnick ssp_list
  set ssp [lindex $ssp_list [rand [llength $ssp_list]]]
  set cmd [string tolower [lindex $rest 0]]
  if { ($cmd == $ssp) } {
     putserv "PRIVMSG $chan :You have \0037$cmd\003 and i have \0037$ssp\003 game \00312-draw-\003" 
     return 0
     }
  if {$cmd == "stone"} {
    if {$ssp == "paper"} {
       putserv "PRIVMSG $chan :You have \0037Stone\003 and i have \0037Paper\003 you \0034-lose-\003" 
       return 0
       }
    if {$ssp == "scissor"} {
       putserv "PRIVMSG $chan :You have \0037Stone\003 and i have \0037Scissor\003 you \0033-won-\003" 
       return 0
       }
      }
  if {$cmd == "paper"} {
    if {$ssp == "stone"} { 
       putserv "PRIVMSG $chan :You have \0037Paper\003 and i have \0037Stone\003 you \0033-won-\003" 
       return 0
       }
    if {$ssp == "scissor"} { 
       putserv "PRIVMSG $chan :You have \0037Paper\003 and i have \0037Scissor\003 you \0034-lose-\003" 
       return 0
       }
      }
  if {$cmd == "scissor"} {
    if {$ssp == "stone"} { 
       putserv "PRIVMSG $chan :You have \0037Scissor\003 and i have \0037Stone\003 you \0034-lose-\003" 
       return 0
       }
    if {$ssp == "paper"} { 
       putserv "PRIVMSG $chan :You have \0037Scissor\003 and i have \0037Paper\003 you have \0033-won-\003" 
       return 0
       }
      }
}

putlog "ssp.tcl v1 made by TALES loaded succesfully."