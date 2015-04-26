## To compute the inverse of a matrix and cache it to avoid future
## computation of th einverse for the matrix
## Note: Assumes the matrix supplied is always invertible

###
# This function, for a given matrix, creates a special "matrix" object
# that can cache its inverse.
# <<- Operator ensures that he matrix and inverse are updating in the 
# special "matrix" object
###
makeCacheMatrix <- function(x = matrix()) {
    xinv <- NULL
    set <- function(y) {
        x <<- y
        xinv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) xinv <<- inverse
    getinverse <- function() xinv
    list(set = set, get = get,
        setinverse = setinverse,
        getinverse = getinverse)
}


###
# This function computes the inverse of the special "matrix" returned by 
# makeCacheMatrix above. If the inverse has already been calculated (and
# the matrix has not changed), then the cachesolve will retrieve the inverse
# from the cache.
# Note: Assumes the matrix supplied is always invertible
###
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    xinv <- x$getinverse()
    if(!is.null(xinv)) {
        message("Returned cached inverse for the matrix")
        return(xinv)
    }
    m <- x$get()
    xinv <- solve(m)
    x$setinverse(xinv)
    xinv
}
