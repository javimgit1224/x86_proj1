#include <stdio.h>
extern "C" double radius();	//use standard C rules for parameter passing
int main()
{
	double return_code = 11.11;
	printf("%s", "this is cpsc 240 assignment 1 programmed by javier melendrez. \n");
	printf("%s", "this software is running on a Acer E-5 575 with processor intel i3-7100u running at 2.40ghz \n");
	return_code = radius();
	printf("%s%1.18lf%s\n","the driver recieved return code: ", return_code,". \n the driver will now return 0 to the os. have a nice x86 day.");
	return 0;
}

