  ## Put comments here that give an overall description of what your
  ## functions do
  
  ## makeCacheMatrix function makes a list of functions:
  ## set the value of the matrix
  ## get the value of the matrix
  ## set the value of inverse of the matrix
  ## get the value of inverse of the matrix
  
  makeCacheMatrix <- function(x = matrix()) {
  
    inv <- NULL
    set <-function(y) {
      x <<- y
      inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
  }
  
  
  ## cacheSolve function returns the inverse of the matrix.
  ## If the inverse has alredy been computed than 
  ## it gets result and skips the computation
  
  cacheSolve <- function(x, ...) {
          ## Return a matrix that is the inverse of 'x'
  
  ## If the matris is not square than it breaks computation
    
      if(ncol(x$get()) != nrow(x$get())) {
      message("The matrix is not square")
      return (NULL)
    }
    inv <- x$getinverse()
    if(!is.null(inv)) {
      message("getting cached data.")
      return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setinverse(inv)
    inv
    
  }
