#pragma once
#include "Command.hpp"
#include "PopCommand.hpp"
#include "PushCommand.hpp"

class LessThanCommand : public Command
{
public:
	static int _counter;

	LessThanCommand(string segment = "", string arg1 = "", string arg2 = "")
		: Command(CommandType::LessThan, segment, arg1, arg2)
	{

	}

	virtual string ToAsm()
	{
		ostringstream result{};

		//Step #1: grab top item off of stack
		result << "@SP\t\t\t//begin LESS THAN command" << endl;

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

		//M register = X, D regiser = Y, subtract Y from X if result is <0 then X lt Y
		result << "D=M-D" << endl;
		//create label for islessthantrue jump
		result << "@:lessthantrue" << _counter << endl;
		//if result is less than zero jump to lessthantrue
		result << "D;JLT" << endl;
		//create label for islessthanfalse jump
		result << "@:lessthanfalse" << _counter << endl;
		result << "0;JMP" << endl;
		//label for islessthantrue than jump, set result -1
		result << "(:lessthantrue" << _counter << ")" << endl;
		result << "D=-1" << endl;
		result << "@:lessthanend" << _counter << endl;
		result << "0;JMP" << endl;
		//label for islessthanfalse jump, keep d=0 
		result << "(:lessthanfalse" << _counter << ")" << endl;
		result << "D=0" << endl;
		result << "@:lessthanend" << _counter << endl;
		result << "0;JMP" << endl;
		//end jump
		result << "(:lessthanend" << _counter << ")" << endl;
		//put result back on top of the stack
		result << "@SP" << endl;
		result << "A=M" << endl;
		result << "M=D" << endl;

		//increment stack pointer
		result << "@SP" << endl;
		result << "M=M+1\t\t//end LESS THAN command" << endl;

		//increment counter
		_counter++;

		return result.str();
	}
};

int LessThanCommand::_counter = 0;