#####################################################################################################
#
# Title :  GooglyPlusPLus - An interactive app to analyze T20 and ODI matches
# Designed and developed by: Tinniam V Ganesh
# Date : 07 Jan 2021
# File: rankPlayers.R
# More details: https://gigadom.in/
#
#########################################################################################################
#rankPlayers <- function(input,output,type="IPL") {
#  cat("Entering rank match\n")
#  cat("Dir=====",getwd(),"\n")
  # if (type == "IPL"){
  #   cat("Dir1=====",getwd())
  #   output$Years <- renderUI({
  #     if (input$rankFuncIPL == "Rank IPL batsmen"){
  #       sliderInput("year", "Since year",min = (helper(IPLTeamNames,"./ipl/iplBattingBowlingDetails")[[1]]), max = (helper(IPLTeamNames,"./ipl/iplBattingBowlingDetails")[[2]]), value = (helper(IPLTeamNames,"./ipl/iplBattingBowlingDetails")[[1]]), step = 1)
  #     }
  #   })
  #
  #   output$MinMatches <- renderUI({
  #     if (input$rankFuncIPL == "Rank IPL batsmen"){
  #       sliderInput("minMatches", "Matches played",min = (helper(IPLTeamNames,"./ipl/iplBattingBowlingDetails")[[3]]), max = (helper(IPLTeamNames,"./ipl/iplBattingBowlingDetails")[[4]]), value = 0, step = 1)
  #     }
  #   })

  #   #cat("years ****=",input$year,"\n")
  #   output$Mode <- renderUI({
  #       if (input$rankFuncIPL == "Rank IPL batsmen"){
  #         selectInput('runsOverSR', 'Mode', runsVsSR)
  #       } else if (input$rankFuncIPL == "Rank IPL bowlers"){
  #         selectInput('wicketsOverER', 'Mode', wicketsVsER)
  #       }
  #    })
  #
  #
  # }

rankPlayers <- function(input,output, type="IPL") {
  cat("Entering rank match")

  if (type == "IPL"){
    output$Mode <- renderUI({
      if (input$rankFuncIPL == "Rank IPL batsmen"){
        selectInput('runsOverSR', 'Mode',choices=runsVsSR,selected=input$runsOverSR)
      } else if (input$rankFuncIPL == "Rank IPL bowlers"){
        selectInput('wicketsOverER', 'Mode', wicketsVsER)
      }
    })
  }

  print(input$runsOverSR)
  if(type == "IPL") {

    if(input$rankFuncIPL == "Rank IPL batsmen"){
      cat("#######=",input$years,input$runsOverSR)
      a <-rankIPLBatsmen("./ipl/iplBattingBowlingDetails",input$minMatches, input$years,input$runsOverSR)
    } else if (input$rankFuncIPL == "Rank IPL bowlers"){
      a <- rankIPLBowlers("./ipl/iplMatches","./ipl/iplBattingBowlingDetails",input$minMatches)

    }
  } else if (type ==  "T20M"){
    if(input$rankFuncT20M == "Rank T20 batsmen (Men)"){
      a <- rankT20Batsmen("./t20/t20MenMatches","./t20/t20BattingBowlingDetails",input$minMatchesT20M)
    } else if (input$rankFuncT20M == "Rank T20 bowlers (Men)"){
      a <-rankT20Bowlers("./t20/t20MenMatches","./t20/t20BattingBowlingDetails",input$minMatchesT20M)

    }
  } else if (type ==  "T20W"){
    if(input$rankFuncT20W == "Rank T20 batsmen (Women)"){
      a <- rankT20Batsmen("./t20/t20WomenMatches","./t20/t20WomenBattingBowlingDetails",input$minMatchesT20W)
    } else if (input$rankFuncT20W == "Rank T20 bowlers (Women)"){
      a <- rankT20Bowlers("./t20/t20WomenMatches","./t20/t20WomenBattingBowlingDetails",input$minMatchesT20W)

    }
  } else if (type ==  "BBL"){
    if(input$rankFuncBBL == "Rank BBL batsmen"){
      a <- rankBBLBatsmen("./bbl/bblMatches","./bbl/bblBattingBowlingDetails",input$minMatchesBBL)
    } else if (input$rankFuncBBL == "Rank BBL bowlers"){
      a <- rankBBLBowlers("./bbl/bblMatches","./bbl/bblBattingBowlingDetails",input$minMatchesBBL)

    }
  } else if (type ==  "NTB"){
    if(input$rankFuncNTB == "Rank NTB batsmen"){
      a <- rankNTBBatsmen("./ntb/ntbMatches","./ntb/ntbBattingBowlingDetails",input$minMatchesNTB)
    } else if (input$rankFuncNTB == "Rank NTB bowlers"){
      a <- rankNTBBowlers("./ntb/ntbMatches","./ntb/ntbBattingBowlingDetails",input$minMatchesNTB)

    }
  } else if (type ==  "PSL"){
    if(input$rankFuncPSL == "Rank PSL batsmen"){
      a <- rankPSLBatsmen("./psl/pslMatches","./psl/pslBattingBowlingDetails",input$minMatchesPSL)
    } else if (input$rankFuncPSL == "Rank PSL bowlers"){
      a <- rankPSLBowlers("./psl/pslMatches","./psl/pslBattingBowlingDetails",input$minMatchesPSL)
      print(a)

    }
  } else if (type ==  "WBB"){
    if(input$rankFuncWBB == "Rank WBB batsmen"){
      a <- rankWBBBatsmen("./wbb/wbbMatches","./wbb/wbbBattingBowlingDetails",input$minMatchesWBB)
    } else if (input$rankFuncWBB == "Rank WBB bowlers"){
      a <- rankWBBBowlers("./wbb/wbbMatches","./wbb/wbbBattingBowlingDetails",input$minMatchesWBB)
      print(a)

    }
  }
  a
}
