#include <Rcpp.h>

using namespace Rcpp;

// [[Rcpp::export]]
std::string pystr_join_(CharacterVector input, std::string separator) {
  int input_size = input.size();
  if (input_size == 0) {
    return std::string("");
  }
  std::string input_strings[input_size];
  int total_size = 0;
  int sep_length = separator.length();

  for (int i = 0; i < input_size; i++) {
    input_strings[i] = Rcpp::as<std::string>(input[i]);
    total_size += input_strings[i].length();
  }
  total_size += (sep_length * (input_size - 1));
  std::string output;
  output.reserve(total_size);
  for (int i = 0; i < input_size; i++) {
    output.append(input_strings[i]);
    if (i + 1 < input_size) {
      output.append(separator);
    }
  }
  return output;
}
