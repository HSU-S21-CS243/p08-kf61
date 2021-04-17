#pragma once
#include <sstream>
#include <string>
#include <vector>
#include "Command.hpp"
using namespace std;

class PushCommand : public Command
{
private:
	string _file_name;

	void pushDToTopOfStack(ostringstream &str)
	{
		//store value on top of stack
		str << "@SP" << endl;
		str << "A=M" << endl;
		str << "M=D" << endl;
	}

public:
	PushCommand(string segment = "", string arg1 = "", string arg2 = "", string file_name = "")
		: Command(CommandType::Push, segment, arg1, arg2),
		_file_name(file_name)
	{

	}

	virtual string ToAsm()
	{
		ostringstream result{};

		//convert command into equivalent assembly
		//Goal for each CASE is to put what you want into D so that at the end of the 
		//switch, D will get pushed onto the top of the stack.
		switch (segment)
		{
		case Segment::Local:
			//local
			result << "@LCL" << "\t\t // BEGIN PUSH LOCAL" << endl;
			result << "D=M" << endl;
			result << "@" << arg1 << endl;
			result << "A=D+A" << endl;
			result << "D=M" << "\t\t // END PUSH LOCAL" <<  endl;

			break;
		case Segment::Argument:
			//argument 
			result << "@ARG" << "    //begin PUSH ARG command" << endl;
			result << "D=M" << endl;
			result << "@" << arg1 << endl;
			result << "A=D+A" << endl;
			result << "D=M" << "    //end PUSH ARG command" << endl;

			break;
		case Segment::This:
			//this
			result << "@THIS" << "    //begin PUSH THIS command" << endl;
			result << "D=M" << endl;
			result << "@" << arg1 << endl;
			result << "A=D+A" << endl;
			result << "D=M" << "    //end PUSH THIS command" << endl;

			break;
		case Segment::That:
			//that 
			result << "@THAT" << "    //begin PUSH THAT command" << endl;
			result << "D=M" << endl;
			result << "@" << arg1 << endl;
			result << "A=D+A" << endl;
			result << "D=M" << "    //end PUSH THAT command" << endl;

			break;
		case Segment::Temp:
			//temp
			result << "@R5" << "    //begin PUSH TEMP command" << endl;
			result << "D=A" << endl; 
			result << "@" << arg1 << endl;
			result << "A=D+A" << endl;
			result << "D=M" << "    //end PUSH TEMP command" << endl;

			break;
		case Segment::Static:
			result << "@" << getFileName() << "." << arg1 << "    //begin PUSH STATIC command" << endl;	
			result << "D=M" << "    //end PUSH STATIC command" << endl;

			break;
		case Segment::Constant:
			//constant 
			result << "@" << arg1 << "\t\t//PUSH CONSTANT" << endl;
			result << "D=A" << endl;

			break;
		case Segment::Pointer:
			//pointer
			if (stoi(arg1) == 0) {
				result << "@THIS" << "    //begin PUSH POINTER command" << endl;
				result << "D=M" <<  endl;
			}
			if (stoi(arg1) == 1) {
				result << "@THAT" << "    //begin PUSH POINTER command" << endl;
				result << "D=M" << endl;
			}
			break;
		case Segment::GP1:
			result << "@" << Segment::GP1 << endl;
			result << "D=M" << endl;
			break;

		case Segment::GP2:
			result << "@" << Segment::GP2 << endl;
			result << "D=M" << endl;
			break;

		case Segment::GP3:
			result << "@" << Segment::GP3 << endl;
			result << "D=M" << endl;
			break;
		default:
			break;
		}

		//This will be okay IF each switch branch puts what it needs put on the stack in the 
		//D register
		pushDToTopOfStack(result);

		//increment stack pointer
		result << "@SP" << endl;
		result << "M=M+1" << endl;
		
		return result.str();
	}
};
