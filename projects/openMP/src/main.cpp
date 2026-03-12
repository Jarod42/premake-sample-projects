#ifndef _OPENMP // openmp "On"
# error "openMP not active"
#endif

#include <iostream>

int main()
{
	int count = 0;
	#pragma omp parallel num_threads(2)
	{
		#pragma omp atomic
		++count;
	}
	std::cout << (count > 1 ? "several threads\n" : "only one thread?\n");
}
