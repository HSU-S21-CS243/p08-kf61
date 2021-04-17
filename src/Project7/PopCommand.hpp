#pragma once
#include <sstream>
#include <string>
#include <vector>
#include <exception>
#include "Command.hpp"
using namespace std;

class PopCommand : public Command
{
private:
	string _file_name;


public:
	PopCommand(string segment = "", string arg1 = "", string arg2 = "", string file_name = "")
		: Command(CommandType::Pop, segment, arg1, arg2),
		_file_name(file_name)
	{

	}

	virtual string ToAsm()
	{
		ostringstream result{};

		//before you can grab the value, we need to decrement the stack pointer by 1
		result << "@SP" << endl;
		result << "M=M-1" << endl;

		switch (segment)
		{
		case Segment::None:
			break;
		case Segment::Stack:
			break;
		case Segment::Local:
			//@ segment
			result << "@LCL" << "\t\t//begin POP LCL command" << endl;
			//get segment start
			result << "D=M" << endl;
			//segment + offset  = address
			result << "@" << arg1 << endl;
			result << "D=D+A" << endl;
			//put seg + offset into gp reg
			result << "@R13" << endl;
			result << "M=D" << endl;
			//get stack pointer 
			result << "@SP" << endl;
			result << "A=M" << endl;
			result << "D=M" << endl;
			//store sp data at address pointed to by R13
			result << "@R13" << endl;
			result << "A=M" << endl;
			result << "M=D" << "\t\t//end POP LCL command" << endl;
			
			break;
		case Segment::Argument:
			//@ segment
			result << "@ARG" << "\t\t//begin POP ARG command" << endl;
			//get segment start
			result << "D=M" << endl;
			//segment + offset  = address
			result << "@" << arg1 << endl;
			result << "D=D+A" << endl;
			//put seg + offset into gp reg
			result << "@R13" << endl;
			result << "M=D" << endl;
			//get stack pointer 
			result << "@SP" << endl;
			result << "A=M" << endl;
			result << "D=M" << endl;
			//store sp data at address pointed to by R13
			result << "@R13" << endl;
			result << "A=M" << endl;
			result << "M=D" << "\t\t//end POP ARG command" << endl;
			
			break;
		case Segment::This:
			//@ segment
			result << "@THIS" << "\t\t//begin POP THIS command" << endl;
			//get segment start
			result << "D=M" << endl;
			//segment + offset  = address
			result << "@" << arg1 << endl;
			result << "D=D+A" << endl;
			//put seg + offset into gp reg
			result << "@R13" << endl;
			result << "M=D" << endl;
			//get stack pointer 
			result << "@SP" << endl;
			result << "A=M" << endl;
			result << "D=M" << endl;
			//store sp data at address pointed to by R13
			result << "@R13" << endl;
			result << "A=M" << endl;
			result << "M=D" << "\t\t//end POP THIS command" << endl;
			
			break;
		case Segment::That:
			//@ segment
			result << "@THAT" << "\t\t//begin POP THAT command" << endl;
			//get segment start
			result << "D=M" << endl;
			//segment + offset  = address
			result << "@" << arg1 << endl;
			result << "D=D+A" << endl;
			//put seg + offset into gp reg
			result << "@R13" << endl;
			result << "M=D" << endl;
			//get stack pointer 
			result << "@SP" << endl;
			result << "A=M" << endl;
			result << "D=M" << endl;
			//store sp data at address pointed to by R13
			result << "@R13" << endl;
			result << "A=M" << endl;
			result << "M=D" << "\t\t//end POP THAT command" << endl;
			break; 
		case Segment::Temp:
			//@ segment
			result << "@R5" << "\t\t//begin POP TEMP command" << endl;
			//get segment start
			result << "D=A" << endl;
			//segment + offset  = address
			result << "@" << arg1 << endl;
			result << "D=D+A" << endl;
			//put seg + offset into gp reg
			result << "@R13" << endl;
			result << "M=D" <<  endl;
			//point back to stack to grab stack value to be placed back at R13 
			result << "@SP" << endl;
			//get offset from reg
			result << "A=M" <<  endl;
			result << "D=M" << endl;
			//store sp data at address pointed to by R13
			result << "@R13" << endl;
			result << "A=M" << endl;
			result << "M=D" << "\t\t//end POP TEMP command" << endl;

			break;
		case Segment::Static:
			//get static var 
			result << "@" << getFileName() << "." << arg1 << "\t\t//begin POP STATIC command" << endl;
			//set to D
			result << "M=D" << "\t\t//end POP STATIC command" << endl;
			break;
		case Segment::Constant:
			break;
		case Segment::Pointer:
			//@ segment
			result << "@THIS" << "\t\t//begin POP POINTER command" << endl;
			//get segment start
			result << "D=A" << endl;
			//segment + offset  = address
			result << "@" << arg1 << endl;
			result << "D=D+A" << endl;
			//put seg + offset into gp reg
			result << "@R13" << endl;
			result << "M=D" << endl;
			//get stack pointer 
			result << "@SP" << endl;
			result << "A=M" << endl;
			result << "D=M" << endl;
			//store sp data at address pointed to by R13
			result << "@R13" << endl;
			result << "A=M" << endl;
			result << "M=D" << "\t\t//end POP POINTER command" << endl;
			break;
		case Segment::GP1:

			//AC: In my VM, I disallow popping into GP1.  I do this to ensure that
			//it doesn't accidentally get overwritten.  This was a completely 
			//arbitrary decision by me and may not be of importance at all to you.
			throw "Cannot pop into GP1";
			break;
		case Segment::GP2:

			//load top value in stack into D
			result << "A=M" << endl;
			result << "D=M" << endl;

			//load GP2 register value into A
			result << "@" << Segment::GP2 << endl;
			result << "M=D" << endl;
			break;
		case Segment::GP3:

			//load top value in stack into D
			result << "A=M" << endl;
			result << "D=M" << endl;

			//load GP2 register value into A
			result << "@" << Segment::GP3 << endl;
			result << "M=D" << endl;
			break;
		default:
			break;
		}
		return result.str();
	}
};
