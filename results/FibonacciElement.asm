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
@4		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@:Main.fibonacci.1			//BEGIN push return-address
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
@:Main.fibonacci			//BEGIN goto f
0;JMP 
(:Main.fibonacci.1)
(:Sys.init$WHILE) 			 //create label command
@:Sys.init$WHILE			//begin GOTO command
0;JMP			//end GOTO command
(:Main.fibonacci)			//BEGIN FUNCTION COMMAND
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
@2		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP			//begin LESS THAN command
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@:lessthantrue0
D;JLT
@:lessthanfalse0
0;JMP
(:lessthantrue0)
D=-1
@:lessthanend0
0;JMP
(:lessthanfalse0)
D=0
@:lessthanend0
0;JMP
(:lessthanend0)
@SP
A=M
M=D
@SP
M=M+1		//end LESS THAN command
@SP			//begin If command
M=M-1
A=M
D=M
@:Main.fibonacci$IF_TRUE
D;JNE			//end If command
@:Main.fibonacci$IF_FALSE			//begin GOTO command
0;JMP			//end GOTO command
(:Main.fibonacci$IF_TRUE) 			 //create label command
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
(:Main.fibonacci$IF_FALSE) 			 //create label command
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
@2		//PUSH CONSTANT
D=A
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
@:Main.fibonacci.2			//BEGIN push return-address
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
@:Main.fibonacci			//BEGIN goto f
0;JMP 
(:Main.fibonacci.2)
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
@1		//PUSH CONSTANT
D=A
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
@:Main.fibonacci.3			//BEGIN push return-address
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
@:Main.fibonacci			//BEGIN goto f
0;JMP 
(:Main.fibonacci.3)
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
