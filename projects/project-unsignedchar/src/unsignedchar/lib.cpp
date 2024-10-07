#include <type_traits>

void unsigned_char()
{
	static_assert(std::is_unsigned<char>::value, "char is expected to be unsigned"); // unsignedchar "On"
}
