#include <Rcpp.h>
using namespace Rcpp;

int str_count(std::string str, std::string sub, int start, int end) {
  if(sub == "\0") {
    return end - start + 2;
  }

  if(start > str.size()) {
    return 0;
  }

  std::string str_ = str.substr(start, end - start + 1);

  int count = 0;
  size_t offset = str_.find(sub);

  while (offset != std::string::npos) {
    ++count;
    offset = str_.find(sub, offset + sub.length());
  }

  return count;
}

// [[Rcpp::export]]
IntegerVector pystr_count_(CharacterVector strs, std::string sub, int start, int end) {
  int input_size = strs.size();
  IntegerVector output(input_size);

  for(int i = 0; i < input_size; i++){
    if(strs[i] == NA_STRING){
      output[i] = NA_INTEGER;
    } else {
      output[i] = str_count(Rcpp::as<std::string>(strs[i]), sub, start, end);
    }
  }

  return output;
}
