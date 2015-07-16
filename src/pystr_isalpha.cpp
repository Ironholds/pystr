#include <Rcpp.h>
using namespace Rcpp;

bool str_isalpha(std::string str){

  unsigned int input_size = str.size();

  for(unsigned int i = 0; i < input_size; i++){
    if(!isalpha(str[i])){
      return false;
    }
  }
  return true;
}

//[[Rcpp::export]]
std::vector < bool > pystr_isalpha_(std::vector < std::string > strs){

  unsigned int input_size = strs.size();
  std::vector < bool > output(input_size);

  for(unsigned int i = 0; i < input_size; i++){
    output[i] = str_isalpha(strs[i]);
  }

  return output;
}
