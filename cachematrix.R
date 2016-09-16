## This function creates a special"matrix" object that can cache its inverse

## the function computes the inverse of the special "matrix" returned by  the object "makeCacheMatrix"

makeCacheMatrix <- function(x = matrix()){
inv <- NULL
set <- function(y){
  x<<-y
  inv <<- NULL
}
get <- function() x
setInverse <-function(inverse)inv <<-inverse
getInverse <- function()inv
list(set=set,get=get,
     setInverse=setInverse,
     getInverse=getInverse)
}

## the following function now computes the inverse of the "matrx" created by the "makeCachematrix" function above.The function however first checks to see if the inverse has already been
##calculated.If so it gets the inverse from the cache and skips the computaion
##If not already calculated the function returns thhe inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if (!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
 data <-x$get()
 inv <-inv(data,...)
 x$setInverse(inv)
 inv
}
