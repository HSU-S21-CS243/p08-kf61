#pragma once
#include "Command.hpp"
#include "PopCommand.hpp"
#include "PushCommand.hpp"

class AddCommand : public Command
{

public:
	//arg 1 = number, arg2 = second argument if one exists
	AddCommand(string segment = "", string arg1 = "", string arg2 = "")
		: Command(CommandType::Add, segment, arg1, arg2)
	{

	}

	virtual string ToAsm()
	{
		/*
		BEFORE:
				Z
				X
				Y

		SP -> ___
		AFTER:
				Z
				X+Y
		SP -> ___

		Example:
				3
				5
				7
		SP -> ___
		-------------
				3
				12
		SP -> ___
		*/
		ostringstream result{};
		//pop top stack value, store somewhere
		// pop top stack value, store again
		//add two values, store on stack

		//PopCommand pop1{ "GP2", "0" };
		//PopCommand pop2{ "GP3", "0" };
		//PushCommand push1{ "GP2", "0" };

		//result << pop1.ToAsm() << endl;
		//result << pop2.ToAsm() << endl;
		//result << "@" << Segment::GP3 << endl;
		//result << "D=M" << endl;
		//result << "@" << Segment::GP2 << endl;
		//result << "M=M+D" << endl;
		//result << push1.ToAsm();


		//Step #1: grab top item off of stack
		result << "@SP\t\t\t//begin ADD command" << endl;

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
		result << "D=D+M" << endl;

		//put result back on top of the stack
		result << "@SP" << endl;
		result << "A=M" << endl;
		result << "M=D" << endl;

		//increment stack pointer
		result << "@SP" << endl;
		result << "M=M+1\t\t//end ADD command" << endl;

		return result.str();
	}
};