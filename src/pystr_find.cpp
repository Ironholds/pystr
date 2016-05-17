#include <Rcpp.h>

#include "index_util.h"
#include "string_util.h"

using namespace Rcpp;

int str_find(std::string input, std::string sub, int start, int end) {
  std::wstring input_w = utf8_str(input);
  std::wstring sub_w = utf8_str(sub);
  int input_length = input_w.length();
  int sub_length = sub_w.length();
  start = start < 1 ? 1 : start;
  end = end > input_length ? input_length : end;

  if (sub_length == 0) {
    return 1;
  }
  if (input_length < sub_length || start > input_length || end < 1 || start > end) {
    return -1;
  }

  std::wstring input_section = input_w.substr(0, end);
  int result = input_section.find(sub_w, start - 1);
  return result == -1 ? result : result + 1;
}

// [[Rcpp::export]]
IntegerVector pystr_find_(CharacterVector inputs, CharacterVector subs, IntegerVector starts, IntegerVector ends) {
  int inputs_size = inputs.size();
  IntegerVector output(inputs_size);
  int subs_size = subs.size();
  int starts_size = starts.size();
  int ends_size = ends.size();

  for (int i = 0; i < inputs_size; i++) {
    std::string input = Rcpp::as<std::string>(inputs[i]);
    std::string sub = Rcpp::as<std::string>(subs[idx(i, subs_size)]);
    int start = starts[idx(i, starts_size)];
    int end = ends[idx(i, ends_size)];
    output[i] = str_find(input, sub, start, end);
  }

  return output;
}
