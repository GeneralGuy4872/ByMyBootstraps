#include <stdlib.h>

void halt_and_panic()
	{
	system("echo 1 > /proc/sys/kernel/sysrq");
	system("echo c > /proc/sysrq-trigger");
	};
end
