## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        y = solve(x)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        sol <- x$solve()
        if(!is.null(sol)) {
                message("Has already been inverted.  Getting cached data")
                return(sol)  # Return the previously cached data
        }
        
        # The matrix has not been inverted yet, so we need to invert it
        data <- x$get()
        sol <- solve(x, ...)
        # x$setmean(m)       
       
       
       
       # y <- solve(x)
        ##Computing the inverse of a square matrix can be done with the solve function in R.
        ##For example, if X is a square invertible matrix, then solve(X) returns its inverse.

}
