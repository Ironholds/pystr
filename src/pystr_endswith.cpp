#include <Rcpp.h>

using namespace Rcpp;

int get_max_size(CharacterVector inputs);
bool str_endswith(std::string input, std::string suffix, int start, int end);
LogicalVector pystr_endswith_1(CharacterVector inputs, CharacterVector suffixes);
LogicalVector pystr_endswith_2(CharacterVector inputs, CharacterVector suffixes, int end);
LogicalVector pystr_endswith_3(CharacterVector inputs, CharacterVector suffixes, int start);
LogicalVector pystr_endswith_4(CharacterVector inputs, CharacterVector suffixes,int start, int end);

int get_max_size(CharacterVector inputs) {
  int max_size = 0;
  for (int i = 0; i < inputs.size(); i++) {
    std::string input = Rcpp::as<std::string>(inputs[i]);
    if (input.size() > max_size) {
      max_size = input.size();
    }
  }
  return max_size;
}

bool str_endswith(std::string input, std::string suffix, int start, int end) {
  int input_length = input.length();
  int suffix_length = suffix.length();
  if (suffix_length == 0) {
    return true;
  }
  if (input_length < suffix_length || start > input_length ||
      end < 1 || start > end) {
    return false;
  }

  int _start = start < 1 ? 0 : start - 1;
  int _end = end > input_length ? input_length - 1 : end - 1;
  int len = _end - _start + 1 < suffix_length ? _end - _start + 1 : suffix_length;
  std::string sub_input = input.substr(_end - len + 1, len);

  return sub_input == suffix;
}

// [[Rcpp::export]]
LogicalVector pystr_endswith_1(CharacterVector inputs, CharacterVector suffixes) {
  int max_size = get_max_size(inputs);
  return pystr_endswith_4(inputs, suffixes, 0, max_size);
}

// [[Rcpp::export]]
LogicalVector pystr_endswith_2(CharacterVector inputs, CharacterVector suffixes, int end) {
  return pystr_endswith_4(inputs, suffixes, 0, end);
}

// [[Rcpp::export]]
LogicalVector pystr_endswith_3(CharacterVector inputs, CharacterVector suffixes, int start) {
  int max_size = get_max_size(inputs);
  return pystr_endswith_4(inputs, suffixes, start, max_size);
}

// [[Rcpp::export]]
LogicalVector pystr_endswith_4(
    CharacterVector inputs, CharacterVector suffixes,int start, int end) {
  int inputs_size = inputs.size();
  LogicalVector output(inputs_size);

  for (int i = 0; i < inputs_size; i++) {
    std::string input = Rcpp::as<std::string>(inputs[i]);

    if (inputs[i] == NA_STRING) {
      output[i] = NA_LOGICAL;
    } else {
      int j = 0;
      output[i] = false;
      while (j < suffixes.length() && !output[i]) {
        std::string suffix = Rcpp::as<std::string>(suffixes[j++]);
        output[i] = str_endswith(input, suffix, start, end);
      }
    }
  }

  return output;
}
