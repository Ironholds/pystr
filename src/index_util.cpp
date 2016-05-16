#include <Rcpp.h>
#include "index_util.h"

int idx(int i, int len) {
  int j = floor(i / len);
  return i - (len * j);
}
