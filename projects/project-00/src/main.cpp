// #error "test"

struct S
{
    void bar(int)
    {
    }
    void foo(this S& self)
    {
    }
};

int main()
{
    S s;

    s.bar();
    s.foo();
}
