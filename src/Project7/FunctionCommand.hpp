#pragma once
#include "Command.hpp"
#include "PopCommand.hpp"
#include "PushCommand.hpp"

class FunctionCommand : public Command
{
private:

protected:


public:
    FunctionCommand(string segment = "", string arg1 = "", string arg2 = "")
        : Command(CommandType::Return, segment, arg1, arg2)
    {
        
    }
    string getFxnName() {
        return fxnName;
    }
    //setFxnName: expects string new name, sets fxnName to new name.
    void setFxnName(string name) {
        fxnName = name;
    }
    static string fxnName;
//
//Command: function f k 
//        (f) // declare label for function entry
//        repeat k times //k = num local variables
//        push 0 // Initialize all of them to 0



    //function name should be in arg1
    //# arguments should be in arg2
    virtual string ToAsm()
    {
        ostringstream result{};
        //update fxnName for labels 
        setFxnName(arg1);
        //create function label
        result << "(:" << arg1 << ")" << "\t\t\t//BEGIN FUNCTION COMMAND" <<  endl;
        //initialize locals to 0, repeat i times for each local var
        for (int i = 0; i < stoi(arg2); i++) {
            result << "@SP" <<  endl; // lcl address
            result << "A=M" << endl; 
            result << "M=0" << endl; // set to 0 
            result << "@SP" << endl;
            result << "M=M+1" << endl; //inc sp  
        }
        return result.str();
    }
    
}; 
//initialize function name for labels
//functionCommand arg1 = function name 
string FunctionCommand::fxnName = "";
