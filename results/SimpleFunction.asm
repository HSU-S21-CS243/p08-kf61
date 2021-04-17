@256
D=A
@SP
M=D
(:SimpleFunction.test)			//BEGIN FUNCTION COMMAND
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
@SP			//begin NOT command
M=M-1
A=M
D=!M
@SP
A=M
M=D
@SP
M=M+1		//end NOT command
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
