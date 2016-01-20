#include <Rcpp.h>
using namespace Rcpp;

bool str_isupper(std::string str){

  unsigned int input_size = str.size();
  unsigned int check_nonalpha = 0;

  for(unsigned int i = 0; i < input_size; i++){
    if(!isupper(str[i])){
      if(isalpha(str[i])){
        return false;
      }
      check_nonalpha++;
    }
  }
  if(check_nonalpha == input_size){
    return false;
  }
  return true;
}

//[[Rcpp::export]]
LogicalVector pystr_isupper_(CharacterVector strs){

  unsigned int input_size = strs.size();
  LogicalVector output(input_size);

  for(unsigned int i = 0; i < input_size; i++){
    if(strs[i] == NA_STRING){
      output[i] = NA_LOGICAL;
    } else {
      output[i] = str_isupper(Rcpp::as<std::string>(strs[i]));
    }
  }

  return output;
}
