#include <type_traits>

void signed_char()
{
	static_assert(std::is_signed<char>::value, "char is expected to be signed"); // unsignedchar "Off"
}
