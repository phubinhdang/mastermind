A Minigame: Mastermind 
Never played Mastermind ? Click this link : https://www.webgamesonline.com/mastermind/
You can play as code maker and code breaker or just see how quickly the computer can break your code.
Computers also can play against each other.
Following is how the code is structured. 

                           _____________________
                            |                   |
                            |     SETTINGS      |
                            |                   |
                            _____________________
                                      |
                                      |
                                      o

                                      U
                                      |
                        ______________|_______________
                        |                            |
                        |         MASTERMIND         |
                        |                            |
                        ______________________________
                              |                  |
                    CodeMaker |                  | CodeBreaker
                              |                  |
                              ^                  ^

           o         o                                   o          o
           |         |                                   |          |
  CodeMaker|         | CodeBreaker             CodeMaker |          | CodeBreaker
      _____|_________|_____                         _____|__________|____
      |                   |                         |                   |
      |       HUMAN       |                         |      COMPUTER     |
      |                   |                         |                   |
      _____________________                         _____________________

       generate_code()                                 generate_code()
       make_guess()                                    make_guess()
       check_guess()                                   check_guess()
       analyse_tip()                                   analyse_tip()


                            





