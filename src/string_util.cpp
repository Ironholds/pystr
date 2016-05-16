#include <Rcpp.h>
#include <codecvt>
#include "string_util.h"

std::wstring utf8_str(std::string s) {
  std::wstring_convert<std::codecvt_utf8<wchar_t>, wchar_t> cv;
  return cv.from_bytes(s);
}

int calculate_length(int start, int end, int particle_length) {
  return end - start + 1 < particle_length ? end - start + 1 : particle_length;
}
