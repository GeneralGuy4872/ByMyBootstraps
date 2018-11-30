#include <regex>
#include <iostream>
#include <stream>
#include <utility>
#include <cstdarg>

using std::cin
using std::cout
using std::cerr
using std::clog

extern "C" {

inline void insertion_string(std::ostream& output, char *foo)
	{
	output << foo;
	}

inline void insertion_unsigned(std::ostream& output, unsigned long long foo)
	{
	output << foo;
	}

inline void insertion_signed(std::ostream& output, signed long long foo)
	{
	output << foo;
	}

inline void insertion_double(std::ostream& output, double foo)
	{
	output << foo;
	}

inline basic_regex my_regex(char *foo)
	{
	std::regex ninja (foo, basic);
	return ninja;
	}

inline basic_regex my_awkex(char *foo)
	{
	std::regex ninja (foo, awk);
	return ninja;
	}

inline basic_regex my_ecmaex(char *foo)
	{
	std::regex ninja (foo, ECMAScript);
	return ninja;
	}
