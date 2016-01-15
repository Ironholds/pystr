#include <Rcpp.h>
using namespace Rcpp;

std::string center_single(std::string initial_string, int& width, char& fill_char){

  //If the intended width is less than or equal to the length of the initial string, return that string.
  if(width <= initial_string.size()){
    return initial_string;
  }

  //Calculate how many characters in each place
  int delta = (width - initial_string.size());
  int pre_initial = (int) ceil(delta/2);
  int post_initial = (delta - pre_initial);

  initial_string.insert(0, pre_initial, fill_char);
  initial_string.insert(initial_string.size(), post_initial, fill_char);

  return initial_string;

}

// [[Rcpp::export]]
CharacterVector pystr_center_(CharacterVector strs, int width, char fillchar){

  int& width_ref = width;
  char& fill_ref = fillchar;

  for(unsigned int i = 0; i < strs.size(); i++){
    if(strs[i] != NA_STRING){
      strs[i] = center_single(Rcpp::as<std::string>(strs[i]), width_ref, fill_ref);
    }
  }

  return strs;
}
