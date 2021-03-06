## A pair of functions that cache the inverse of a matrix
 ## Creates a special matrix object that can cache its inverse
 CacheMatrix <- function( m = matrix() ) {
 
 	## Initialize the inverse property
     i <- NULL
 
     ## Method to set the matrix
     set <- function( matrix ) {
             m <<- matrix
             i <<- NULL
     }
 
     ## Method the get the matrix
     get <- function() {
     	## Return the matrix
     	m
     }
 
     ## Method to set the inverse of the matrix
     setInv <- function(inverse) {
         i <<- inverse
     }
 
     ## Method to get the inverse of the matrix
     getInverse <- function() {
         ## Return the inverse property
         i
     }
 
     ## Return a list of the methods
     list(set = set, get = get,
          setInv = setInv,
          getInverse = getInverse)
 }
 
 
 cacheSolve <- function(x, ...) {
 
     ## Return a matrix that is the inverse of 'x'
     m <- x$getInverse()
 
     ## Just return the inverse if its already set
     if( !is.null(m) ) {
             message("getting cached data")
             return(m)
     }
 
     ## Get the matrix from the object
     data <- x$get()
 
     m <- solve(data)
 
     ## Set the inverse to the object
     x$setInv(m)
 
     ## Return the matrix m
     m
 }
