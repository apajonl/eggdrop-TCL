####################################################
# Author        : TALES                            #
# start script  : 29-10-2003                       #
# release script: 06-11-2003                       #
# File name     : ctc.tcl                          #
# version       : v1                               #
# Script info   : This is something new i hope     #
#                 its a math game.The bot has a    #
#                 6 digital random code. numbers   #
#                 from 0 to 6.The job is to crack  #
#                 the code with the question       #
#                 answer the bot gives in channel. #
#                 settings to set:                 #
#                 tls_lang : for language          #
#                 tls_chan : channel to play       #
#                 cmd like: !ctc   <-to start game #
#                           !code <code>           #
#                           !hint                  #
#                           !score                 #
#                           !top   <-for top 3     #
#                 enjoy all !!                     #
####################################################
#         if you got any questions you             #
#         can find me @ irc.chatcity.nl            #
#         http://www.cb3rob.net/~tales/            #
####################################################
#     this script is made for eggdrop 1.6.13       #
#      but should work on al 1.6.* versions        #
#    use of this script is for your own risk!      #
####################################################
# credits for testing and tips for the game:       #
# Ten-Sharp, bb, Fr33man, Hades-302, BoBjuh, noknok#
# Tsjetter                                         #
# credits for:                                     #
# DrN for letting me use the score part of         #
# Hangman v1.00 by David Proper (Dr. Nibble [DrN]) #
####################################################

# Language settings 0 for dutch 1 for english 2 for deutsch
set tls_lang "0"

# set this to your channel you want to play the game only 1 channel 
set tls_chan "#game"

# Set this to the path/filename of the high scores file
set tls_sf(scorefile) "/home/dirofscript/ctcscores.txt"

# [seconds] Set this to how long to keep old hangman score records
#2592000 = 1 day       77760000 = 30 days
set tls_ctc(expire) 77760000

# cmd's for the game
bind pub - !ctc tls:ctc
bind pub - !code tls:code
bind pub - !hint tls:hint
bind pub - !score tls:score
bind pub - !top tls:top


##################################################

set tls_stop "25"
set tls_game "on"
set tls_hint "0"
set tls_stop_game "0"

proc tls:ctc {nick uhost hand chan text} {
  global tls_dig tls_number tls_answers tls_rand tls_game tls_chan tls_even tls_oneven tls_done
  global tls_dig1 tls_dig2 tls_dig3 tls_dig4 tls_dig5 tls_dig6 tls_stop_game
  global tls_frase1 tls_frase2 tls_frase3
  if {$tls_chan != $chan} { return }
  if {$tls_game == "off"} {
    putserv "NOTICE $nick :$tls_frase1 $nick."
    return 1
   }
  set tls_dig1 [rand 7]
  set tls_dig2 [rand 7]
  set tls_dig3 [rand 7]
  set tls_dig4 [rand 7]
  set tls_dig5 [rand 7]
  set tls_dig6 [rand 7]
  set tls_number $tls_dig1$tls_dig2$tls_dig3$tls_dig4$tls_dig5$tls_dig6
  putserv "PRIVMSG $chan :$tls_frase2"
  putserv "PRIVMSG $chan :$tls_frase3"
  putlog "rand number: $tls_number"
  set tls_even "0"
  set tls_oneven "0"
  set tls_stop_game "0"
  set tls_done "0"
  set tls_game "off"
  utimer 5 tls:answer 
  return 1
}

proc tls:answer {} {
 global tls_dig tls_dig1 tls_dig2 tls_dig3 tls_dig4 tls_dig5 tls_dig6 tls_quest tls_count tls_count2 tls_even tls_oneven tls_done
 global tls_answer tls_rand tls_rand2 tls_game tls_hint tls_stop tls_stop_game tls_number tls_lang tls_chan
 global tls_frase4 tls_frase5_1 tls_frase5_2 tls_frase6_1 tls_frase6_2 tls_frase6_3 tls_frase7_1 tls_frase7_2
 global tls_frase8_1 tls_frase8_2 tls_frase8_3 tls_frase8_4
 #set tls_answers 6
 set tls_answers [rand 8]
 set tls_rand [rand 7]
 if {$tls_even == "1" && $tls_answers == "1"} { set tls_answers "3" }
 if {$tls_oneven == "1" && $tls_answers == "2"} { set tls_answers "4" }
 if {$tls_done == "1" && $tls_answers == "7"} { set tls_answers "5" }
 if {$tls_stop_game == $tls_stop} {
  set tls_game "on"
  set tls_hint "0"
  set tls_stop_game "0"
  putserv "PRIVMSG $tls_chan :$tls_frase7_1 $tls_stop $tls_frase7_2 \00304$tls_number\003."
  foreach j [utimers] {
        if {[lindex $j 1] == "tls:answer"} { killutimer [lindex $j 2] }
      }
  return 1
 }
 incr tls_stop_game
 if {$tls_game == "off"} { utimer 20 tls:answer }
  if {$tls_hint == "10"} {  
   putserv "PRIVMSG $tls_chan :$tls_frase4"
   incr tls_hint    
   return 1
  }
  if {$tls_answers == "0"} {
   if {$tls_lang == "0"} { 
    if {$tls_dig1 == $tls_rand} { set tls_quest een
    } elseif {$tls_dig1 == $tls_rand} { set tls_quest een
    } elseif {$tls_dig2 == $tls_rand} { set tls_quest een
    } elseif {$tls_dig3 == $tls_rand} { set tls_quest een
    } elseif {$tls_dig4 == $tls_rand} { set tls_quest een
    } elseif {$tls_dig5 == $tls_rand} { set tls_quest een
    } elseif {$tls_dig6 == $tls_rand} { set tls_quest een
    } else {
	set tls_quest geen  
    }
    }
   if {$tls_lang == "1"} {
    if {$tls_dig1 == $tls_rand} { set tls_quest a
    } elseif {$tls_dig1 == $tls_rand} { set tls_quest a
    } elseif {$tls_dig2 == $tls_rand} { set tls_quest a
    } elseif {$tls_dig3 == $tls_rand} { set tls_quest a
    } elseif {$tls_dig4 == $tls_rand} { set tls_quest a
    } elseif {$tls_dig5 == $tls_rand} { set tls_quest a
    } elseif {$tls_dig6 == $tls_rand} { set tls_quest a
    } else {
	set tls_quest no  
    }
    }
   if {$tls_lang == "2"} {
    if {$tls_dig1 == $tls_rand} { set tls_quest a
    } elseif {$tls_dig1 == $tls_rand} { set tls_quest ""
    } elseif {$tls_dig2 == $tls_rand} { set tls_quest ""
    } elseif {$tls_dig3 == $tls_rand} { set tls_quest ""
    } elseif {$tls_dig4 == $tls_rand} { set tls_quest ""
    } elseif {$tls_dig5 == $tls_rand} { set tls_quest ""
    } elseif {$tls_dig6 == $tls_rand} { set tls_quest ""
    } else {
	set tls_quest kein  
    }
    }
    putserv "PRIVMSG $tls_chan :$tls_frase5_1 $tls_quest \00304$tls_rand\003 $tls_frase5_2"
    incr tls_hint    
    return 1
   } 
  if {$tls_answers == "1"} {
   set tls_count 0
   if {$tls_dig1 == "2" || $tls_dig1 == "4" || $tls_dig1 == "6"} { incr tls_count }
   if {$tls_dig2 == "2" || $tls_dig2 == "4" || $tls_dig2 == "6"} { incr tls_count }
   if {$tls_dig3 == "2" || $tls_dig3 == "4" || $tls_dig3 == "6"} { incr tls_count }
   if {$tls_dig4 == "2" || $tls_dig4 == "4" || $tls_dig4 == "6"} { incr tls_count }
   if {$tls_dig5 == "2" || $tls_dig5 == "4" || $tls_dig5 == "6"} { incr tls_count }
   if {$tls_dig6 == "2" || $tls_dig6 == "4" || $tls_dig6 == "6"} { incr tls_count }
   putserv "PRIVMSG $tls_chan :$tls_frase6_1 \00304$tls_count\003 $tls_frase6_2"
   incr tls_even
   incr tls_hint
   return 1
   }
  if {$tls_answers == "2"} {
   set tls_count 0
   if {$tls_dig1 == "1" || $tls_dig1 == "3" || $tls_dig1 == "5"} { incr tls_count }
   if {$tls_dig2 == "1" || $tls_dig2 == "3" || $tls_dig2 == "5"} { incr tls_count }
   if {$tls_dig3 == "1" || $tls_dig3 == "3" || $tls_dig3 == "5"} { incr tls_count }
   if {$tls_dig4 == "1" || $tls_dig4 == "3" || $tls_dig4 == "5"} { incr tls_count }
   if {$tls_dig5 == "1" || $tls_dig5 == "3" || $tls_dig5 == "5"} { incr tls_count }
   if {$tls_dig6 == "1" || $tls_dig6 == "3" || $tls_dig6 == "5"} { incr tls_count }
   putserv "PRIVMSG $tls_chan :$tls_frase6_1 \00304$tls_count\003 $tls_frase6_3"
   incr tls_oneven
   incr tls_hint
   return 1
   }
  if {$tls_answers == "3"} {
   set tls_rand [expr [rand 6] +1]
   set tls_rand2 [expr [rand 6] +1]
   if {$tls_rand == $tls_rand2} {
    if {$tls_rand == 6} { set tls_rand2 [expr $tls_rand -1]
     } else { set tls_rand2 [expr $tls_rand2 +1]
    }
   }
   set tls_count tls_dig$tls_rand
   set tls_count2 tls_dig$tls_rand2
   set tls_answer [expr $$tls_count + $$tls_count2]
   putserv "PRIVMSG $tls_chan :$tls_frase8_1 \00304$tls_rand\003 $tls_frase8_2 \00304$tls_rand2\003 $tls_frase8_3 \00304$tls_answer\003."
   incr tls_hint
   return 1
   }
  if {$tls_answers == "4"} {
   set tls_rand [expr [rand 6] +1]
   set tls_rand2 [expr [rand 6] +1]
   if {$tls_rand == $tls_rand2} {
    if {$tls_rand == 6} { set tls_rand2 [expr $tls_rand -1]
     } else { set tls_rand2 [expr $tls_rand2 +1]
    }
   }
   set tls_count tls_dig$tls_rand
   set tls_count2 tls_dig$tls_rand2
   set tls_answer [expr $$tls_count * $$tls_count2]
   putserv "PRIVMSG $tls_chan :$tls_frase8_1 \00304$tls_rand\003 $tls_frase8_2 \00304$tls_rand2\003 $tls_frase8_4 \00304$tls_answer\003."
   incr tls_hint
   return 1
  }
  if {$tls_answers == "5"} {
   set tls_rand [expr [rand 6] +1]
   if {$tls_rand == 1 || $tls_rand == 2} { set tls_rand [expr $tls_rand +2] }
   set tls_count tls_dig$tls_rand
   set tls_answer [expr $tls_dig1 + $tls_dig2 + $$tls_count]
   putserv "PRIVMSG $tls_chan :$tls_frase8_1 \003041\003 $tls_frase8_2 \003042\003 $tls_frase8_2 \00304$tls_rand\003 $tls_frase8_3 \00304$tls_answer\003."
   incr tls_hint
   return 1
  }
  if {$tls_answers == "6"} {
   set tls_rand [expr [rand 6] +1]
   if {$tls_rand == 2 || $tls_rand == 3} { set tls_rand [expr $tls_rand +2] }
   if {$tls_rand == 1} { set tls_rand 4 }
   set tls_count tls_dig$tls_rand
   set tls_answer [expr $tls_dig2 + $tls_dig3 + $$tls_count]
   putserv "PRIVMSG $tls_chan :$tls_frase8_1 \003042\003 $tls_frase8_2 \003043\003 $tls_frase8_2 \00304$tls_rand\003 $tls_frase8_3 \00304$tls_answer\003."
   incr tls_hint
   return 1
  }
  if {$tls_answers == "7"} {
   set tls_answer [expr $tls_dig4 + $tls_dig5 + $tls_dig6]
   putserv "PRIVMSG $tls_chan :$tls_frase8_1 \003044\003 $tls_frase8_2 \003045\003 $tls_frase8_2 \003046\003 $tls_frase8_3 \00304$tls_answer\003."
   incr tls_hint
   incr tls_done
   return 1
  }    
}

proc tls:code {nick uhost hand chan text} {
  global tls_code tls_number tls_game tls_hint tls_chan tls_ctc tls_ctcs
  global tls_frase11_1 tls_frase11_2 tls_frase12_1 tls_frase12_2
  if {$tls_game == "on"} { return }
  if {$tls_chan != $chan} { return }
  if {[info exists tls_ctcs($nick)]} {
   set score [lindex $tls_ctcs($nick) 0]
   set hints [lindex $tls_ctcs($nick) 1]
   set wrong [lindex $tls_ctcs($nick) 2]
                                    } else {
                                            tls:update $nick 0 0 0
                                            lappend tls_ctc(nicks) $nick
   set score 0;set hints 0; set wrong 0
                                           }
  set tls_code [lindex $text 0 end]
  if {$tls_code == $tls_number} {
  set tls_game "on"
  set tls_hint "0"
  incr score 1
  tls:update $nick $score $hints $wrong
  putserv "PRIVMSG $tls_chan :$tls_frase11_1 $nick $tls_frase11_2 \00304$tls_number\003."
  foreach j [utimers] {
        if {[lindex $j 1] == "tls:answer"} { killutimer [lindex $j 2] }
      }
  tls:save
  return 1
  } else {
   incr wrong 1
   tls:update $nick $score $hints $wrong
   putserv "PRIVMSG $tls_chan :$tls_frase12_1 $nick $tls_frase12_2"
   tls:save
   return 1
  }
}

proc tls:update {nick score hints wrong} {
global tls_ctcs
 set tls_ctcs($nick) "$score $hints $wrong [unixtime]"
}

proc tls:save {} {
global tls_ctc tls_ctcs tls_sf
 set tot [llength $tls_ctc(nicks)]
 set out [open $tls_sf(scorefile) w]

 puts $out $tot
 for {set l 0} {$l < $tot} {incr l} {
  puts $out "[lindex $tls_ctc(nicks) $l] $tls_ctcs([lindex $tls_ctc(nicks) $l])"
  }
 close $out
}
   
proc tls:hint {nick uhost hand chan text} {
  global tls_hint tls_number2 tls_game tls_rand tls_chan tls_ctc tls_ctcs
  global tls_dig1 tls_dig2 tls_dig3 tls_dig4 tls_dig5 tls_dig6
  global tls_frase8_1 tls_frase9 tls_frase10
  if {$tls_game == "on"} { return }
  if {$tls_chan != $chan} { return }
  if {[info exists tls_ctcs($nick)]} {
   set score [lindex $tls_ctcs($nick) 0]
   set hints [lindex $tls_ctcs($nick) 1]
   set wrong [lindex $tls_ctcs($nick) 2]
                                    } else {
                                            tls:update $nick 0 0 0
                                            lappend tls_ctc(nicks) $nick
   set score 0;set hints 0; set wrong 0
                                           }
  set tls_rand [expr [rand 6] +1]
  set tls_number2 tls_dig$tls_rand
  set tls_number2 [expr $$tls_number2]
  if {$tls_game == "off" && $tls_hint >= "10"} {
  set tls_hint "0"
  incr hints 1
  tls:update $nick $score $hints $wrong
  putserv "PRIVMSG $tls_chan :$tls_frase8_1 \00304$tls_rand\003 $tls_frase9 \00304$tls_number2\003."
  tls:save
  return 1
  } else {
   putserv "PRIVMSG $tls_chan :$nick $tls_frase10"
   return 1
  }
}  

proc tls:load {} {
global tls_ctc tls_ctcs tls_sf
  set tls_ctc(nicks) ""
  if {[info exists tls_ctcs]} {unset tls_ctcs}
  if {[file exists $tls_sf(scorefile)]} {
                                 set in [open $tls_sf(scorefile) r]
                                 set tot [gets $in]
 for {set l 0} {$l < $tot} {incr l} {
   set line [gets $in]
   set nick [lindex $line 0]
   set lastused [lindex $line 4]
   if {$lastused == ""} {set lastused [unixtime]}
   if {[expr [unixtime] - $lastused] < $tls_ctc(expire)} {
             set score [lindex $line 1]
             set hints [lindex $line 2]
             set wrong [lindex $line 3]
             lappend tls_ctc(nicks) $nick
             tls:update $nick $score $hints $wrong
             }
   }
  }
}

proc tls:score {nick uhost hand chan rest} {
global tls_ctc tls_ctcs tls_chan tls_game
global tls_frase13 tls_frase14 tls_frase15
  if {$tls_chan != $chan} { return }
   set n $nick
   set score [lindex $tls_ctcs($n) 0]
   set hints [lindex $tls_ctcs($n) 1]
   set wrong [lindex $tls_ctcs($n) 2]
  #putserv "PRIVMSG $tls_chan :$n $tls_frase13: $score $tls_frase14: $hints $tls_frase15: $wrong"
  putserv "PRIVMSG $tls_chan :$n $tls_frase13: $score $tls_frase15: $wrong"  
}

proc tls:top {nick uhost hand chan rest} {
global tls_ctc tls_ctcs tls_chan tls_game 
global tls_frase16
 if {$tls_chan != $chan} { return }
 set sorted [tls:sort]
 set tot 3
 putserv "PRIVMSG $tls_chan :\002    -=$tls_frase16=-\002"
 for {set l 0} {$l < $tot} {incr l} {
  set place $l
  incr place
  set n [lindex $tls_ctc(nicks) $l]
  set score [lindex $tls_ctcs($n) 0]
  putserv "PRIVMSG $tls_chan :\002$place.\002 $n $score"
  }
}

proc tls:sort {} {
 global tls_ctc tls_ctcs
 set sortby 0
 
 set l 0
 set tot [llength $tls_ctc(nicks)]
 for {set l 1} {$l < [expr $tot +1]} {incr l} {
  set nicks($l) [lindex $tls_ctc(nicks) [expr $l -1]]
  }
 set l1 0
 set t [llength $tls_ctc(nicks)]
 for {set l1 1} {$l1 < $tot} {incr l1} {
  for {set l2 $l1} {$l2 < [expr $tot +1]} {incr l2} {
   set data1 [lindex $tls_ctcs($nicks($l1)) $sortby]
   set data2 [lindex $tls_ctcs($nicks($l2)) $sortby]
   if {$data1 < $data2} {set temp $nicks($l1)
                         set nicks($l1) $nicks($l2)
                         set nicks($l2) $temp
                        }
   }
  } 
 set tls_ctc(nicks) ""
 for {set l 1} {$l < [expr $tot +1]} {incr l} {
  lappend tls_ctc(nicks) $nicks($l)
 }
 return
}

tls:load
##################################
# language settings              #
##################################

if {$tls_lang == "0"} {
  set tls_frase1 "Het spel is al gestart"
  set tls_frase2 "Ok het spel begint ik heb een 6 cijferig nummer op geslagen. ******"
  set tls_frase3 "Het 6 cijferig nummer bestaat uit de getallen 0 tot 6. Veel succes!"
  set tls_frase4 "Het is nu mogelijk om een hint aan te vragen door !hint."
  set tls_frase5_1 "Er komt"
  set tls_frase5_2 "in de kombinatie voor."
  set tls_frase6_1 "Er zijn"
  set tls_frase6_2 "EVEN cijfers in de kombinatie."
  set tls_frase6_3 "ONEVEN cijfers in de kombinatie."
  set tls_frase7_1 "Niemand heeft de code gekraakt met"
  set tls_frase7_2 "vraag en antwoord het was:"
  set tls_frase8_1 "Getal"
  set tls_frase8_2 "en getal"
  set tls_frase8_3 "bij elkaar is"
  set tls_frase8_4 "vermenigvuldigd is"
  set tls_frase9 "is een:"
  set tls_frase10 "het is nog geen tijd voor een hint of er is al een hint gegeven."
  set tls_frase11_1 "Gefeliciteerd"
  set tls_frase11_2 "heeft de code gekraakt het was idd"
  set tls_frase12_1 "Fout"
  set tls_frase12_2 "dat is niet de code."
  set tls_frase13 "Score"
  set tls_frase14 "Hints"
  set tls_frase15 "Fout"
  set tls_frase16 "De top 3"  
}

if {$tls_lang == "1"} {
  set tls_frase1 "The game is already started!!"
  set tls_frase2 "Ok the game begins.I have a 6 digital number in my system. ******"
  set tls_frase3 "The 6 digital number exist of the numbers 0 to 6. Good luck !!"
  set tls_frase4 "Its now possible to ask for a hint with cmd: !hint"
  set tls_frase5_1 "There is"
  set tls_frase5_2 "in the combination."
  set tls_frase6_1 "There are"
  set tls_frase6_2 "EVEN numbered in the combination."
  set tls_frase6_3 "ODD numbered in the combination."
  set tls_frase7_1 "Nobody has cracked the code with"
  set tls_frase7_2 "questions and answers the code was:"
  set tls_frase8_1 "Number"
  set tls_frase8_2 "and number"
  set tls_frase8_3 "the addition of these numbers is"
  set tls_frase8_4 "the multiply of these numbers is"
  set tls_frase9 "is a:"
  set tls_frase10 "there is no time for a hint yet or i have gave already a hint."
  set tls_frase11_1 "Congratulations"
  set tls_frase11_2 "has cracked the code.The code was:"
  set tls_frase12_1 "Wrong"
  set tls_frase12_2 "that is not the code."
  set tls_frase13 "Score"
  set tls_frase14 "Hints"
  set tls_frase15 "Wrong"
  set tls_frase16 "The top 3"  
}

if {$tls_lang == "2"} {
  set tls_frase1 "Das Spiel wird bereits begonnen !!"
  set tls_frase2 "Heißen Sie das Spiel begins.Ich haben eine digitale 6 in meinem System gut. ******"
  set tls_frase3 "Die digitale 6 bestehen von den Nr. 0 bis Nr. 6. Viel Glueck  !!"
  set tls_frase4 "Sein jetzt mögliches, um einen Tip mit Befehl zu bitten : !hint"
  set tls_frase5_1 "Es gibt"
  set tls_frase5_2 "in der Kombination."
  set tls_frase6_1 "Es gibt"
  set tls_frase6_2 "sogar genumeriert in der Kombination."
  set tls_frase6_3 "UNGERADES genumeriert in der Kombination."
  set tls_frase7_1 "Niemand hat den Code mit"
  set tls_frase7_2 "Fragen beantwortet geknackt und den Code war:"
  set tls_frase8_1 "Zahl"
  set tls_frase8_2 "und Zahl"
  set tls_frase8_3 "die Hinzufügung dieser Zahlen ist"
  set tls_frase8_4 "multiplizieren dieser Zahlen ist"
  set tls_frase9 "ist:"
  set tls_frase10 "Dort ist keine Zeit für einen Tip, dennoch oder ich habe gab bereits einen Tip."
  set tls_frase11_1 "Glückwünsche"
  set tls_frase11_2 "hat den code.The Code waren geknackt:"
  set tls_frase12_1 "Schaden Sie"
  set tls_frase12_2 "das nicht der Code ist."
  set tls_frase13 "Kerbe"
  set tls_frase14 "Tip"
  set tls_frase15 "Unrecht"
  set tls_frase16 "Die oberen 3"  
}    

putlog "Crack the Code script v1 By TALES is loaded .....release 6-11-2003" 