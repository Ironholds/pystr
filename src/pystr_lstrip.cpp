#include <Rcpp.h>
using namespace Rcpp;

std::string leftstrip(std::string input_str, std::string chars){
  unsigned int input_size = input_str.size();
  unsigned int final_start = 0;
  for( unsigned int i= 0; i<input_size; i++){
    std::size_t found = chars.find( input_str[i] ); 
    //if string is found
    if(found != std::string::npos)
      final_start++;
    else
      break;  
  }
  
  if(final_start==0)
    return input_str;
  else
    return input_str.substr(final_start);
}


//[[Rcpp::export]]
CharacterVector pystr_lstrip_(CharacterVector strs, std::string chars){
  unsigned int vector_size = strs.size();
  for(unsigned int i=0;i<vector_size;i++){
    if( strs[i].size()!=0 && strs[i]!=NA_STRING)
      strs[i] = leftstrip( Rcpp::as<std::string>(strs[i]), chars );
  }
  return strs;
}

