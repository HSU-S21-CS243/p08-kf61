#pragma once
#include "Command.hpp"
#include "PopCommand.hpp"
#include "PushCommand.hpp"
#include "FunctionCommand.hpp"


class GotoCommand : public Command
{
private:


public:
    GotoCommand(string segment = "", string arg1 = "", string arg2 = "")
        : Command(CommandType::Goto, segment, arg1, arg2)
    {
        
    }

    //label to jump to should be in arg1
    virtual string ToAsm()
    {
        ostringstream result{};
        //goto arg1, 0;JMP
        //create label in format (functionName$Labelsymbolid)
        result << "@:" << FunctionCommand::fxnName << "$" << arg1 << "\t\t\t//begin GOTO command" << endl;
        result << "0;JMP" <<  "\t\t\t//end GOTO command" << endl;

        return result.str();
    }
};