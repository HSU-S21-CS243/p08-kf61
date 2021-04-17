@256
D=A
@SP
M=D
@:Sys.init.0			//BEGIN push return-address
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL			//BEGIN push LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG			//BEGIN push ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS			//BEGIN push THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT			//BEGIN push THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP			//BEGIN ARG = SP - n - 5
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
@SP			//BEGIN LCL = SP
D=M
@LCL
M=D
@:Sys.init			//BEGIN goto f
0;JMP 
(:Sys.init.0)
(:Sys.init)			//BEGIN FUNCTION COMMAND
@4000		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
@THIS		//begin POP POINTER command
D=A
@0
D=D+A
@R13
M=D
@SP
A=M
D=M
@R13
A=M
M=D		//end POP POINTER command
@5000		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
@THIS		//begin POP POINTER command
D=A
@1
D=D+A
@R13
M=D
@SP
A=M
D=M
@R13
A=M
M=D		//end POP POINTER command
@:Sys.main.1			//BEGIN push return-address
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL			//BEGIN push LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG			//BEGIN push ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS			//BEGIN push THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT			//BEGIN push THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP			//BEGIN ARG = SP - n - 5
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
@SP			//BEGIN LCL = SP
D=M
@LCL
M=D
@:Sys.main			//BEGIN goto f
0;JMP 
(:Sys.main.1)
@SP
M=M-1
@R5		//begin POP TEMP command
D=A
@1
D=D+A
@R13
M=D
@SP
A=M
D=M
@R13
A=M
M=D		//end POP TEMP command
(:LOOP)
@:LOOP			//begin GOTO command
0;JMP			//end GOTO command
(:Sys.main)			//BEGIN FUNCTION COMMAND
@SP
A=M
M=0
@SP
M=M+1
@SP
A=M
M=0
@SP
M=M+1
@SP
A=M
M=0
@SP
M=M+1
@SP
A=M
M=0
@SP
M=M+1
@SP
A=M
M=0
@SP
M=M+1
@4001		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
@THIS		//begin POP POINTER command
D=A
@0
D=D+A
@R13
M=D
@SP
A=M
D=M
@R13
A=M
M=D		//end POP POINTER command
@5001		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
@THIS		//begin POP POINTER command
D=A
@1
D=D+A
@R13
M=D
@SP
A=M
D=M
@R13
A=M
M=D		//end POP POINTER command
@200		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
@LCL		//begin POP LCL command
D=M
@1
D=D+A
@R13
M=D
@SP
A=M
D=M
@R13
A=M
M=D		//end POP LCL command
@40		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
@LCL		//begin POP LCL command
D=M
@2
D=D+A
@R13
M=D
@SP
A=M
D=M
@R13
A=M
M=D		//end POP LCL command
@6		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
@LCL		//begin POP LCL command
D=M
@3
D=D+A
@R13
M=D
@SP
A=M
D=M
@R13
A=M
M=D		//end POP LCL command
@123		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@:Sys.add12.2			//BEGIN push return-address
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL			//BEGIN push LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG			//BEGIN push ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS			//BEGIN push THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT			//BEGIN push THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP			//BEGIN ARG = SP - n - 5
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP			//BEGIN LCL = SP
D=M
@LCL
M=D
@:Sys.add12			//BEGIN goto f
0;JMP 
(:Sys.add12.2)
@SP
M=M-1
@R5		//begin POP TEMP command
D=A
@0
D=D+A
@R13
M=D
@SP
A=M
D=M
@R13
A=M
M=D		//end POP TEMP command
@LCL		 // BEGIN PUSH LOCAL
D=M
@0
A=D+A
D=M		 // END PUSH LOCAL
@SP
A=M
M=D
@SP
M=M+1
@LCL		 // BEGIN PUSH LOCAL
D=M
@1
A=D+A
D=M		 // END PUSH LOCAL
@SP
A=M
M=D
@SP
M=M+1
@LCL		 // BEGIN PUSH LOCAL
D=M
@2
A=D+A
D=M		 // END PUSH LOCAL
@SP
A=M
M=D
@SP
M=M+1
@LCL		 // BEGIN PUSH LOCAL
D=M
@3
A=D+A
D=M		 // END PUSH LOCAL
@SP
A=M
M=D
@SP
M=M+1
@LCL		 // BEGIN PUSH LOCAL
D=M
@4
A=D+A
D=M		 // END PUSH LOCAL
@SP
A=M
M=D
@SP
M=M+1
@SP			//begin ADD command
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D+M
@SP
A=M
M=D
@SP
M=M+1		//end ADD command
@SP			//begin ADD command
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D+M
@SP
A=M
M=D
@SP
M=M+1		//end ADD command
@SP			//begin ADD command
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D+M
@SP
A=M
M=D
@SP
M=M+1		//end ADD command
@SP			//begin ADD command
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D+M
@SP
A=M
M=D
@SP
M=M+1		//end ADD command
@LCL    //begin RETURN command FRAME = LCL
D=M
@FRAME
M=D
@5    //begin RETURN command RET = *(FRAME - 5)
D=A
@FRAME
A=M-D
D=M
@RET
M=D
@SP    //begin RETURN command * ARG = pop()
M=M-1
A=M
D=M
@ARG
A=M
M=D
@ARG    //begin RETURN command SP = ARG + 1 
M=M+1
D=M
@SP
M=D
@FRAME    //begin RETURN command THAT = *(FRAME - 1)
A=M-1
D=M
@THAT
M=D
@2    //begin RETURN command THIS = *(FRAME - 2)
D=A
@FRAME
A=M-D
D=M
@THIS
M=D
@3    //begin RETURN command ARG = *(FRAME - 3)
D=A
@FRAME
A=M-D
D=M
@ARG
M=D
@4    //begin RETURN command LCL = *(FRAME - 4)
D=A
@FRAME
A=M-D
D=M
@LCL
M=D
@RET    //begin RETURN command goto RET
A=M
0;JMP
(:Sys.add12)			//BEGIN FUNCTION COMMAND
@4002		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
@THIS		//begin POP POINTER command
D=A
@0
D=D+A
@R13
M=D
@SP
A=M
D=M
@R13
A=M
M=D		//end POP POINTER command
@5002		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
@THIS		//begin POP POINTER command
D=A
@1
D=D+A
@R13
M=D
@SP
A=M
D=M
@R13
A=M
M=D		//end POP POINTER command
@ARG    //begin PUSH ARG command
D=M
@0
A=D+A
D=M    //end PUSH ARG command
@SP
A=M
M=D
@SP
M=M+1
@12		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP			//begin ADD command
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D+M
@SP
A=M
M=D
@SP
M=M+1		//end ADD command
@LCL    //begin RETURN command FRAME = LCL
D=M
@FRAME
M=D
@5    //begin RETURN command RET = *(FRAME - 5)
D=A
@FRAME
A=M-D
D=M
@RET
M=D
@SP    //begin RETURN command * ARG = pop()
M=M-1
A=M
D=M
@ARG
A=M
M=D
@ARG    //begin RETURN command SP = ARG + 1 
M=M+1
D=M
@SP
M=D
@FRAME    //begin RETURN command THAT = *(FRAME - 1)
A=M-1
D=M
@THAT
M=D
@2    //begin RETURN command THIS = *(FRAME - 2)
D=A
@FRAME
A=M-D
D=M
@THIS
M=D
@3    //begin RETURN command ARG = *(FRAME - 3)
D=A
@FRAME
A=M-D
D=M
@ARG
M=D
@4    //begin RETURN command LCL = *(FRAME - 4)
D=A
@FRAME
A=M-D
D=M
@LCL
M=D
@RET    //begin RETURN command goto RET
A=M
0;JMP
