@256
D=A
@SP
M=D
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
@0		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
@THAT		//begin POP THAT command
D=M
@0
D=D+A
@R13
M=D
@SP
A=M
D=M
@R13
A=M
M=D		//end POP THAT command
@1		//PUSH CONSTANT
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
@THAT		//begin POP THAT command
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
M=D		//end POP THAT command
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
@SP
M=M-1
@ARG		//begin POP ARG command
D=M
@0
D=D+A
@R13
M=D
@SP
A=M
D=M
@R13
A=M
M=D		//end POP ARG command
(:MAIN_LOOP_START)
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
@SP			//begin If command
M=M-1
A=M
D=M
@:COMPUTE_ELEMENT
D;JNE			//end If command
@:END_PROGRAM			//begin GOTO command
0;JMP			//end GOTO command
(:COMPUTE_ELEMENT)
@THAT    //begin PUSH THAT command
D=M
@0
A=D+A
D=M    //end PUSH THAT command
@SP
A=M
M=D
@SP
M=M+1
@THAT    //begin PUSH THAT command
D=M
@1
A=D+A
D=M    //end PUSH THAT command
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
@SP
M=M-1
@THAT		//begin POP THAT command
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
M=D		//end POP THAT command
@THAT    //begin PUSH POINTER command
D=M
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
@SP
M=M-1
@ARG		//begin POP ARG command
D=M
@0
D=D+A
@R13
M=D
@SP
A=M
D=M
@R13
A=M
M=D		//end POP ARG command
@:MAIN_LOOP_START			//begin GOTO command
0;JMP			//end GOTO command
(:END_PROGRAM)
