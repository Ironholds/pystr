#include <Rcpp.h>
using namespace Rcpp;

std::string str_tolower(std::string str){
  unsigned int input_size = str.size();
  for(unsigned int i = 0; i < input_size; i++){
    str[i] = tolower(str[i]);
  }
  return str;
}

//[[Rcpp::export]]
std::vector < std::string > pystr_capitalize_(std::vector < std::string > strs){

  unsigned int input_size = strs.size();
  unsigned int individual_size;

  for(unsigned int i = 0; i < input_size; i++){
    individual_size = strs[i].size();
    if(individual_size > 0){
      strs[i] = str_tolower(strs[i]);
      strs[i][0] = toupper(strs[i][0]);
    }
  }
  return strs;
}
