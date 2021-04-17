@256
D=A
@SP
M=D
@0		//PUSH CONSTANT
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
@0
D=D+A
@R13
M=D
@SP
A=M
D=M
@R13
A=M
M=D		//end POP LCL command
(:$LOOP_START) 			 //create label command
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
@LCL		//begin POP LCL command
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
M=D		//end POP LCL command
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
@:$LOOP_START
D;JNE			//end If command
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
