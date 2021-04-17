#pragma once
#include "Command.hpp"
#include "PopCommand.hpp"
#include "PushCommand.hpp"

class CallCommand : public Command
{
private:
 
public:
    static int _counter;


    CallCommand(string segment = "", string arg1 = "", string arg2 = "")
        : Command(CommandType::Call, segment, arg1, arg2)
    {

    }
    
   //VM command
   //call f n
   //(calling a function f after n arguments have been pushed onto the stack)

    //Generated(pseudo)code emitted by the VM implementation :
    //    push return-address // (Using the label declared below)
    //    push LCL  // Save LCL of the calling function
    //    push ARG  // Save ARG of the calling function
    //    push THIS   // Save THIS of the calling function
    //    push THAT // Save THAT of the calling function 
    //    ARG = SP - n - 5 // Reposition ARG ( n ¼ number of args.) 
    //    LCL = SP // Reposition LCL 
    //    goto f // Transfer control 
    //    (return-address) // declare a label for the return - address


    //function name should be in arg1
    //# arguments should be in arg2
    virtual string ToAsm()
    {
        ostringstream result{};


        //BEGIN push return-address // (Using the label declared below)
        result << "@:" << arg1 << "." << _counter << "\t\t\t//BEGIN push return-address" << endl;
        result << "D=A" << endl;
        result << "@SP" << endl;
        result << "A=M" << endl;
        result << "M=D" << endl;
        result << "@SP" << endl;
        result << "M=M+1" << endl;

        //BEGIN push LCL  // Save LCL of the calling function
        //inc sp, get lcl, 
        result << "@LCL" << "\t\t\t//BEGIN push LCL" << endl;
        result << "D=M" << endl;
        result << "@SP" << endl;
        result << "A=M" << endl;
        result << "M=D" << endl;
        result << "@SP" << endl;
        result << "M=M+1" << endl;

    
        //push ARG  // Save ARG of the calling function
        result << "@ARG" << "\t\t\t//BEGIN push ARG" << endl;
        result << "D=M" << endl;
        result << "@SP" << endl;
        result << "A=M" << endl;
        result << "M=D" << endl;
        result << "@SP" << endl;
        result << "M=M+1" << endl;

        //push THIS   // Save THIS of the calling function
        result << "@THIS" << "\t\t\t//BEGIN push THIS" << endl;
        result << "D=M" << endl;
        result << "@SP" << endl;
        result << "A=M" << endl;
        result << "M=D" << endl;
        result << "@SP" << endl;
        result << "M=M+1" << endl;

        //push THAT  // Save THAT of the calling function
        result << "@THAT" "\t\t\t//BEGIN push THAT" << endl;;
        result << "D=M" << endl;
        result << "@SP" << endl;
        result << "A=M" << endl;
        result << "M=D" << endl;
        result << "@SP" << endl;
        result << "M=M+1" << endl;

        //ARG = SP - n - 5 // Reposition ARG ( n ¼ number of args.) 
        result << "@SP" << "\t\t\t//BEGIN ARG = SP - n - 5" << endl;
        result << "D=M" << endl;
        //get #args w arg2
        result << "@" << arg2 << endl;
        result << "D=D-A" << endl;
        result << "@5" << endl;
        result << "D=D-A" << endl;
        //set arg
        result << "@ARG" << endl;
        result << "M=D" << endl;


        //LCL = SP // Reposition LCL 
        result << "@SP" << "\t\t\t//BEGIN LCL = SP" << endl; //get sp
        result << "D=M" << endl; // store in D
        result << "@LCL" << endl; // get lcl
        result << "M=D" << endl; // set lcl to D=SP


        //    goto f // Transfer control 
        //@function
        result << "@:" << arg1 << "\t\t\t//BEGIN goto f" << endl;
        //unconditional jump
        result << "0;JMP " << endl;
        result << "(:" << arg1 << "." <<  _counter << ")" << endl;
        _counter++;
        return result.str();

    }
};
int CallCommand::_counter = 0;
