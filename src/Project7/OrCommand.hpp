#pragma once
#include "Command.hpp"
#include "PopCommand.hpp"
#include "PushCommand.hpp"

class OrCommand : public Command
{
public:
	OrCommand(string segment = "", string arg1 = "", string arg2 = "")
		: Command(CommandType::Or, segment, arg1, arg2)
	{

	}

	virtual string ToAsm()
	{
		ostringstream result{};

		////Step #1: grab top item off of stack
		result << "@SP\t\t\t//begin OR command" << endl;

		//"top" item of stack is one less than SP value
		result << "M=M-1" << endl;

		//SP is now pointing at the top item in the stack
		//grab this top value (in our example, this would be the "Y" variable)
		result << "A=M" << endl;
		result << "D=M" << endl;

		//decrement again to get first value (X)
		result << "@SP" << endl;
		result << "M=M-1" << endl;
		result << "A=M" << endl;

		//M register = X, D regiser = Y
		result << "D=D|M" << endl;

		//put result back on top of the stack
		result << "@SP" << endl;
		result << "A=M" << endl;
		result << "M=D" << endl;

		//increment stack pointer
		result << "@SP" << endl;
		result << "M=M+1\t\t//end OR command" << endl;
		return result.str();
	}
};