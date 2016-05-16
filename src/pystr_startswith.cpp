#include <Rcpp.h>

#include "index_util.h"
#include "string_util.h"

using namespace Rcpp;

bool str_startswith(std::string input, std::string prefix, int start, int end) {
  start = start < 1 ? 0 : start - 1;
  end--;

  std::wstring input_w = utf8_str(input);
  std::wstring prefix_w = utf8_str(prefix);
  int input_length = input_w.length();
  int prefix_length = prefix_w.length();

  if (prefix_length == 0) {
    return true;
  }
  if (input_length < prefix_length || start > input_length || end < 0 || start > end) {
    return false;
  }

  int len = calculate_length(start, end, prefix_length);
  std::wstring sub_input = input_w.substr(start, len);
  return sub_input == prefix_w;
}

// [[Rcpp::export]]
LogicalVector pystr_startswith_(CharacterVector inputs,
                                CharacterVector prefixes,
                                NumericVector start,
                                NumericVector end) {
  int inputs_size = inputs.size();
  LogicalVector output(inputs_size);
  int prefixes_size = prefixes.size();
  int start_size = start.size();
  int end_size = end.size();

  for (int i = 0; i < inputs_size; i++) {
    std::string input = Rcpp::as<std::string>(inputs[i]);
    std::string prefix = Rcpp::as<std::string>(prefixes[idx(i, prefixes_size)]);
    int s = start[idx(i, start_size)];
    int e = end[idx(i, end_size)];

    if (inputs[i] == NA_STRING) {
      output[i] = NA_LOGICAL;
    } else {
      output[i] = str_startswith(input, prefix, s, e);
    }
  }

  return output;
}
