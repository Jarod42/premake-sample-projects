enum E
{
	A,
	B
};


void foo(E e) {
	switch (e) {
		case E::A: break;
		// missing case E::B
	}
} 

int main()
{
}
