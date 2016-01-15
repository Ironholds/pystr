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
CharacterVector pystr_capitalize_(CharacterVector strs){

  unsigned int input_size = strs.size();
  unsigned int individual_size;
  std::string holding;

  for(unsigned int i = 0; i < input_size; i++){
    individual_size = strs[i].size();
    if(individual_size > 0 && strs[i] != NA_STRING){
      holding = Rcpp::as<std::string>(strs[i]);
      holding = str_tolower(holding);
      holding[0] = toupper(holding[0]);
      strs[i] = holding;
    }
  }
  return strs;
}
