#include <Rcpp.h>

using namespace Rcpp;

std::string generate_zeroes(int length) {
  std::string result;
  result.reserve(length);
  for (int i = 0; i < length; i++) {
    result.append("0");
  }
  return result;
}

std::string str_fill(std::string input, int width) {
  int zeroes_length = width - input.length();
  if (zeroes_length > 0) {
    std::string filledInput;
    filledInput.reserve(width);
    std::string zeroes = generate_zeroes(zeroes_length);
    if (input.at(0) == '+' || input.at(0) == '-') {
      filledInput.append(input.substr(0, 1));
      filledInput.append(zeroes);
      filledInput.append(input.substr(1));
    } else {
      filledInput.append(zeroes);
      filledInput.append(input);
    }
    return filledInput;
  } else {
    return input;
  }
}

// [[Rcpp::export]]
CharacterVector pystr_zfill_(CharacterVector inputs, int width) {
  int inputs_size = inputs.size();
  CharacterVector output(inputs_size);

  for (int i = 0; i < inputs_size; i++) {
    std::string input = Rcpp::as<std::string>(inputs[i]);
    output[i] = str_fill(input, width);
  }

  return output;
}
