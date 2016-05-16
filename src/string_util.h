#ifndef STRING_UTIL_H
#define STRING_UTIL_H

#include <codecvt>

std::wstring utf8_str(std::string s);
int calculate_length(int start, int end, int particle_length);

#endif
