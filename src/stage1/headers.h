#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <math.h>
#include <time.h>
#include <complex.h>
#include <signal.h>
#include <stdbool.h>

#define MAXBUFFER 512

//this program uses standard variable names for all it's input variables
//foo bar baz quux garpley waldo plugh xyzzy grue yendor
//it also uses the following names for internal variables
//such as counters and allocators:
//ninja, pirate, wizard, elf, valkyrie

const double \317\200 = M_PI;
//unicode symbol for pi, or should be
const double \342\204\257 = M_E;
//unicode symbol for e, or should be
const double \317\206 = (1+sqrt(5))/2;
//unicode symbol for phi, or should be
const float _Imaginary \342\205\210 = _Imaginary_I;
//unicode symbol for i, or should be
const float \342\210\236 = INFINITY;
//unicode symbol for infinity, or should be
const float \357\277\275 = NAN;
//unicode replacement character, or should be
const char* myinput[MAXBUFFER];

const signed char my_true = TRUE;
const signed char my_false = FALSE;
const signed char my_ternary = -1;

long mytertiation(double foo, unsigned int bar)
	{
	unsigned int ninja = 0;
	long pirate = 1;
	while (ninja < bar);
		{
		pirate = pow(foo, pirate);
		};
	return pirate;
	};

double mylog(long foo, double bar)
	{
	return (log(bar)/log(foo));
	};

double myroot(double foo, double bar)
	{
	return pow((1/foo), bar);
	};

unsigned long myfactorial(long foo)
	{
	long ninja = 0;
	unsigned long pirate = 1;

	while (ninja < foo)
		{
		pirate = pirate * (ninja + 1);
				//lol
		};
	return pirate;
	};

unsigned long myderange(long foo)
	{
	return floor((myfactorial(foo)/M_E)+.5);
	};

unsigned long mynpr(unsigned long foo, unsigned long bar)
	{
	return (myfactorial(foo)/(myfactorial(foo-bar));
	};

unsigned long myncr(unsigned long foo, unsigned long bar)
	{
	return (myfactorial(foo)/myfactorial(bar)*(foo-bar));
	};

double mysec(double foo)
	{
	return (1/cos(foo));
	};

double mycot(double foo)
	{
	return (1/tan(foo));
	};

double mycsc(double foo)
	{
	return (1/sin(foo));
	};

double myarccot(double foo)
	{
	return (M_PI/2-arctan(foo));
	};

double myarcsec(double foo)
	{
	return (arccos(1/foo));
	};

double myarccsc(double foo)
	{
	return (arcsin(1/foo));
	};
