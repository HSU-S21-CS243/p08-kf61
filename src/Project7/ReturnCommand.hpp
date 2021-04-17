#pragma once
#include "Command.hpp"
#include "PopCommand.hpp"
#include "PushCommand.hpp"

class ReturnCommand : public Command
{
private:

public:
    ReturnCommand(string segment = "", string arg1 = "", string arg2 = "")
        : Command(CommandType::Return, segment, arg1, arg2)
    {

    }

    virtual string ToAsm()
    {
        ostringstream result{};

        //~~~~~~~~~~~ ReturnCommand ~~~~~~~~~~~~~~~~~~~~~
        //copies return value onto arg 0 
        //restures segment pointers of caller
        //clears stack
        //sets sp for the caller
        //jumps to return address within caller's code 
        
        //~~~~~~~~ Generates Code ~~~~~~~~~~~~~~~~~~~~~~
        //FRAME = LCL // FRAME is a temporary variable 
        //RET = *(FRAME - 5)  // Put the return-address in a temp. var.
        //* ARG = pop()  // Reposition the return value for the caller
        //SP = ARG + 1  // Restore SP of the caller 
        //THAT = *(FRAME - 1) // Restore THAT of the caller  
        //THIS = *(FRAME - 2) // Restore THIS of the caller
        //ARG = *(FRAME - 3) // Restore ARG of the caller
        //LCL = *(FRAME - 4) // Restore LCL of the caller
        //goto RET          // Goto return-address (in the caller’s code)

        // BEGIN FRAME = LCL
        result << "@LCL" << "    //begin RETURN command FRAME = LCL" << endl; //get lcl
        result << "D=M" << endl; // store in D
        result << "@FRAME" << endl; // get frame
        result << "M=D" << endl; // set frame to D=LCL
        //END FRAME = LCL
        
        // BEGIN RET = *(FRAME - 5)  // Put the return-address in a temp. var.
        result << "@5" << "    //begin RETURN command RET = *(FRAME - 5)" << endl;
        result << "D=A" << endl;
        //*frame-5
        result << "@FRAME" << endl;
        result << "A=M-D" << endl;
        result << "D=M" << endl;
        //ret = *frame -5
        result << "@RET" << endl;
        result << "M=D" << endl;
        // END RET = *(FRAME - 5)

        // BEGIN * ARG = pop()  // Reposition the return value for the caller
        result << "@SP" << "    //begin RETURN command * ARG = pop()" << endl;
        //"top" item of stack is one less than SP value
        result << "M=M-1" << endl;
        //SP is now pointing at the top item in the stack
        //grab this top value (in our example, this would be the "Y" variable)
        result << "A=M" << endl;
        result << "D=M" << endl;
        //set arg to D
        result << "@ARG" << endl;
        result << "A=M" << endl;
        result << "M=D" << endl;
        /* END *ARG = POP*/


        //BEGIN SP = ARG + 1  // Restore SP of the caller 
        result << "@ARG" << "    //begin RETURN command SP = ARG + 1 " << endl;
        result << "M=M+1" << endl; // this might need to be D=M+1
        result << "D=M" << endl;
        result << "@SP" << endl;
        result << "M=D" << endl;
        //END SP = ARG + 1 

        //BEGIN THAT = *(FRAME - 1) // Restore THAT of the caller  
        result << "@FRAME" << "    //begin RETURN command THAT = *(FRAME - 1)" << endl;
        result << "A=M-1" << endl; //this might not work 
        result << "D=M" << endl;
        result << "@THAT" << endl;
        result << "M=D" << endl;
        //END THAT = *(FRAME - 1) 

        //BEGIN THIS = *(FRAME - 2) // Restore THIS of the caller
     
        result << "@2" << "    //begin RETURN command THIS = *(FRAME - 2)" << endl;
        result << "D=A" << endl;
        result << "@FRAME" << endl;
        result << "A=M-D" << endl;
        result << "D=M" << endl;
        result << "@THIS" << endl;
        result << "M=D" << endl;

        //END THIS = *(FRAME - 2) 

        //BEGIN ARG = *(FRAME - 3) // Restore ARG of the caller
        result << "@3" << "    //begin RETURN command ARG = *(FRAME - 3)" << endl;
        result << "D=A" << endl;
        result << "@FRAME" << endl;
        result << "A=M-D" << endl;
        result << "D=M" << endl;
        result << "@ARG" << endl;
        result << "M=D" << endl;
        //END ARG = *(FRAME - 3) 


        //LCL = *(FRAME - 4) // Restore LCL of the caller
        result << "@4" << "    //begin RETURN command LCL = *(FRAME - 4)" << endl;
        result << "D=A" << endl;
        result << "@FRAME" << endl;
        result << "A=M-D" << endl;
        result << "D=M" << endl;
        result << "@LCL" << endl;
        result << "M=D" << endl;


        //BEGIN goto RET  // Goto return-address (in the caller’s code)
        result << "@RET" << "    //begin RETURN command goto RET" << endl;
        result << "A=M" << endl;
        result << "0;JMP" << endl;
        //END goto RET  // Goto return-address (in the caller’s code)

        return result.str();
    }
};
