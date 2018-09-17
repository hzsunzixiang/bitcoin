set logging file sign_msg.txt 
set logging on
set print pretty
set print elements 0


break CRPCTable::execute                                                                                    
break signmessagewithprivkey 
