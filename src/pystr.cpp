#include <Rcpp.h>
using namespace Rcpp;

//A function for lowercasing an entire string. C++'s string-lowering only works
//on single characters at a time
std::string str_tolower(std::string str){
  unsigned int input_size = str.size();
  for(unsigned int i = 0; i < input_size; i++){
    str[i] = tolower(str[i]);
  }
  return str;
}

// The actual function for capitalising. To avoid faffing with "okay, is this
// string >1 character long?" it just lowercases the entire thing and then upper
// cases the first character, assuming it isn't a 0-length string. It's vectorised
// and so should be pretty fast.
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
