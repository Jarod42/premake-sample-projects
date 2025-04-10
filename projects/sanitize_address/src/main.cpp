int main()
{
#if 0 // sanitizer aborts on detection
	int dummy = 0;
	int arr[42]{};
	int dummy2 = 0;

	int overflow = arr[42]; // overflow: to be spot by address sanitizer
#endif
}
