#pragma once
#include "Command.hpp"
#include "PopCommand.hpp"
#include "PushCommand.hpp"
#include "FunctionCommand.hpp"


class LabelCommand : public Command
{
private:
    static int _counter;


public:
    LabelCommand(string segment = "", string arg1 = "", string arg2 = "")
        : Command(CommandType::Label, segment, arg1, arg2)
    {

    }

    //label should be in arg1
    virtual string ToAsm()
    {
        ostringstream result{};
       
        //create label in format (functionName$Labelsymbolid)
        result << "(:" << FunctionCommand::fxnName << "$" << arg1 << ")" << " \t\t\t //create label command" << endl;
	
        return result.str();
    }
};
