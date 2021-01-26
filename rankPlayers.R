#####################################################################################################
#
# Title :  GooglyPlusPLus - An interactive app to analyze T20 and ODI matches
# Designed and developed by: Tinniam V Ganesh
# Date : 07 Jan 2021
# File: rankPlayers.R
# More details: https://gigadom.in/
#
#########################################################################################################


rankPlayers <- function(input,output,type="IPL",player="batsmen") {
  cat("Entering rank Players\n")

  if (type == "IPL"){
    output$Mode <- renderUI({
        selectInput('runsOverSR', 'Mode',choices=runsVsSR,selected=input$runsOverSR)
    })

    output$Mode1 <- renderUI({
      selectInput('wicketsOverER', 'Mode1',choices=wicketsVsER,selected=input$wicketsOverER)
    })
  } else if (type == "T20M"){
    print("T20M")
      output$ModeT20M <- renderUI({
        selectInput('runsOverSRT20M', 'ModeT20M',choices=runsVsSR,selected=input$runsOverSRT20M)
      })

      output$Mode1T20M <- renderUI({
        selectInput('wicketsOverERT20M', 'Mode1T20M',choices=wicketsVsER,selected=input$wicketsOverERT20M)
      })

  }

  cat("runs vs SR T20=",input$runsOverSRT20M)

  if(type == "IPL"){
    if(player=="batsmen"){
      cat("year=",input$yearSelected," minMatches=",input$minMatches, "\n")
      a <-rankIPLBatsmen("./ipl/iplBattingBowlingDetails",input$minMatches, input$yearSelected,input$runsOverSR)
    } else if (player =="bowlers"){
      cat("year1=",input$yearSelected1," minMatches1=",input$minMatches1, "\n")
      a <- rankIPLBowlers("./ipl/iplBattingBowlingDetails",input$minMatches1, input$yearSelected1,input$wicketsOverER)

    }
  } else if (type ==  "T20M"){
    if(player=="batsmen"){
      cat("runs vs SR T20=",input$runsOverSRT20M,"\n")
      a <- rankT20Batsmen(T20MTeamNames,"./t20/t20BattingBowlingDetails",input$minMatchesT20M,input$yearSelectedT20M,input$runsOverSRT20M)
    } else if (player =="bowlers"){
      a <-rankT20Bowlers(T20MTeamNames,"./t20/t20BattingBowlingDetails",input$minMatches1T20M, input$yearSelected1T20M,input$wicketsOverERT20M)

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
