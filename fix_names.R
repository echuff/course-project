# This function will standardize a mean or std variable name by removing the existing reference to "mean" or "std"
# in the name and adding "_mean" or "_std" at the end of the name. If the name does not reference the word "mean" or
# "std", the function returns the name unchanged.

fix_names <- function(x) {
  if (!(length(grep("-mean()", x, fixed=TRUE))) == 0) {
    y <- sub('-mean()', '', x, fixed=TRUE)
    x <- paste(y, '_mean', sep='')
  }
  if (!(length(grep("-std()", x, fixed=TRUE))) == 0) {
    y <- sub('-std()', '', x, fixed=TRUE)
    x <- paste(y, '_std', sep='')
  }
  if (!(length(grep("-meanFreq()", x, fixed=TRUE))) == 0) {
    y <- sub('-meanFreq()', '-Freq', x, fixed=TRUE)
    x <- paste(y, '_mean', sep='')
  }
  return(x)
}