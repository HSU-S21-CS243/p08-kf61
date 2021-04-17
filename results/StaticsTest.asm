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
@6		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@8		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@:Class1.set.1			//BEGIN push return-address
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
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP			//BEGIN LCL = SP
D=M
@LCL
M=D
@:Class1.set			//BEGIN goto f
0;JMP 
(:Class1.set.1)
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
@23		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@15		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@:Class2.set.2			//BEGIN push return-address
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
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP			//BEGIN LCL = SP
D=M
@LCL
M=D
@:Class2.set			//BEGIN goto f
0;JMP 
(:Class2.set.2)
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
@:Class1.get.3			//BEGIN push return-address
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
@:Class1.get			//BEGIN goto f
0;JMP 
(:Class1.get.3)
@:Class2.get.4			//BEGIN push return-address
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
@:Class2.get			//BEGIN goto f
0;JMP 
(:Class2.get.4)
(:Sys.init$WHILE) 			 //create label command
@:Sys.init$WHILE			//begin GOTO command
0;JMP			//end GOTO command
(:Class1.set)			//BEGIN FUNCTION COMMAND
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
@SP
M=M-1
@Class1.vmm.0		//begin POP STATIC command
M=D		//end POP STATIC command
@ARG    //begin PUSH ARG command
D=M
@1
A=D+A
D=M    //end PUSH ARG command
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
@Class1.vmm.1		//begin POP STATIC command
M=D		//end POP STATIC command
@0		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
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
(:Class1.get)			//BEGIN FUNCTION COMMAND
@Class1.vmm.0    //begin PUSH STATIC command
D=M    //end PUSH STATIC command
@SP
A=M
M=D
@SP
M=M+1
@Class1.vmm.1    //begin PUSH STATIC command
D=M    //end PUSH STATIC command
@SP
A=M
M=D
@SP
M=M+1
@SP			//begin SUBTRACT command
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@SP
A=M
M=D
@SP
M=M+1		//end SUBTRACT command
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
(:Class2.set)			//BEGIN FUNCTION COMMAND
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
@SP
M=M-1
@Class2.vmm.0		//begin POP STATIC command
M=D		//end POP STATIC command
@ARG    //begin PUSH ARG command
D=M
@1
A=D+A
D=M    //end PUSH ARG command
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
@Class2.vmm.1		//begin POP STATIC command
M=D		//end POP STATIC command
@0		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
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
(:Class2.get)			//BEGIN FUNCTION COMMAND
@Class2.vmm.0    //begin PUSH STATIC command
D=M    //end PUSH STATIC command
@SP
A=M
M=D
@SP
M=M+1
@Class2.vmm.1    //begin PUSH STATIC command
D=M    //end PUSH STATIC command
@SP
A=M
M=D
@SP
M=M+1
@SP			//begin SUBTRACT command
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@SP
A=M
M=D
@SP
M=M+1		//end SUBTRACT command
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
