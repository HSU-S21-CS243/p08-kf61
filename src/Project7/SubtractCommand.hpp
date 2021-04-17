#pragma once
#include "Command.hpp"
#include "PopCommand.hpp"
#include "PushCommand.hpp"

class SubtractCommand : public Command
{
public:
	SubtractCommand(string segment = "", string arg1 = "", string arg2 = "")
		: Command(CommandType::Subtract, segment, arg1, arg2)
	{

	}

	virtual string ToAsm()
	{
		ostringstream result{};

		//decrement stack pointer to get second value (Y)
		result << "@SP\t\t\t//begin SUBTRACT command" << endl;
		result << "M=M-1" << endl;

		//grab the Y address, store Y value in D
		result << "A=M" << endl;
		result << "D=M" << endl;

		//decrement again to get first address (X)
		result << "@SP" << endl;
		result << "M=M-1" << endl;
		result << "A=M" << endl;

		//A points to X, D has value of Y
		result << "D=M-D" << endl;
		result << "@SP" << endl;
		result << "A=M" << endl;
		result << "M=D" << endl;

		//increment stack pointer
		result << "@SP" << endl;
		result << "M=M+1\t\t//end SUBTRACT command" << endl;


		return result.str();
	}
};