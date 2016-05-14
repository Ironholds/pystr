#include <Rcpp.h>
#include <codecvt>

using namespace Rcpp;

std::wstring utf8_str(std::string s) {
  std::wstring_convert<std::codecvt_utf8<wchar_t>, wchar_t> cv;
  std::wstring w = cv.from_bytes(s);
  return w;
}

bool str_endswith(std::string input, std::string suffix, int start, int end) {
  start--;
  end--;

  std::wstring input_w = utf8_str(input);
  std::wstring suffix_w = utf8_str(suffix);
  int input_length = input_w.length();
  int suffix_length = suffix_w.length();

  if (suffix_length == 0) {
    return true;
  }
  if (input_length < suffix_length || start > input_length || end < 0 || start > end) {
    return false;
  }

  int len = end - start + 1 < suffix_length ? end - start + 1 : suffix_length;

  std::wstring sub_input = input_w.substr(end - len + 1, len);
  return sub_input == suffix_w;
}

// This is used to recycle inputs a la mapply.
// We'll have to use this across the other functions to be consistent.
int idx(int i, int len) {
  int j = floor(i / len);
  return i - (len * j);
}

// [[Rcpp::export]]
LogicalVector pystr_endswith_(CharacterVector inputs,
                              CharacterVector suffixes,
                              NumericVector start,
                              NumericVector end) {

  int inputs_size = inputs.size();
  LogicalVector output(inputs_size);

  int suffix_size = suffixes.size();
  int start_size = start.size();
  int end_size = end.size();

  for (int i = 0; i < inputs_size; i++) {
    std::string input = Rcpp::as<std::string>(inputs[i]);
    std::string suffix = Rcpp::as<std::string>(suffixes[idx(i, suffix_size)]);
    int s = start[idx(i, start_size)];
    int e = end[idx(i, end_size)];

    if (inputs[i] == NA_STRING) {
      output[i] = NA_LOGICAL;
    } else {
      output[i] = str_endswith(input, suffix, s, e);
    }
  }

  return output;
}
