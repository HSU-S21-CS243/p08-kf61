#pragma once
#include "Command.hpp"
#include "PopCommand.hpp"
#include "PushCommand.hpp"

class EqualCommand : public Command
{
public:
	static int _counter;

	EqualCommand(string segment = "", string arg1 = "", string arg2 = "")
		: Command(CommandType::Equal, segment, arg1, arg2)
	{

	}

	virtual string ToAsm()
	{
		ostringstream result{};
		//Step #1: grab top item off of stack
		result << "@SP\t\t\t//begin EQUAL command" << endl;

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

		//M register = X, D regiser = Y, subtract Y from X if result is 0 then X eq Y
		result << "D=D-M" << endl;
		//create label for equaltrue jump
		result << "@:equaltrue" << _counter << endl;
		//if result is zero jump to equaltrue
		result << "D;JEQ" << endl;
		//create label for equalfalse jump
		result << "@:equalfalse" << _counter << endl;
		result << "0;JMP" << endl;
		//label for equaltrue than jump, set result -1
		result << "(:equaltrue" << _counter << ")" << endl;
		result << "D=-1" << endl;
		result << "@:equalend" << _counter << endl;
		result << "0;JMP" << endl;
		//label for equalfalse jump, keep d=0 
		result << "(:equalfalse" << _counter << ")" << endl;
		result << "D=0" << endl;
		result << "@:equalend" << _counter << endl;
		result << "0;JMP" << endl;
		//end jump
		result << "(:equalend" << _counter << ")" << endl;
		//put result back on top of the stack
		result << "@SP" << endl;
		result << "A=M" << endl;
		result << "M=D" << endl;

		//increment stack pointer
		result << "@SP" << endl;
		result << "M=M+1\t\t//end GREATER THAN command" << endl;

		//increment counter
		_counter++;

		return result.str();
	}
};

int EqualCommand::_counter = 0;