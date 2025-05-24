#include <cstdint>

struct S
{
    char c;
    // padding here depends of alignment/pack
    std::int32_t i;
};

static_assert(alignof(char) == 1, "non standard compliant");
static_assert(alignof(std::int32_t) == 4, "'regular' alignment");

// static_assert(sizeof(S) == 5, "!"); // /Zp1
static_assert(sizeof(S) == 6, "!"); // /Zp2
// static_assert(sizeof(S) == 8, "!"); // /Zp4+

int main()
{
}
