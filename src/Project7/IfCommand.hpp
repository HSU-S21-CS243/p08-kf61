#pragma once
#include "Command.hpp"
#include "PopCommand.hpp"
#include "PushCommand.hpp"
#include "FunctionCommand.hpp"


class IfCommand : public Command
{
private:


public:
    IfCommand(string segment = "", string arg1 = "", string arg2 = "")
        : Command(CommandType::If, segment, arg1, arg2)
    {

    }

    //label to jump to should be in arg1
    virtual string ToAsm()
    {
        ostringstream result{};
        //goto arg1, 0;JMP

      //Step #1: grab top item off of stack
        result << "@SP\t\t\t//begin If command" << endl;

        //"top" item of stack is one less than SP value
        result << "M=M-1" << endl;

        //SP is now pointing at the top item in the stack
        //grab this top value (in our example, this would be the "Y" variable)
        result << "A=M" << endl;
        result << "D=M" << endl;
        //get label 
        //format label(functionName$Labelsymbolid)
        result << "@:" << FunctionCommand::fxnName << "$" << arg1 <<  endl;
        //jump if !=0
        result << "D;JNE" << "\t\t\t//end If command" <<  endl;

        return result.str();
    }
};