#include <Rcpp.h>
using namespace Rcpp;

std::string rightstrip(std::string input_str, std::string chars){
  unsigned int input_size = input_str.size();
  unsigned int final_size = input_size;
  for( int i= (input_size-1); i>=0; i--){
    std::size_t found = chars.find( input_str[i] ); 
    //if string is found
    if(found != std::string::npos)
      final_size --;
    else
      break;  
  }
  
  if(final_size==input_size)
    return input_str;
  else
    return input_str.substr(0, final_size);
}


//[[Rcpp::export]]
CharacterVector pystr_rstrip_(CharacterVector strs, std::string chars){
  unsigned int vector_size = strs.size();
  for(unsigned int i=0;i<vector_size;i++){
    if( strs[i].size()!=0 && strs[i]!=NA_STRING)
      strs[i] = rightstrip( Rcpp::as<std::string>(strs[i]), chars );
  }
  return strs;
}
