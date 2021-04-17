#pragma once
#include "Command.hpp"
#include "PopCommand.hpp"
#include "PushCommand.hpp"

class NotCommand : public Command
{
public:
    NotCommand(string segment = "", string arg1 = "", string arg2 = "")
        : Command(CommandType::Not, segment, arg1, arg2)
    {

    }

    virtual string ToAsm()
    {
        ostringstream result{};

        result << "@SP\t\t\t//begin NOT command" << endl;

        //"top" item of stack is one less than SP value
        result << "M=M-1" << endl;

        //SP is now pointing at the top item in the stack
        //grab this top value (in our example, this would be the "Y" variable)
        result << "A=M" << endl;
        result << "D=!M" << endl;
        //put result back at top of stack
        result << "@SP" << endl;
        result << "A=M" << endl;
        result << "M=D" << endl;
        //increment stack pointer
        result << "@SP" << endl;
        result << "M=M+1\t\t//end NOT command" << endl;

        return result.str();
    }
};