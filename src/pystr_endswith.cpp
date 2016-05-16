#include <Rcpp.h>

#include "index_util.h"
#include "string_util.h"

using namespace Rcpp;

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

  int len = calculate_length(start, end, suffix_length);

  std::wstring sub_input = input_w.substr(end - len + 1, len);
  return sub_input == suffix_w;
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
