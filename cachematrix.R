## This R code compute inverse of a matrix and cache it for future use,instead of computing it repeatedly.
## Here,a list of function is defined which set matrix data,get matrix data,compute inverse of matrix and store it.

## makeCacheMatrix:This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x =matrix()){
  mi <- NULL
  set <- function(y) {
    x <<-y
    mi <<- NULL
  }
  get <- function()x
  setMatInv <- function(MatInv) mi <<- MatInv
  getMatInv <- function() mi
  list(set = set, get = get,
       setMatInv = setMatInv,
       getMatInv = getMatInv)
}

##cacheSolve:This function computes the inverse of the special "matrix" 
##..returned by makeCacheMatrix above. If the inverse has already been calculated 
##..(and the matrix has not changed), then the cachesolve should retrieve
##..the inverse from the cache.

cacheSolve <- function(x, ...) {
  mi <- x$getMatInv()
  if(!is.null(mi)) {
    message("getting cached data")
    return(mi)
  }
  data <- x$get()
  mi <- solve(data, ...)
  x$setMatInv(m)
  mi
}


